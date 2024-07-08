import 'dart:convert';

<<<<<<< Updated upstream
class PBuilding {
=======
class Building {
>>>>>>> Stashed changes
  final String? no;
  final String? sizesqm;
  final String? minsqm;
  final String? maxsqm;
  final String? totalmin;
  final String? totalmax;

<<<<<<< Updated upstream
  PBuilding({
=======
  Building({
>>>>>>> Stashed changes
    this.no,
    this.sizesqm,
    this.minsqm,
    this.maxsqm,
    this.totalmin,
    this.totalmax,
  });

  // From JSON
<<<<<<< Updated upstream
  factory PBuilding.fromJson(Map<String, dynamic> json) {
    return PBuilding(
=======
  factory Building.fromJson(Map<String, dynamic> json) {
    return Building(
>>>>>>> Stashed changes
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
