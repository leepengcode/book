import 'dart:convert';

class PBuilding {
  final String? no;
  final String? sizesqm;
  final String? floorno;
  final String? bedroomno;
  final String? minsqm;
  final String? maxsqm;
  final String? totalmin;
  final String? totalmax;

  PBuilding(
      {this.no,
      this.sizesqm,
      this.minsqm,
      this.maxsqm,
      this.totalmin,
      this.totalmax,
      this.bedroomno,
      this.floorno});

  // From JSON
  factory PBuilding.fromJson(Map<String, dynamic> json) {
    return PBuilding(
      no: json['no'] ?? '',
      sizesqm: json['sizesqm'] ?? '',
      floorno: json['floorno'] ?? '',
      bedroomno: json['bedroomno'] ?? '',
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
      'floorno': floorno,
      'bedroomno': bedroomno,
      'minsqm': minsqm,
      'maxsqm': maxsqm,
      'totalmin': totalmin,
      'totalmax': totalmax,
    };
  }
}
