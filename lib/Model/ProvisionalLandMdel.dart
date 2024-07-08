import 'dart:convert';

<<<<<<< Updated upstream
class PLand {
  final String? no;
  final String? size_sqm;
=======
class Land {
  final String? no;
  final String? sizesqm;
>>>>>>> Stashed changes
  final String? minsqm;
  final String? maxsqm;
  final String? totalmin;
  final String? totalmax;

<<<<<<< Updated upstream
  PLand({
    this.no,
    this.size_sqm,
=======
  Land({
    this.no,
    this.sizesqm,
>>>>>>> Stashed changes
    this.minsqm,
    this.maxsqm,
    this.totalmin,
    this.totalmax,
  });

  // From JSON
<<<<<<< Updated upstream
  factory PLand.fromJson(Map<String, dynamic> json) {
    return PLand(
      no: json['no'] ?? '',
      size_sqm: json['size_sqm'] ?? '',
=======
  factory Land.fromJson(Map<String, dynamic> json) {
    return Land(
      no: json['no'] ?? '',
      sizesqm: json['sizesqm'] ?? '',
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
      'size_sqm': size_sqm,
=======
      'sizesqm': sizesqm,
>>>>>>> Stashed changes
      'minsqm': minsqm,
      'maxsqm': maxsqm,
      'totalmin': totalmin,
      'totalmax': totalmax,
    };
  }
}
