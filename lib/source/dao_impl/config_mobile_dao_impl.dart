import 'package:QuantumWebServiceGeralREST/source/dao/config_mobile_dao.dart';
import 'package:QuantumWebServiceGeralREST/source/datasource/mysql_connection.dart';
import 'package:QuantumWebServiceGeralREST/source/unity/config_mobile.dart';

class ConfigMobileDaoImpl implements ConfigMobileDao {
  static const TABLE = "config_mobile";
  static const COL_IMEI = "imei";
  static const COL_TIPO = "tipo";
  static const COL_VALUE = "value";

  late MySQL datasource;

  ConfigMobileDaoImpl() {
    datasource = MySQL();
  }

  @override
  Future<List<ConfigMobile>> getAll() async {
    String script = '''
      SELECT $COL_IMEI, $COL_TIPO, $COL_VALUE FROM $TABLE
    ''';

    final results = await datasource.getQuery(sql: script);

    return results.map((e) {
      return ConfigMobile(
        imei: e[COL_IMEI],
        tipo: e[COL_TIPO],
        value: e[COL_VALUE],
      );
    }).toList();
  }
}
