import 'package:QuantumWebServiceGeralREST/source/service/settings_mobile_service.dart';
import 'package:functions_framework/functions_framework.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'source/service/custumer_service.dart';

@CloudFunction()
Future<Response> function(Request request) async {
  final router = Router();

  SettingsMobileService(router);
  CustumerService(router);

  return router(request);
}
