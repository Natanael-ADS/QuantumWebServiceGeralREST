import 'package:QuantumWebServiceGeralREST/source/dao_impl/custumer_dao_impl.dart';
import 'package:test/test.dart';

void main() {
  final dao = CustomerDaoImpl();
  test('return List<Cliente> dao.getAll ...', () async {
    final clientes = await dao.getAll();

    expect(clientes, isNotEmpty);
  });
}
