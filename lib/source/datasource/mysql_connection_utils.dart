import 'package:mysql_utils/mysql_utils.dart';

class MySQL {
  MySQL._();

  static final MySQL instance = MySQL._();

  static late MysqlUtils _database;

  get database async {
    // ignore: unnecessary_null_comparison
    if (_database != null) {
      return _database;
    }

    return await _initDatabase();
  }

  static Future<MysqlUtils> getDB() async {
    // ignore: prefer_conditional_assignment, unnecessary_null_comparison
    if (_database == null) {
      _database = await _initDatabase();
    }
    return _database;
  }

  static Future<MysqlUtils> _initDatabase() async {
    return MysqlUtils(
      settings: await _connection(),
      errorLog: (error) {
        print('|$error\n├───────────────────────────');
      },
      sqlLog: (sql) {
        print('|$sql\n├───────────────────────────');
      },
    );
  }

  static Future<ConnectionSettings> _connection() async {
    return ConnectionSettings(
      host: 'localhost',
      port: 3370,
      user: 'quantum',
      password: 'quantum28042004',
      db: 'lmark',
      useCompression: false,
      useSSL: false,
      timeout: const Duration(seconds: 30),
    );
  }
}
