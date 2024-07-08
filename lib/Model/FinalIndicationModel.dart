// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:book/Model/FinalIndicationBuildingMdel.dart';
import 'package:book/Model/FinalIndicationLandMdel.dart';

class FinalIndication {
  final String? totallandsizesqm;
  final String? totallandvalue;
  final String? totalbuildingsizesqm;
  final String? totalbuildingvalue;
  final List<Land>? land;
  final List<Building>? building;

  FinalIndication({
    this.totallandsizesqm,
    this.totallandvalue,
    this.totalbuildingsizesqm,
    this.totalbuildingvalue,
    required this.land,
    required this.building,
  });
  factory FinalIndication.fromJson(Map<String, dynamic> json) {
    return FinalIndication(
        totallandsizesqm: json['totallandsizesqm'] ?? '',
        totallandvalue: json['totallandvalue'] ?? '',
        totalbuildingsizesqm: json['totallandsizesqm'] ?? '',
        totalbuildingvalue: json['totallandvalue'] ?? '',
        land: [],
        building: []);
  }
  Map<String, dynamic> toJson() {
    return {
      'totallandsizesqm': totallandsizesqm,
      'totallandvalue': totallandvalue,
      'totalbuildingsizesqm': totallandsizesqm,
      'totalbuildingvalue': totallandvalue,
      'land': land,
      'building': building,
    };
  }
}
