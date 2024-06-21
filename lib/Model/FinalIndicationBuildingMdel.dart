import 'dart:convert';

class Building {
  final String? no;
  final String? sizesqm;
  final String? sizesqft;
  final String? valuesqm;
  final String? propertyvalue;

  Building({
    this.no,
    this.sizesqm,
    this.sizesqft,
    this.valuesqm,
    this.propertyvalue,
  });

  // From JSON
  factory Building.fromJson(Map<String, dynamic> json) {
    return Building(
      no: json['no'] ?? '',
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
