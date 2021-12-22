import 'dart:async';
import 'package:QuantumWebServiceGeralREST/source/dao_impl/custumer_dao_impl.dart';
import 'package:QuantumWebServiceGeralREST/source/util/const.dart';
import 'package:QuantumWebServiceGeralREST/source/util/util.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class CustumerService {
  static const PATH_BEGIN = Const.PATH_ROOT + "/";
  Router router;
  CustumerService(this.router) {
    router.get(PATH_BEGIN, getAll);
  }

  FutureOr<Response> getAll(Request req) async {
    try {
      final dao = CustomerDaoImpl();
      final clientes = await dao.getAll();
      final maps = clientes.map((e) => e.toMap()).toList();

      return Util.responseOkJsonList(maps);
    } catch (e) {
      return Response.internalServerError(body: e);
    }
  }
}
