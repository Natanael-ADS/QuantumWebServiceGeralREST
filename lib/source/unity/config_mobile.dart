import 'dart:convert';

class ConfigMobile {
  String imei = "";
  String tipo = "";
  String value = "";

  ConfigMobile({
    required this.imei,
    required this.tipo,
    required this.value,
  });

  Map<String, dynamic> toMap() {
    return {
      'imei': imei,
      'tipo': tipo,
      'value': value,
    };
  }

  factory ConfigMobile.fromMap(Map<String, dynamic> map) {
    return ConfigMobile(
      imei: map['imei'] ?? '',
      tipo: map['tipo'] ?? '',
      value: map['value'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfigMobile.fromJson(String source) {
    return ConfigMobile.fromMap(json.decode(source));
  }
}
