import 'dart:convert';

class SettingsMobile {
  String imei = "";
  String tipo = "";
  String value = "";

  SettingsMobile({
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

  factory SettingsMobile.fromMap(Map<String, dynamic> map) {
    return SettingsMobile(
      imei: map['imei'] ?? '',
      tipo: map['tipo'] ?? '',
      value: map['value'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingsMobile.fromJson(String source) {
    return SettingsMobile.fromMap(json.decode(source));
  }
}
