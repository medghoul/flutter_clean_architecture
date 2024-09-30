import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:archive/archive.dart';
import 'package:bsmart/helpers/piusi_extensions.dart';
import 'package:bsmart/structures/class/apiErrorCode.dart';
import 'package:crclib/catalog.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:uuid/uuid.dart';

class Utils {
  static Uint8List getCRC16(Uint8List payload) {
    int crcValue = Crc16Modbus().convert(payload).toBigInt().toInt();
    Uint16List crcUint16 = Uint16List.fromList([crcValue]);
    Uint8List crcUint8 = Uint8List.fromList(crcUint16.buffer.asUint8List());
    crcUint8 = Uint8List.fromList(crcUint8.reversed.toList());
    return crcUint8;
  }

  static bool compareArray(Uint8List crc1, Uint8List crc2) {
    debugPrint('__crc1: $crc1 __crc2: $crc2');
    return jsonEncode(crc1) == jsonEncode(crc2);
  }

  static Uint8List appendUint8Array(Uint8List array1, Uint8List array2) {
    final tmp = Uint8List(array1.length + array2.length);
    tmp.setAll(0, array1);
    tmp.setAll(array1.length, array2);
    return tmp;
  }

  static Future<void> delay(int milliseconds) async {
    await Future.delayed(Duration(milliseconds: milliseconds));
  }

  static Uint8List concatArrayBuffers(List<Uint8List> buffers) {
    final totalBufferLength = buffers.fold(0, (sum, b) => sum + b.length);
    final unit8Arr = Uint8List(totalBufferLength);
    int offset = 0;
    for (var buffer in buffers) {
      unit8Arr.setAll(offset, buffer);
      offset += buffer.length;
    }
    return unit8Arr;
  }

  static String padLeft(String s, String fillChar, int size) {
    return s.padLeft(size, fillChar);
  }

  static int number2bcd(int dec) {
    return int.parse(dec.toRadixString(10), radix: 16);
  }

  static int bcd2number(int bcd) {
    return int.parse(bcd.toRadixString(16), radix: 10);
  }

  static String timeStamp() {
    return DateFormat('yyyyMMddHHmmss.SS').format(DateTime.now());
  }

  static String toISOLocal(DateTime date) {
    String z(int n) => n.toString().padLeft(2, '0');
    String zz(int n) => n.toString().padLeft(3, '0');
    final off = date.timeZoneOffset;
    final sign = off.isNegative ? '-' : '+';
    final offset =
        '$sign${z(off.inHours.abs())}:${z(off.inMinutes.abs() % 60)}';
    return '${date.year}-${z(date.month)}-${z(date.day)}T${z(date.hour)}:${z(date.minute)}:${z(date.second)}.${zz(date.millisecond)}$offset';
  }

  static Uint8List str2ab(String str) {
    return Uint8List.fromList(utf8.encode(str));
  }

  static String ab2str(Uint8List buf) {
    return utf8.decode(buf);
  }

  static String randomName() {
    return '${DateTime.now().millisecondsSinceEpoch}${Random().nextInt(10000)}';
  }

  static Future<void> asyncForEach(
      List<dynamic> array, Function callback) async {
    for (var i = 0; i < array.length; i++) {
      debugPrint('ASYNC CALLBACK FOR $i -- ${array[i]}');
      await callback(array[i], i, array);
    }
  }

  static DateTime apiDateToJsDate(String date) {
    final convertedDate = date.replaceAllMapped(
      RegExp(r'^(\d{4})(\d\d)(\d\d)(\d\d)(\d\d)(\d\d)$'),
      (match) =>
          '${match[2]}/${match[3]}/${match[1]} ${match[4]}:${match[5]}:${match[6]}',
    );
    return DateTime.parse(convertedDate);
  }

  static Uint8List base64ToArrayBuffer(String base64) {
    final List<int> bytes = base64Decode(base64);
    return Uint8List.fromList(bytes);
  }

  static bool checkCompatibility(dynamic lastCompatibility, dynamic data) {
    if (lastCompatibility != null) {
      try {
        final lastCompatibilityArray =
            lastCompatibility['applicationVersion'].split('.');
        final lastCompatibilityAppRelease =
            (int.parse(lastCompatibilityArray[0]) * 10000) +
                (int.parse(lastCompatibilityArray[1]) * 100) +
                int.parse(lastCompatibilityArray[2]);

        debugPrint("APP VERSION -> $data");

        final currentAppReleaseArray = data.split('.');
        final currentAppRelease =
            (int.parse(currentAppReleaseArray[0]) * 10000) +
                (int.parse(currentAppReleaseArray[1]) * 100) +
                int.parse(currentAppReleaseArray[2]);

        if (currentAppRelease < lastCompatibilityAppRelease) {
          return false;
        } else {
          return true;
        }
      } catch (exc) {
        return true;
      }
    } else {
      return true;
    }
  }

