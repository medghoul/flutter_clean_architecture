import 'dart:typed_data';

// Classe astratta per gli adattatori di ViewModel
abstract class ViewModelAdapter<T> {
  String getViewValue(T modelValue);
  T getModelValue(String viewValue);
}

// Adattatore per gestire valori di tipo generico
class IdentityAdapter extends ViewModelAdapter<dynamic> {
  @override
  String getViewValue(modelValue) => modelValue.toString();

  @override
  getModelValue(String viewValue) => viewValue;
}

// Adattatore per gestire valori di tipo String
class StringAdapter extends ViewModelAdapter<String> {
  @override
  String getViewValue(String modelValue) => modelValue;

  @override
  String getModelValue(String viewValue) => viewValue;
}

// Adattatore per gestire valori binari (Base 2)
class BinAdapter extends ViewModelAdapter<int> {
  @override
  String getViewValue(int modelValue) =>
      modelValue.toRadixString(2).padLeft(8, '0');

  @override
  int getModelValue(String viewValue) => int.parse(viewValue, radix: 2);
}

// Adattatore per gestire valori esadecimali (Base 16)
class HexAdapter extends ViewModelAdapter<int> {
  @override
  String getViewValue(int modelValue) =>
      modelValue.toRadixString(16).padLeft(2, '0');

  @override
  int getModelValue(String viewValue) => int.parse(viewValue, radix: 16);
}

// Adattatore per gestire valori interi
class IntAdapter extends ViewModelAdapter<int> {
  @override
  String getViewValue(int modelValue) => modelValue.toString();

  @override
  int getModelValue(String viewValue) => int.parse(viewValue);
}

// Adattatore per convertire un array di byte in una stringa e viceversa
class UInt8Array2StringAdapter extends ViewModelAdapter<Uint8List> {
  final int length;

  UInt8Array2StringAdapter(this.length);

  @override
  String getViewValue(Uint8List modelValue) =>
      String.fromCharCodes(modelValue);

  @override
  Uint8List getModelValue(String viewValue) {
    final modelValue = Uint8List(length);
    for (int i = 0; i < viewValue.length; i++) {
      modelValue[i] = viewValue.codeUnitAt(i);
    }
    return modelValue;
  }
}

// Adattatore per convertire un array di byte in una stringa esadecimale e viceversa
class UInt8Array2HexStringAdapter extends ViewModelAdapter<Uint8List> {
  final int length;

  UInt8Array2HexStringAdapter(this.length);

  @override
  String getViewValue(Uint8List modelValue) {
    final hex = modelValue.map((e) => e.toRadixString(16).padLeft(2, '0')).join();
    return hex;
  }

  @override
  Uint8List getModelValue(String viewValue) {
    final modelValue = Uint8List(length);
    for (int i = 0; i < length * 2; i += 2) {
      modelValue[i ~/ 2] = int.parse(viewValue.substring(i, i + 2), radix: 16);
    }
    return modelValue;
  }
}

// Adattatore per convertire un array di byte in una stringa esadecimale invertita e viceversa
class UInt8Array2HexStringAdapterREV extends ViewModelAdapter<Uint8List> {
  final int length;

  UInt8Array2HexStringAdapterREV(this.length);

  @override
  String getViewValue(Uint8List modelValue) {
    final hex = modelValue.reversed.map((e) => e.toRadixString(16).padLeft(2, '0')).join();
    return hex;
  }

  @override
  Uint8List getModelValue(String viewValue) {
    final modelValue = Uint8List(length);
    for (int i = 0; i < length * 2; i += 2) {
      modelValue[length - 1 - i ~/ 2] = int.parse(viewValue.substring(i, i + 2), radix: 16);
    }
    return modelValue;
  }
}

// Adattatore per convertire valori separati da virgole in un array di byte e viceversa
class CommaSeparatedNumbers2UInt8Array extends ViewModelAdapter<Uint8List> {
  final int length;

  CommaSeparatedNumbers2UInt8Array(this.length);

  @override
  String getViewValue(Uint8List modelValue) => modelValue.toString();

  @override
  Uint8List getModelValue(String viewValue) {
    final splitValues =
    viewValue.split(RegExp(r'\s*,\s*')).map(int.parse).toList();
    final modelValue = Uint8List(length);
    modelValue.setAll(0, splitValues);
    return modelValue;
  }
}

// Adattatore per convertire un numero in un array di byte di dimensione 1 e viceversa
class Uint8array2uint8number extends ViewModelAdapter<Uint8List> {
  @override
  String getViewValue(Uint8List modelValue) => modelValue[0].toString();

