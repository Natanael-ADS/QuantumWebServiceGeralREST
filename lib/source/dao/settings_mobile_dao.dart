import 'package:QuantumWebServiceGeralREST/source/unity/settings_mobile.dart';

abstract class SettingsMobileDao {
  Future<List<SettingsMobile>> getAll();
}
