import 'package:QuantumWebServiceGeralREST/source/unity/config_mobile.dart';

abstract class ConfigMobileDao {
  Future<List<ConfigMobile>> getAll();
}
