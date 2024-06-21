import 'dart:convert';

class Land {
  final String? no;
  final String? sizesqm;
  final String? minsqm;
  final String? maxsqm;
  final String? totalmin;
  final String? totalmax;

  Land({
    this.no,
    this.sizesqm,
    this.minsqm,
    this.maxsqm,
    this.totalmin,
    this.totalmax,
  });

  // From JSON
  factory Land.fromJson(Map<String, dynamic> json) {
    return Land(
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
