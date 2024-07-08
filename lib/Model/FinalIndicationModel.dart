// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:book/Model/FinalIndicationBuildingMdel.dart';
import 'package:book/Model/FinalIndicationLandMdel.dart';
<<<<<<< Updated upstream
import 'package:http/http.dart' as http;
=======
>>>>>>> Stashed changes

class FinalIndication {
  final String? totallandsizesqm;
  final String? totallandvalue;
  final String? totalbuildingsizesqm;
  final String? totalbuildingvalue;
<<<<<<< Updated upstream
  List<Land>? land = [];
  List<Building>? building = [];
=======
  final List<Land>? land;
  final List<Building>? building;
>>>>>>> Stashed changes

  FinalIndication({
    this.totallandsizesqm,
    this.totallandvalue,
    this.totalbuildingsizesqm,
    this.totalbuildingvalue,
<<<<<<< Updated upstream
    this.land,
    this.building,
=======
    required this.land,
    required this.building,
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream

  Future InsertFinal(FinalIndication dataFinalIndic) async {
    var request = http.Request(
        'POST', Uri.parse('http://192.168.1.31:8000/api/insertfinal'));
    if (dataFinalIndic.totalbuildingsizesqm == '') {
      request.body = jsonEncode({
        'totallandsizesqm': dataFinalIndic.totallandsizesqm,
        'totallandvalue': dataFinalIndic.totallandvalue,
        'totalbuildingsizesqm': dataFinalIndic.totallandsizesqm,
        'totalbuildingvalue': dataFinalIndic.totallandvalue,
        'land': dataFinalIndic.land!.toList(),
        // 'building': dataFinalIndic.building,
      });
    } else {
      request.body = jsonEncode({
        'totallandsizesqm': dataFinalIndic.totallandsizesqm,
        'totallandvalue': dataFinalIndic.totallandvalue,
        'totalbuildingsizesqm': dataFinalIndic.totallandsizesqm,
        'totalbuildingvalue': dataFinalIndic.totallandvalue,
        'land': dataFinalIndic.land!.toList(),
        'building': dataFinalIndic.building!.toList(),
      });
    }

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
=======
>>>>>>> Stashed changes
}
