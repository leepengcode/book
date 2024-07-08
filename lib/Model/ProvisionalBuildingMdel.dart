import 'dart:convert';

class Building {
  final String? no;
  final String? sizesqm;
  final String? minsqm;
  final String? maxsqm;
  final String? totalmin;
  final String? totalmax;

  Building({
    this.no,
    this.sizesqm,
    this.minsqm,
    this.maxsqm,
    this.totalmin,
    this.totalmax,
  });

  // From JSON
  factory Building.fromJson(Map<String, dynamic> json) {
    return Building(
      no: json['no'] ?? '',
      sizesqm: json['sizesqm'] ?? '',
      minsqm: json['minsqm'] ?? '',
      maxsqm: json['maxsqm'] ?? '',
      totalmin: json['totalmin'] ?? '',
      totalmax: json['totalmax'] ?? '',
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'no': no,
      'sizesqm': sizesqm,
      'minsqm': minsqm,
      'maxsqm': maxsqm,
      'totalmin': totalmin,
      'totalmax': totalmax,
    };
  }
}
