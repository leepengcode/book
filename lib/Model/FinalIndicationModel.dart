// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:book/Model/FinalIndicationBuildingMdel.dart';
import 'package:book/Model/FinalIndicationLandMdel.dart';
import 'package:http/http.dart' as http;

class FinalIndication {
  final String? totallandsizesqm;
  final String? totallandvalue;
  final String? totalbuildingsizesqm;
  final String? totalbuildingvalue;
  final String? controlled_by;
  final String? verified_by;
  final String? issus_date;
  final String? expiry_date;
  List<Land>? land = [];
  List<Building>? building = [];

  FinalIndication(
      {this.totallandsizesqm,
      this.totallandvalue,
      this.totalbuildingsizesqm,
      this.totalbuildingvalue,
      this.land,
      this.building,
      this.controlled_by,
      this.verified_by,
      this.issus_date,
      this.expiry_date});
  factory FinalIndication.fromJson(Map<String, dynamic> json) {
    return FinalIndication(
        totallandsizesqm: json['totallandsizesqm'] ?? '',
        totallandvalue: json['totallandvalue'] ?? '',
        totalbuildingsizesqm: json['totalbuildingsizesqm'] ?? '',
        totalbuildingvalue: json['totalbuildingvalue'] ?? '',
        controlled_by: json['controlled_by'] ?? '',
        verified_by: json['verified_by'] ?? '',
        issus_date: json['issus_date'] ?? '',
        expiry_date: json['expiry_date'] ?? '',
        land: [],
        building: []);
  }
  Map<String, dynamic> toJson() {
    return {
      'totallandsizesqm': totallandsizesqm,
      'totallandvalue': totallandvalue,
      'totalbuildingsizesqm': totalbuildingsizesqm,
      'totalbuildingvalue': totalbuildingvalue,
      'controlled_by': controlled_by,
      'verified_by': verified_by,
      'issus_date': issus_date,
      'expiry_date': expiry_date,
      'land': land,
      'building': building,
    };
  }

  Future InsertFinal(FinalIndication dataFinalIndic, var id_book) async {
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://virakst.online/bookReport/public/api/insertfinal/${id_book}'));
    if (dataFinalIndic.totalbuildingsizesqm == '') {
      request.body = jsonEncode({
        'totallandsizesqm': dataFinalIndic.totallandsizesqm,
        'totallandvalue': dataFinalIndic.totallandvalue,
        'totalbuildingsizesqm': dataFinalIndic.totalbuildingsizesqm,
        'totalbuildingvalue': dataFinalIndic.totalbuildingvalue,
        'controlled_by': dataFinalIndic.controlled_by,
        'verified_by': dataFinalIndic.verified_by,
        'issus_date': dataFinalIndic.issus_date,
        'expiry_date': dataFinalIndic.expiry_date,
        'land': dataFinalIndic.land!.toList(),
        // 'building': dataFinalIndic.building,
      });
    } else {
      request.body = jsonEncode({
        'totallandsizesqm': dataFinalIndic.totallandsizesqm,
        'totallandvalue': dataFinalIndic.totallandvalue,
        'totalbuildingsizesqm': dataFinalIndic.totalbuildingsizesqm,
        'totalbuildingvalue': dataFinalIndic.totalbuildingvalue,
        'controlled_by': dataFinalIndic.controlled_by,
        'verified_by': dataFinalIndic.verified_by,
        'issus_date': dataFinalIndic.issus_date,
        'expiry_date': dataFinalIndic.expiry_date,
        'land': dataFinalIndic.land!.toList(),
        'building': dataFinalIndic.building!.toList(),
      });
    }

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("Done in InsertFinal");
    } else {
      print(response.reasonPhrase);
      print(await response.stream.bytesToString());
    }
  }
}
