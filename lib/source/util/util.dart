import 'dart:convert';

import 'package:diacritic/diacritic.dart';
import 'package:intl/intl.dart';
import 'package:shelf/shelf.dart';

import 'const.dart';

class Util {
  static Response responseOkJson(Map<String, dynamic> map) {
    return Response.ok(json.encode(map), headers: Const.CONTENT_TYPE_JSON);
  }

  static Response responseOkJsonList(List<Map<String, dynamic>> maps) {
    return Response.ok(json.encode(maps), headers: Const.CONTENT_TYPE_JSON);
  }

  static String getStringFromDateTime(String data) {
    List<String> calendario = data.replaceAll(RegExp("[/-]"), " ").split(" ");
    String dia = calendario[0];
    String mes = calendario[1];
    String ano = calendario[2];
    String hora = calendario[3];

    String datahora = "$ano-$mes-$dia $hora";

    return datahora.toString();
  }

  static String getStringFromDate(DateTime date) {
    return DateFormat(Const.FORMAT_DATE_TIME).format(date);
  }

  static DateTime strToDate(String data) {
    try {
      if (data.contains('.')) {
        data = data.split(".")[0];
      }

      DateFormat formatter = DateFormat(Const.FORMATO_DATE);
      DateTime date = formatter.parse(data);
      return date;
    } on Exception catch (e) {
      print(e);
      return Const.DATETIME_INVALIDATE;
    }
  }

  static DateTime getDate(String dbDate, String format) {
    try {
      DateFormat dateFormat = DateFormat(format);
      DateTime data = dateFormat.parse(dbDate);

      return data;
    } on Exception catch (e) {
      print(e);
      return Const.DATETIME_INVALIDATE;
    }
  }

  static String doubleToString(double number) {
    NumberFormat nf = NumberFormat("0.00");
    return nf.format(number);
  }

  static double stringToDouble(String number) {
    return double.parse(Util.doubleCommaToPoint(number));
  }

  static String doubleCommaToPoint(String number) {
    if (number.isEmpty) {
      number = "0.00";
    }
    number = number.replaceAll(",", ".");

    return number;
  }

  static DateTime getDateTimeCurrent() {
    return DateTime.now();
  }

  static String lpad(String valueToPad, String filler, int size) {
    while (valueToPad.length < size) {
      valueToPad = filler + valueToPad;
    }
    return valueToPad;
  }

  static String rpad(String valueToPad, String filler, int size) {
    while (valueToPad.length < size) {
      valueToPad = valueToPad + filler;
    }
    return valueToPad;
  }

  static String removeAccents(String texto) {
    try {
      texto = removeDiacritics(texto);
      return texto;
    } on Exception catch (e) {
      print(e);
      return texto;
    }
  }
}
