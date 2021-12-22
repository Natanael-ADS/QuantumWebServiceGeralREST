import 'package:QuantumWebServiceGeralREST/source/datasource/mysql_connection_utils.dart';
import 'package:test/test.dart';

void main() {
  test('mysql connection utils ...', () async {
    final db = await MySQL.getDB();

    final results = await db.query("select codigo from clientes limit 1", []);

    expect(results, isNotEmpty);
  });
}
