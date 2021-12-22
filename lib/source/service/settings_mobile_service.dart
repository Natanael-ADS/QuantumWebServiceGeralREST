// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'package:QuantumWebServiceGeralREST/source/dao_impl/settings_mobile_dao_impl.dart';
import 'package:QuantumWebServiceGeralREST/source/util/const.dart';
import 'package:QuantumWebServiceGeralREST/source/util/util.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class SettingsMobileService {
  static const PATH_BEGIN = Const.PATH_ROOT + "/";
  final Router router;

  SettingsMobileService(this.router) {
    router.get(PATH_BEGIN, getAll);
  }

  FutureOr<Response> getAll(Request request) async {
    try {
      final dao = SettingsMobileDaoImpl();
      final results = await dao.getAll();
      final maps = results.map((e) => e.toMap()).toList();

      return Util.responseOkJsonList(maps);
    } catch (e) {
      return Response.internalServerError(body: e);
    }
  }
}
