import 'package:QuantumWebServiceGeralREST/source/dao/settings_mobile_dao.dart';
import 'package:QuantumWebServiceGeralREST/source/datasource/mysql_connection.dart';
import 'package:QuantumWebServiceGeralREST/source/unity/settings_mobile.dart';

class SettingsMobileDaoImpl implements SettingsMobileDao {
  late MySQL datasource;

  SettingsMobileDaoImpl() {
    datasource = MySQL();
  }

  @override
  Future<List<SettingsMobile>> getAll() async {
    String script = '''
      SELECT imei, tipo, value FROM config_mobile
    ''';

    final results = await datasource.getQuery(sql: script);

    return results.map((e) => SettingsMobile.fromMap(e.fields)).toList();
  }
}
