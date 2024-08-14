import 'dart:convert';

class Land {
  final String? no;
  final String? sizesqm;
  final String? sizesqft;
  final String? valuesqm;
  final String? propertyvalue;

  Land({
    this.no,
    this.sizesqm,
    this.sizesqft,
    this.valuesqm,
    this.propertyvalue,
  });

  // From JSON
  factory Land.fromJson(Map<String, dynamic> json) {
    return Land(
      no: json['no'].toString(),
      sizesqm: json['sizesqm'] ?? '',
      sizesqft: json['sizesqft'] ?? '',
      valuesqm: json['valuesqm'] ?? '',
      propertyvalue: json['propertyvalue'] ?? '',
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'no': no,
      'sizesqm': sizesqm,
      'sizesqft': sizesqft,
      'valuesqm': valuesqm,
      'propertyvalue': propertyvalue,
    };
  }
}
