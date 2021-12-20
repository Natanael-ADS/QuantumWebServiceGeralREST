import 'dart:async';
import 'dart:convert';

import 'package:QuantumWebServiceGeralREST/source/dao/config_mobile_dao.dart';
import 'package:QuantumWebServiceGeralREST/source/dao_impl/config_mobile_dao_impl.dart';
import 'package:QuantumWebServiceGeralREST/source/util/const.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ConfigMobileService {
  static const PATH_INICIAL = Const.PATH_ROOT + "/";
  final Router router;

  ConfigMobileService(this.router) {
    router.get(PATH_INICIAL, getAll);
  }

  FutureOr<Response> getAll(Request request) async {
    ConfigMobileDao dao = ConfigMobileDaoImpl();
    try {
      final results = await dao.getAll();
      final maps = results.map((e) => e.toMap()).toList();

      return Response.ok(
        json.encode(maps),
        headers: Const.CONTENT_TYPE_JSON,
      );
    } catch (e) {
      return Response.internalServerError(body: e);
    }
  }
}
