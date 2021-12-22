import 'package:QuantumWebServiceGeralREST/source/util/encryption.dart';
import 'package:test/test.dart';

void main() {
  test('encryption ...', () async {
    var value = "2021/12/21 09:48:55";

    final encryp = Encryption.encry(value, "Natanael", true);

    final descryp = Encryption.encry(encryp, "Natanael", false);
    expect(descryp, value);
  });
}
