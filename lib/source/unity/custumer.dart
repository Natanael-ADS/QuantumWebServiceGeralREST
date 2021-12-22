import 'dart:convert';

import 'package:QuantumWebServiceGeralREST/source/util/const.dart';
import 'package:dart_mysql/dart_mysql.dart';

class Customer {
  String uuid = ""; //"ref_comercial1"
  int codigo = 0;
  String cpfCgc = ""; //"cpf_cgc"
  String bairro = "";
  String celular = "";
  String cep = "";
  String cidade = "";
  int codMunicipio = 0; //"cod_municipio"
  int codUf = 0; //"cod_uf"
  DateTime dataCadastro = DateTime.now(); //"data_cadastro"
  DateTime dataNascimentoFundacao = DateTime.now(); //"data_nascimento_fundacao"
  double desconto = 0;
  String email = "";
  String endereco = "";
  String estado = "";
  String fax = "";
  String fone = "";
  String nomeRazaoSocial = ""; //"nome_razaosocial"
  int numero = 0;
  Blob observacao = Blob.fromString("");
  String rgInscEstadual = ""; //"rg_insc_estadual"
  String sexo = "";
  int situacao = 0;
  int cod_vendedor = 0;
  DateTime dataversaoregistro = DateTime.now();
  String nomeFantasia = ""; //"nome_fantasia"
  int ativo = 0;
  String orgaoExpedidor = ""; //"orgaoExpedidor"
  int codigoInDispositivo = 0;
  int tipoCliente = 0; //"tipo_cliente"
  int modificado = 0;
  String tp_cli = "OUTROS";
  int codigo_CONVENIO = 0;
  int NR_FILHOS = 0;
  int contribuinteicms = 0;
  String DataNascimento = "";

  Customer();

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'codigo': codigo,
      'cpfCgc': cpfCgc,
      'bairro': bairro,
      'celular': celular,
      'cep': cep,
      'cidade': cidade,
      'codMunicipio': codMunicipio,
      'codUf': codUf,
      'dataCadastro': dataCadastro.millisecondsSinceEpoch,
      'dataNascimentoFundacao': dataNascimentoFundacao.millisecondsSinceEpoch,
      'desconto': desconto,
      'email': email,
      'endereco': endereco,
      'estado': estado,
      'fax': fax,
      'fone': fone,
      'nomeRazaoSocial': nomeRazaoSocial,
      'numero': numero,
      'observacao': observacao,
      'rgInscEstadual': rgInscEstadual,
      'sexo': sexo,
      'situacao': situacao,
      'cod_vendedor': cod_vendedor,
      'nomeFantasia': nomeFantasia,
      'ativo': ativo,
      'orgaoExpedidor': orgaoExpedidor,
      'codigoInDispositivo': codigoInDispositivo,
      'tipoCliente': tipoCliente,
      'modificado': modificado,
      'tp_cli': tp_cli,
      'codigo_CONVENIO': codigo_CONVENIO,
      'NR_FILHOS': NR_FILHOS,
      'contribuinteicms': contribuinteicms,
      'DataNascimento': DataNascimento,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    var customer = Customer();
    customer.uuid = map['uuid'] ?? '';
    customer.codigo = map['codigo']?.toInt() ?? 0;
    customer.cpfCgc = map['cpfCgc'] ?? '';
    customer.bairro = map['bairro'] ?? '';
    customer.celular = map['celular'] ?? '';
    customer.cep = map['cep'] ?? '';
    customer.cidade = map['cidade'] ?? '';
    customer.codMunicipio = map['codMunicipio']?.toInt() ?? 0;
    customer.codUf = map['codUf']?.toInt() ?? 0;
    customer.dataCadastro = map['dataCadastro'];
    customer.dataNascimentoFundacao =
        map['dataNascimentoFundacao'] ?? Const.DATETIME_INVALIDATE;
    customer.desconto = map['desconto']?.toDouble() ?? 0.0;
    customer.email = map['email'] ?? '';
    customer.endereco = map['endereco'] ?? '';
    customer.estado = map['estado'] ?? '';
    customer.fax = map['fax'] ?? '';
    customer.fone = map['fone'] ?? '';
    customer.nomeRazaoSocial = map['nomeRazaoSocial'] ?? '';
    customer.numero = map['numero']?.toInt() ?? 0;
    customer.observacao = map['observacao'] ?? '';
    customer.rgInscEstadual = map['rgInscEstadual'] ?? '';
    customer.sexo = map['sexo'] ?? '';
    customer.situacao = map['situacao']?.toInt() ?? 0;
    customer.cod_vendedor = map['cod_vendedor']?.toInt() ?? 0;
    customer.nomeFantasia = map['nomeFantasia'] ?? '';
    customer.ativo = map['ativo']?.toInt() ?? 0;
    customer.orgaoExpedidor = map['orgaoExpedidor'] ?? '';
    customer.codigoInDispositivo = map['codigoInDispositivo']?.toInt() ?? 0;
    customer.tipoCliente = map['tipoCliente']?.toInt() ?? 0;
    customer.modificado = map['modificado']?.toInt() ?? 0;
    customer.tp_cli = map['tp_cli'] ?? '';
    customer.codigo_CONVENIO = map['codigo_CONVENIO']?.toInt() ?? 0;
    customer.NR_FILHOS = map['NR_FILHOS']?.toInt() ?? 0;
    customer.contribuinteicms = map['contribuinteicms']?.toInt() ?? 0;
    customer.DataNascimento = map['DataNascimento'] ?? '';
    return customer;
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) {
    return Customer.fromMap(json.decode(source));
  }
}
