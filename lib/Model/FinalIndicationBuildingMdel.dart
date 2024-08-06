import 'dart:convert';

class Building {
  final String? no;
  final String? sizesqm;
  final String? floorno;
  final String? bedroomno;
  final String? sizesqft;
  final String? valuesqm;
  final String? propertyvalue;

  Building(
      {this.no,
      this.sizesqm,
      this.sizesqft,
      this.valuesqm,
      this.propertyvalue,
      this.floorno,
      this.bedroomno});

  // From JSON
  factory Building.fromJson(Map<String, dynamic> json) {
    return Building(
      no: json['no'].toString() ?? '',
      sizesqm: json['sizesqm'] ?? '',
      floorno: json['floorno'] ?? '',
      bedroomno: json['bedroomno'] ?? '',
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
      'floorno': floorno,
      'bedroomno': bedroomno,
      'sizesqft': sizesqft,
      'valuesqm': valuesqm,
      'propertyvalue': propertyvalue,
    };
  }
}
