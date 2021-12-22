import 'package:QuantumWebServiceGeralREST/source/unity/custumer.dart';

abstract class CustomerDao {
  Future<List<Customer>> getAll();

  Future<Customer> update({
    required Customer customer,
  });

  Future<Customer> save({
    required Customer customer,
  });

  Future<List<Customer>> getDateUpdateFromOffSetLimit({
    required String lastDatetime,
    required int offset,
    required int limit,
  });

  Future<List<Customer>> getDateUpdateFromLastDatetime({
    required String lastDatetime,
  });

  List sequenceToSave({required Customer customer});

  Future<int> getCodeCustomer({required String uuid});
}
