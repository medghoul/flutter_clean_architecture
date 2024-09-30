import 'package:bsmart/helpers/piusi_extensions.dart';
import 'package:flutter/material.dart';
import 'package:bsmart/models/database/driver_model.dart';
import 'package:bsmart/services/conversionService.dart';
import 'package:bsmart/services/translatorService.dart';
import 'package:bsmart/dialogs/piusi_dialog.dart';

class DispenseDialogsUtil {
  static void showWorkingTimeDialog(BuildContext context, Driver driver) {
    if (driver.workingTimeLimitEnabled()) {
      var message = '';
      if (driver.calculateDispenseTimeLimit()) {
        message = TranslatorService.instance
            .translate('LABEL.WORKINGTIMEMESSAGE')
            .replaceAll('{today}',
                ConversionService.instance.formatDate(DateTime.now()));
      } else {
        message = TranslatorService.instance
            .translate('LABEL.NOWORKINGTIMEMESSAGE')
            .replaceAll('{today}',
                ConversionService.instance.formatDate(DateTime.now()));
      }

      var messageWeekly = '';
      var messageDaily = '';
      for (var element in driver.timeBound) {
        if (element.boundType == 'WEEKLY') {
          // ... (il resto del codice per il caso WEEKLY)
        } else if (element.boundType == 'DAY_PERIOD') {
          // ... (il resto del codice per il caso DAY_PERIOD)
        }
      }

      if (messageWeekly.isNotEmpty) {
        message +=
            TranslatorService.instance.translate('LABEL.WEEKBOUNDMESSAGE');
        message += messageWeekly;
      }

      if (messageDaily.isNotEmpty) {
        message +=
            TranslatorService.instance.translate('LABEL.DAYBOUNDMESSAGE');
        message += messageDaily;
      }

      showDialog(
          context: context,
          builder: (context) => PiusiDialog(
              title: TranslatorService.instance.translate('LABEL.WORKINGTIME'),
              subtitle: message));
    }
  }

  static void showDispenseLimitDialog(BuildContext context, Driver driver) {
    String title = '';
    String message = '';
    var maxAmount =
        ConversionService.instance.formatUserQuantity(driver.maxAmount ?? 0);

    if (driver.checkAmountLeft()) {
      switch (driver.boundType) {
        case 'MONTHLY':
          message = TranslatorService.instance
              .translate('LABEL.MONTHDISPENSEBOUND')
              .replaceAll('{quantityValue}', maxAmount)
              .replaceAll('{udmLabel}', '');
          break;
        case 'WEEKLY':
          var dayOfTheWeek = TranslatorService.instance
              .translate('label_${driver.dayReset.toLowerCase()}');
          message = TranslatorService.instance
              .translate('LABEL.WEEKDISPENSEBOUND')
              .replaceAll('{quantityValue}', maxAmount)
              .replaceAll('{udmLabel}', '')
              .replaceAll('{dayOfWeek}', dayOfTheWeek);
          break;
        case 'DAILY':
          message = TranslatorService.instance
              .translate('LABEL.DAYDISPENSEBOUND')
              .replaceAll('{quantityValue}', maxAmount)
              .replaceAll('{udmLabel}', '')
              .replaceAll('{days}', driver.interval.toString())
              .replaceAll(
                '{startDate}',
                ConversionService.instance
                    .formatDate(driver.startDate.toDateTime!),
              );
          break;
      }
    } else {
      title = TranslatorService.instance.translate('label_attention');
      message = TranslatorService.instance
          .translate('LABEL.LIMITEXPIRATION')
          .replaceAll(
            "{expDate}",
            ConversionService.instance
                .formatDate(driver.expirationDate.toDateTime!),
          )
          .replaceAll("{quantityValue}", maxAmount);
    }

    showDialog(
        context: context,
        builder: (context) => PiusiDialog(
              title: title,
              subtitle: message,
            ));
  }
}
