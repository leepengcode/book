import 'dart:convert';

class PBuilding {
  final String? no;
  final String? sizesqm;
  final String? minsqm;
  final String? maxsqm;
  final String? totalmin;
  final String? totalmax;

  PBuilding({
    this.no,
    this.sizesqm,
    this.minsqm,
    this.maxsqm,
    this.totalmin,
    this.totalmax,
  });

  // From JSON
  factory PBuilding.fromJson(Map<String, dynamic> json) {
    return PBuilding(
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
