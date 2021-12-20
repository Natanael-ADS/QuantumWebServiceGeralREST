import 'package:QuantumWebServiceGeralREST/source/service/config_mobile/config_mobile_service.dart';
import 'package:functions_framework/functions_framework.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

@CloudFunction()
Future<Response> function(Request request) async {
  final router = Router();

  ConfigMobileService(router);

  return router(request);
}