  static double convertFromLiter(double value, int udmDestination) {
    switch (udmDestination) {
      case 0:
        return value;
      case 1: // from liter to gal
        return (value * 0.26417250012978);
      case 2: // from liter to qt
        return (value * 1.05669);
      case 3: // from liter to pints
        return (value * 2.11338);
      default:
        return value;
    }
  }

  static double convertFromGallon(double value, int udmDestination) {
    switch (udmDestination) {
      case 0: // da galloni a litri
        return value * 3.78541;
      case 1: // da galloni a galloni
        return value;
      case 2: // da galloni a quarti
        return value * 4;
      case 3: // da galloni a pinte
        return value * 8;
      default:
        throw ArgumentError('Unità di destinazione non valida');
    }
  }

  static double convertFromQuarts(double value, int udmDestination) {
    switch (udmDestination) {
      case 0: // da quarti a litri
        return value * 0.946353;
      case 1: // da quarti a galloni
        return value * 0.25;
      case 2: // da quarti a quarti
        return value;
      case 3: // da quarti a pinte
        return value * 2;
      default:
        throw ArgumentError('Unità di destinazione non valida');
    }
  }

  static double convertFromPints(double value, int udmDestination) {
    switch (udmDestination) {
      case 0: // da pinte a litri
        return value * 0.473176;
      case 1: // da pinte a galloni
        return value * 0.125;
      case 2: // da pinte a quarti
        return value * 0.5;
      case 3: // da pinte a pinte
        return value;
      default:
        throw ArgumentError('Unità di destinazione non valida');
    }
  }

  static double convertQuantity(
      double value, int udmSource, int udmDestination) {
    switch (udmSource) {
      case 0: // litri
        return convertFromLiter(value, udmDestination);
      case 1: // galloni
        return convertFromGallon(value, udmDestination);
      case 2: // quarti
        return convertFromQuarts(value, udmDestination);
      case 3: // pinte
        return convertFromPints(value, udmDestination);
      default:
        throw ArgumentError('Unità di origine non valida');
    }
  }

  static double convertToLiter(double value, int udm) {
    switch (udm) {
      case 0: // litri a litri
        return value;
      case 1: // galloni a litri
        return value / 0.26417250012978;
      case 2: // quarti a litri
        return value / 1.05669;
      case 3: // pinte a litri
        return value / 2.11338;
      default:
        throw ArgumentError('Unità non valida');
    }
  }

  static double convertLevel(double level, int udmLevel) {
    switch (udmLevel) {
      case 0:
        return level;
      case 1: // from mm to inch
        return level / 25.4;
      default:
        throw ArgumentError('Unità non valida');
    }
  }

  static double convertTomm(double level, int udmLevel) {
    switch (udmLevel) {
      case 0:
        return level;
      case 1: // from inch to mm
        return level * 25.4;
      default:
        throw ArgumentError('Invalid unit');
    }
  }

  /// converti misura di livello in unità di misura dell'OCIO
  /// @param level
  /// @param udmLevel
  static double convertToUdmOCIO(double level, int udmLevel) {
    switch (udmLevel) {
      case 0:
        return level;
      case 1: // from inch to decimal inch
        return level * 10;
      default:
        throw ArgumentError('Invalid unit');
    }
  }

  /// converte da mm a inch
  /// @param level
  static double convertToInch(double level) {
    return level * 0.0393701;
  }

  static List<dynamic> getArrayFromObject(Map<dynamic, dynamic> obj) {
    final array = [];
    for (var key in obj.keys) {
      array.add(obj[key]);
    }
    return array;
  }

  /// converte data UTC in formato yyyyMMddHHmmss in data in formato locale
  /// @param date
  static String formatDateTimeUtc(String date) {
    return DateFormat('yyyy-MM-dd HH:mm:ss')
        .format(DateTime.parse(date).toUtc());
  }

  /// converte data in formato yyyyMMddHHmmss in data in formato locale
  /// @param date
  static String formatDateTime(String date) {
    return DateFormat('yyyy-MM-dd HH:mm:ss')
        .format(DateTime.parse(date).toLocal());
  }

