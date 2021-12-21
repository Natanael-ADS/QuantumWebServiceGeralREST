import 'package:QuantumWebServiceGeralREST/source/util/const.dart';
import 'package:QuantumWebServiceGeralREST/source/util/util.dart';
import 'package:test/test.dart';

void main() {
  test('util.getStringFromDateTime ...', () async {
    final result = Util.getStringFromDateTime("21/12/2021 10:03:00");

    expect(result, "2021-12-21 10:03:00");
  });

  test('util.getStringFromDate ...', () async {
    var now = DateTime(2021, 12, 21, 10, 03, 00);
    final result = Util.getStringFromDate(now);

    expect(result, "21/12/2021 10:03:00");
  });

  test('util.strToDate ...', () async {
    final result = Util.strToDate("21/12/2021 10:03:00");

    expect(result.toString(), "2021-12-21 00:00:00.000");
  });

  test('util.getDate ...', () async {
    var result = Util.getDate("21/12/2021", Const.FORMATO_DATA);
    expect(result.toString(), "2021-12-21 00:00:00.000");

    result = Util.getDate("21/12/2021 13:15:00", Const.FORMATO_DATA_HORA);
    expect(result.toString(), "2021-12-21 13:15:00.000");

    result = Util.getDate("2021-12-21 ", Const.FORMATO_DATA_BD);
    expect(result.toString(), "2021-12-21 00:00:00.000");

    result = Util.getDate("2021-12-21 13:15:00", Const.FORMATO_DATA_HORA_BD);
    expect(result.toString(), "2021-12-21 13:15:00.000");
  });

  test('util.doubleToString ...', () async {
    var result = Util.doubleToString(15);
    expect(result, "15.00");

    result = Util.doubleToString(15.50);
    expect(result, "15.50");
  });

  test('util.stringToDouble ...', () async {
    var result = Util.stringToDouble("15");
    expect(result, 15.00);

    result = Util.stringToDouble("15.50");
    expect(result, 15.50);
  });

  test('util.doubleCommaToPoint ...', () async {
    var result = Util.doubleCommaToPoint("15");
    expect(result, "15");

    result = Util.doubleCommaToPoint("15,50");
    expect(result, "15.50");
  });

  test('util.removeAcentos ...', () async {
    var result = Util.removeAcentos("Natanael Cândido é amigão");

    expect(result, "Natanael Candido e amigao");
  });
}
