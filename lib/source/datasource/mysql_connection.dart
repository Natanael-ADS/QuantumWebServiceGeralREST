import 'package:dart_mysql/dart_mysql.dart';

class MySQL {
  Future<MySqlConnection> _getConnection() async {
    var settings = ConnectionSettings(
      host: 'localhost',
      db: 'lmark',
      port: 3370,
      user: 'quantum',
      password: 'quantum28042004',
    );
    return await MySqlConnection.connect(settings);
  }

  Future<Results> getQuery({
    required String sql,
    List<Object?>? objects,
  }) async {
    final result = await _getConnection();
    return await result.query(sql, objects);
  }
}
