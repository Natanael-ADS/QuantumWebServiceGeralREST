import 'package:QuantumWebServiceGeralREST/source/dao/customer_dao.dart';
import 'package:QuantumWebServiceGeralREST/source/datasource/mysql_connection.dart';
import 'package:QuantumWebServiceGeralREST/source/unity/custumer.dart';
import 'package:uuid/uuid.dart';

class CustomerDaoImpl implements CustomerDao {
  static const COLUMNS = """
    nome_fantasia AS nomeFantasia, 
    ref_comercial1 AS uuid, 
    cpf_cgc AS cpfCgc, 
    cod_municipio AS codMunicipio, 
    cod_uf AS codUf, 
    data_cadastro AS dataCadastro, 
    nome_razaosocial AS nomeRazaoSocial,
    rg_insc_estadual AS rgInscEstadual,
    data_nascimento_fundacao AS dataNascimentoFundacao,
    tipo_cliente AS tipoCliente,
    bairro, celular, cep, cidade, codigo, desconto, email, endereco, estado, 
    fax, fone, numero, observacao, rg_insc_estadual, sexo, situacao, ativo, 
    cod_vendedor, orgaoExpedidor, tp_cli, NR_FILHOS, codigo_CONVENIO, 
    contribuinteicms  
  """;

  late MySQL datasource;

  CustomerDaoImpl() {
    datasource = MySQL();
  }

  @override
  Future<List<Customer>> getAll() async {
    String script = 'SELECT $COLUMNS FROM clientes;';
    final results = await datasource.getQuery(sql: script);

    return results.map((e) => Customer.fromMap(e.fields)).toList();
  }

  @override
  Future<List<Customer>> getDateUpdateFromLastDatetime({
    required String lastDatetime,
  }) async {
    String script = '''
      SELECT $COLUMNS FROM clientes WHERE dataversaoregistro >= "$lastDatetime";
    ''';

    final results = await datasource.getQuery(sql: script);
    return results.map((e) => Customer.fromMap(e.fields)).toList();
  }

  @override
  Future<List<Customer>> getDateUpdateFromOffSetLimit({
    required String lastDatetime,
    required int offset,
    required int limit,
  }) async {
    var script = '''
      SELECT $COLUMNS FROM clientes WHERE dataversaoregistro >= "$lastDatetime"
      LIMIT $limit OFFSET $offset
    ''';

    final results = await datasource.getQuery(sql: script);
    return results.map((e) => Customer.fromMap(e.fields)).toList();
  }

  @override
  Future<Customer> save({required Customer customer}) async {
    String script = ''' 
      INSERT INTO clientes( 
        nome_fantasia, ref_comercial1, cpf_cgc, cod_municipio, cod_uf, bairro, 
        data_cadastro, nome_razaosocial, fax, data_nascimento_fundacao, cidade,
        tipo_cliente, celular, cep, codigo, desconto, email, endereco, estado, 
        fone, numero, rg_insc_estadual, observacao, dataversaoregistro, sexo, 
        situacao, ativo, cod_vendedor, orgaoExpedidor, tp_cli, NR_FILHOS, 
        codigo_CONVENIO, contribuinteicms  
      )VALUES(
        ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,
      );
    ''';
    var values = sequenceToSave(customer: customer);
    await datasource.getQuery(sql: script, objects: values);

    customer.codigo = await getCodeCustomer(uuid: customer.uuid);

    return customer;
  }

  @override
  Future<Customer> update({required Customer customer}) {
    throw UnimplementedError();
  }

  @override
  List sequenceToSave({required Customer customer}) {
    String uuid = Uuid().v1();
    customer.uuid = uuid;

    return [
      customer.nomeFantasia,
      customer.uuid,
      customer.cpfCgc,
      customer.codMunicipio,
      customer.codUf,
      customer.bairro,
      customer.dataCadastro,
      customer.nomeRazaoSocial,
      customer.fax,
      customer.dataNascimentoFundacao,
      customer.cidade,
      customer.tipoCliente,
      customer.celular,
      customer.cep,
      customer.codigo,
      customer.desconto,
      customer.email,
      customer.endereco,
      customer.estado,
      customer.fone,
      customer.numero,
      customer.rgInscEstadual,
      customer.observacao,
      customer.dataversaoregistro,
      customer.sexo,
      customer.situacao,
      customer.ativo,
      customer.cod_vendedor,
      customer.orgaoExpedidor,
      customer.tp_cli,
      customer.NR_FILHOS,
      customer.codigo_CONVENIO,
      customer.contribuinteicms
    ];
  }

  @override
  Future<int> getCodeCustomer({required String uuid}) async {
    String script = ' SELECT codigo FROM Cliente WHERE uuid = $uuid ';
    final results = await datasource.getQuery(sql: script);
    return 0;
  }
}