  /// converte data in formato custom in data in formato locale
  static String formatDate(String date) {
    return DateFormat('yyyy-MM-dd').format(DateTime.parse(date));
  }

  /// Ottiene la data e l'ora correnti nel formato locale.
  static String getDatetimeNow() {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
  }

  /// Arrotonda un numero al numero specificato di cifre decimali.
  static double roundNumber(double num, int d) {
    return d == 1
        ? (num * 10).roundToDouble() / 10
        : d == 2
            ? (num * 100).roundToDouble() / 100
            : d == 3
                ? (num * 1000).roundToDouble() / 1000
                : num;
  }

  /// Confronta due stringhe di versione firmware.
  static int compareFwVersion(String v1, String v2) {
    final List<String> partsV1 = v1.split('.');
    final List<String> partsV2 = v2.split('.');
    final int k =
        partsV1.length < partsV2.length ? partsV1.length : partsV2.length;
    for (int i = 0; i < k; ++i) {
      final int numV1 = int.parse(partsV1[i]);
      final int numV2 = int.parse(partsV2[i]);
      if (numV1 > numV2) return 1;
      if (numV1 < numV2) return -1;
    }
    return partsV1.length == partsV2.length
        ? 0
        : (partsV1.length < partsV2.length ? -1 : 1);
  }

  /// Converte ore e minuti in una rappresentazione stringa con AM/PM.
  static String hourConversion(DateTime date, int minutes) {
    final String pos = date.hour >= 12 ? 'PM' : 'AM';
    return '${date.hour % 12 == 0 ? 12 : date.hour % 12}:$minutes $pos';
  }

  /// Codifica una stringa esadecimale in un Uint8Array.
  static Uint8List encodeHexString(String str) {
    final List<int> a = [];
    for (int i = 0, len = str.length; i < len; i += 2) {
      a.add(int.parse(str.substring(i, i + 2), radix: 16));
    }
    return Uint8List.fromList(a);
  }

  /// Codifica una stringa ASCII in un Uint8Array.
  static Uint8List encodeAsciiString(String str, [int? maxLength]) {
    final int length = maxLength ?? str.length;
    final List<int> a = [];
    for (int i = 0; i < length; i++) {
      if (i < str.length) {
        a.add(str.codeUnitAt(i));
      } else {
        a.add(0);
      }
    }
    return Uint8List.fromList(a);
  }

  /// Formatta un numero inserendo un carattere di separazione ogni tre cifre.
  static String numberWithDigitSeparator(String val, [String car = ' ']) {
    val = val.toString();

    List<String> parts;
    String decimal = '';

    if (val.contains('.')) {
      parts = val.split('.');
      decimal = '.';
    } else if (val.contains(',')) {
      parts = val.split(',');
      decimal = ',';
    } else {
      parts = [val];
    }

    final List<String> revert = parts[0].split('').reversed.toList();
    String returnV = '';

    for (int index = 1; index <= revert.length; index++) {
      if (index % 3 == 0) {
        returnV += '${revert[index - 1]}$car';
      } else {
        returnV += revert[index - 1];
      }
    }

    returnV = returnV.split('').reversed.join('');

    for (int index = 1; index < parts.length; index++) {
      returnV += '$decimal${parts[index]}';
    }

    return returnV.trim();
  }

  /// Rimuove il carattere di separazione delle cifre da un numero.
  static String remouveNumberWithDigitSeparetor(String val,
      [String car = ' ']) {
    return val.toString().replaceAll(car, '');
  }

  /// Normalize odometer value (add ',0' if udm is hours and odo is integer)
  /// before manage the digits sepatator
  static String odometerWithDigitSeparetor(String odometer, dynamic udmOdometer,
      [String car = ' ']) {
    if (udmOdometer == 3 || udmOdometer == 'K_OT_HOURS') {
      return numberWithDigitSeparator(
          double.parse(odometer).toStringAsFixed(1), car);
    }
    return numberWithDigitSeparator(odometer, car);
  }

  /// Convert odometer value to write inside the CU memory
  /// for udm in hours with decimal value
  static String convertOdometerToCU(num odometer, [num? udmOdometer]) {
    if (udmOdometer == 3) {
      odometer = odometer * 10 + 2147483648;
    }
    return odometer.toString();
  }

  /// Convert odometer value readed from CU memory
  /// for udm in hours with decimal value
  static String convertOdometerFromCU(num odometer, [num? udmOdometer]) {
    if (udmOdometer == 3) {
      odometer = (odometer - 2147483648) / 10;
    }
    return odometer.toString();
  }

