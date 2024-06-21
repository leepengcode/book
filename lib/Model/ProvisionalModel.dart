// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:book/Model/ProvisionalBuildingMdel.dart';
import 'package:book/Model/ProvisionalLandMdel.dart';

class OfficerReport {
  final String name;
  final String? totallandsizesqm;
  final String? totallandvaluemin;
  final String? totallandvaluemax;
  final String? totalbuildingsizesqm;
  final String? totalbuildingvaluemin;
  final String? totalbuildingvaluemax;
  final List<Land>? land;
  final List<Building>? building;

  OfficerReport({
    this.totallandsizesqm,
    this.totallandvaluemin,
    this.totallandvaluemax,
    this.totalbuildingsizesqm,
    this.totalbuildingvaluemin,
    this.totalbuildingvaluemax,
    required this.name,
    required this.land,
    required this.building,
  });
  factory OfficerReport.fromJson(Map<String, dynamic> json) {
    return OfficerReport(
        name: json['name'] ?? '',
        totallandsizesqm: json['totallandsizesqm'] ?? '',
        totallandvaluemin: json['totallandvaluemin'] ?? '',
        totallandvaluemax: json['totallandvaluemax'] ?? '',
        totalbuildingsizesqm: json['totalbuildingsizesqm'] ?? '',
        totalbuildingvaluemin: json['totalbuildingvaluemin'] ?? '',
        totalbuildingvaluemax: json['totalbuildingvaluemax'] ?? '',
        land: [],
        building: []);
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'totallandsizesqm': totallandsizesqm,
      'totallandvaluemin': totallandvaluemin,
      'totallandvaluemax': totallandvaluemax,
      'totalbuildingsizesqm': totalbuildingsizesqm,
      'totalbuildingvaluemin': totalbuildingvaluemin,
      'totalbuildingvaluemax': totalbuildingvaluemax,
      'land': land,
      'building': building,
    };
  }
}
