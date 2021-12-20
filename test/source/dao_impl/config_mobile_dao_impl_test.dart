import 'package:QuantumWebServiceGeralREST/source/dao_impl/config_mobile_dao_impl.dart';
import 'package:test/test.dart';

void main() {
  final daoImpl = ConfigMobileDaoImpl();

  test('return List<ConfigMobile> Success', () async {
    final results = await daoImpl.getAll();

    expect(results, isNotEmpty);
  });
}