  ///retrieve app version
  static Future<({int major, int minor, int patch})> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appVersion = packageInfo.version;

    List<String> app = appVersion.split(".");
    return (
      major: int.parse(app[0]),
      minor: int.parse(app[1]),
      patch: int.parse(app[2])
    );
  }

  /// decode json string
  static Map<String, T> decodeJSON<T>(String j) {
    final jsonLang = json.decode(j);
    return jsonLang
        .map<String, T>((key, value) => MapEntry(key.toString(), value as T));
  }

  /// encode map to json string
  static String encodeJSON(Map<String, dynamic> map) {
    return json.encode(map);
  }

  ///convertitore generico
  static T? convertValue<T>(String? value) {
    if (value == null) {
      return null;
    }
    if (T == int) {
      return int.tryParse(value.toString()) as T?;
    } else if (T == double) {
      return double.tryParse(value.toString()) as T?;
    } else if (T == bool) {
      if (value.toString().toLowerCase() == 'true') {
        return true as T;
      } else if (value.toString().toLowerCase() == 'false') {
        return false as T;
      } else {
        return null;
      }
    } else if (T == String) {
      return value.toString() as T;
    } else {
      // Assuming value is already of type T or can be cast to T
      return value as T?;
    }
  }

  static int getPolicyVersion(String policyTitle) {
    final List<String> policyParts = policyTitle.split('-');
    final String policyVersion = policyParts.length > 1 ? policyParts.last : '';
    return int.parse(policyVersion);
  }

  static ErrorCode intToErrorCode(int value) {
    return ErrorCode.values.firstWhere((e) => errorCodeMap[e] == value,
        orElse: () => ErrorCode.UNKNOWN);
  }

  static String? calculateHash({required String content}) {
    try {
      Digest hash = md5.convert(utf8.encode(content));
      return hash.toString();
    } catch (e) {
      return null;
    }
  }

  static String generateUuid() {
    var uuid = const Uuid();
    return uuid.v4();
  }

  static T stringToEnum<T extends Enum>(String str, List<T> values) {
    return values.firstWhere(
      (e) => e.name.toLowerCase() == str.toLowerCase(),
    );
  }

  /// Codifica da stringa a binario (comprimendo il dato)
  static Uint8List encodeJsonIntoBin(String jsonString) {
    List<int> bytes = utf8.encode(jsonString);
    return compressBytes(bytes);
  }

  static Uint8List compressBytes(List<int> bytes) {
    var compressed = GZipEncoder().encode(bytes);
    return compressed != null ? Uint8List.fromList(compressed) : Uint8List(0);
  }

  static Uint8List decrompressBytes(Uint8List bytes) {
    return Uint8List.fromList(GZipDecoder().decodeBytes(bytes));
  }

  /// Decodifica binario (decomprimendo il dato)
  static String decodeBinIntoJson(Uint8List bin) {
    if (bin.isNotEmpty) {
      List<int> decompressed = GZipDecoder().decodeBytes(bin);
      String jsonString = utf8.decode(decompressed);
      return jsonString;
    } else {
      return '';
    }
  }

  static String formatOffset(Duration offset) {
    final sign = offset.isNegative ? '-' : '+';
    final hours = offset.inHours.abs().toString().padLeft(2, '0');
    final minutes = (offset.inMinutes.abs() % 60).toString().padLeft(2, '0');
    return '$sign$hours:$minutes';
  }

  static String formatPresetValue(double value, int decimalPlaces) {
    switch (decimalPlaces) {
      case 0:
        return value.toFixedNoRounding(0).padLeft(4, '0');
      case 1:
        if (value < 999.9) {
          return value.toFixedNoRounding(1).padLeft(5, '0');
        } else {
          return value.toFixedNoRounding(0).padLeft(4, '0');
        }
      case 2:
        if (value < 99.99) {
          return value.toFixedNoRounding(2).padLeft(5, '0');
        } else if (value < 999.9) {
          return value.toFixedNoRounding(1).padLeft(5, '0');
        } else {
          return value.toFixedNoRounding(0).padLeft(4, '0');
        }
      case 3:
        if (value < 9.999) {
          return value.toFixedNoRounding(3).padLeft(5, '0');
        } else if (value < 99.99) {
          return value.toFixedNoRounding(2).padLeft(5, '0');
        } else if (value < 999.9) {
          return value.toFixedNoRounding(1).padLeft(5, '0');
        } else {
          return value.toFixedNoRounding(0).padLeft(4, '0');
        }
      default:
        return value.toFixedNoRounding(0).padLeft(4, '0');
    }
  }
}