  @override
  Uint8List getModelValue(String viewValue) {
    final number = int.parse(viewValue);
    return Uint8List.fromList([number]);
  }
}

// Adattatore per convertire un numero in un array di byte di dimensione 2 e viceversa
class Uint8array2uint16number extends ViewModelAdapter<Uint8List> {
  @override
  String getViewValue(Uint8List modelValue) => ByteData.sublistView(modelValue).getUint16(0, Endian.little).toString();

  @override
  Uint8List getModelValue(String viewValue) {
    final number = int.parse(viewValue);
    final modelValue = Uint8List(2);
    ByteData.sublistView(modelValue).setUint16(0, number);
    return modelValue;
  }
}

// Adattatore per convertire un numero in un array di byte di dimensione 4 e viceversa
class Uint8array2uint32number extends ViewModelAdapter<Uint8List> {
  @override
  String getViewValue(Uint8List modelValue) {
    final byteData = ByteData.sublistView(Uint8List.fromList(modelValue));
    return byteData.getUint16(0, Endian.little).toString();
  }

  @override
  Uint8List getModelValue(String viewValue) {
    final number = int.parse(viewValue);
    final modelValue = Uint8List(4);
    ByteData.sublistView(modelValue).setUint32(0, number, Endian.little);
    return modelValue;
  }
}

// Adattatore per convertire un numero in un array di byte di dimensione 4 e viceversa
class Uint8array2int32number extends ViewModelAdapter<Uint8List> {
  @override
  String getViewValue(Uint8List modelValue) =>
      ByteData.sublistView(Uint8List.fromList(modelValue)).getInt32(0).toString();

  @override
  Uint8List getModelValue(String viewValue) {
    final number = int.parse(viewValue);
    final modelValue = Uint8List(4);
    ByteData.sublistView(modelValue).setInt32(0, number);
    return modelValue;
  }
}

// Adattatore per convertire un numero in un array di byte di dimensione variabile e viceversa
class Uint8array2bigNumber extends ViewModelAdapter<Uint8List> {
  final int lengthBytes;

  Uint8array2bigNumber(this.lengthBytes);

  @override
  String getViewValue(Uint8List modelValue) {
    final hexString = modelValue.reversed.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join('');
    final bigNumber = BigInt.parse(hexString, radix: 16);
    return bigNumber.toString();
  }

  @override
  Uint8List getModelValue(String viewValue) {
    final bigNumber = BigInt.parse(viewValue);
    final hexString = bigNumber.toUnsigned(lengthBytes * 8).toRadixString(16).padLeft(lengthBytes * 2, '0');
    final modelValue = Uint8List(lengthBytes);

    for (int i = 0; i < hexString.length; i += 2) {
      modelValue[i ~/ 2] = int.parse(hexString.substring(i, i + 2), radix: 16);
    }

    return lengthBytes > 1 ? Uint8List.fromList(modelValue.reversed.toList()) : modelValue;
  }

}

// Adattatore per convertire una stringa UUID esadecimale in un BigInt e viceversa
class UuidHexToBigInt extends ViewModelAdapter<String> {
  @override
  String getViewValue(String data) {
    final uuidBytes = UInt8Array2HexStringAdapter(16).getModelValue(data);
    return ViewModelAdapters.BYTES2UINT128.getViewValue(uuidBytes);
  }

  @override
  String getModelValue(String data) => data;
}

// Classe che contiene tutte le istanze degli adattatori
class ViewModelAdapters {
  static final IdentityAdapter IDENTITY = IdentityAdapter();
  static final HexAdapter HEX = HexAdapter();
  static final BinAdapter BIN = BinAdapter();
  static final IntAdapter INT = IntAdapter();
  static final StringAdapter STRING = StringAdapter();

  static final Uint8array2bigNumber BYTES2UINT128 = Uint8array2bigNumber(16);
  static final Uint8array2bigNumber BYTES2UINT64 = Uint8array2bigNumber(8);
  static final Uint8array2uint32number BYTES2UINT32 = Uint8array2uint32number();
  static final Uint8array2uint16number BYTES2UINT16 = Uint8array2uint16number();
  static final Uint8array2int32number BYTES2INT32 = Uint8array2int32number();

  static final UInt8Array2StringAdapter BYTE162STRING = UInt8Array2StringAdapter(16);
  static final UuidHexToBigInt UUIDHEX2BIGINT = UuidHexToBigInt();
  static final UInt8Array2HexStringAdapter HEX2UINT8 = UInt8Array2HexStringAdapter(16);
  static final UInt8Array2HexStringAdapterREV IButtonAdapter = UInt8Array2HexStringAdapterREV(4);
}
