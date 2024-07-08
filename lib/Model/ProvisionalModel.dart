// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:book/Model/ProvisionalBuildingMdel.dart';
import 'package:book/Model/ProvisionalLandMdel.dart';
import 'package:http/http.dart' as http;

class Provisional {
  final String? name;
  final String? totallandsizesqm;
  final String? totallandvaluemin;
  final String? totallandvaluemax;
  final String? totalbuildingsizesqm;
  final String? totalbuildingvaluemin;
  final String? totalbuildingvaluemax;
  final String? fair_market;
  final String? fire_insurance;
  final String? force_sale;
  List<PLand>? land = [];
  List<PBuilding>? building = [];

  Provisional({
    this.totallandsizesqm,
    this.totallandvaluemin,
    this.totallandvaluemax,
    this.totalbuildingsizesqm,
    this.totalbuildingvaluemin,
    this.totalbuildingvaluemax,
    this.fair_market,
    this.fire_insurance,
    this.force_sale,
    this.name,
    this.land,
    this.building,
  });
  factory Provisional.fromJson(Map<String, dynamic> json) {
    return Provisional(
        name: json['name'] ?? '',
        totallandsizesqm: json['totallandsizesqm'] ?? '',
        totallandvaluemin: json['totallandvaluemin'] ?? '',
        totallandvaluemax: json['totallandvaluemax'] ?? '',
        totalbuildingsizesqm: json['totalbuildingsizesqm'] ?? '',
        totalbuildingvaluemin: json['totalbuildingvaluemin'] ?? '',
        totalbuildingvaluemax: json['totalbuildingvaluemax'] ?? '',
        fair_market: json['fair_market'] ?? '',
        fire_insurance: json['fire_insurance'] ?? '',
        force_sale: json['force_sale'] ?? '',
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
      'fair_market': fair_market ?? '',
      'fire_insurance': fire_insurance ?? '',
      'force_sale': force_sale ?? '',
    };
  }
    Future InsertProvisional(Provisional dataProvisional) async {
    var request = http.Request(
        'POST', Uri.parse('http://192.168.1.31:8000/api/insertprovisional'));
    if (dataProvisional.fair_market == '') {
      request.body = jsonEncode({
        'name': dataProvisional.name,
        'totallandsizesqm': dataProvisional.totallandsizesqm,
        'totallandvaluemin': dataProvisional.totallandvaluemin,
        'totallandvaluemax': dataProvisional.totallandvaluemax,
        'totalbuildingsizesqm': dataProvisional.totalbuildingsizesqm,
        'totalbuildingvaluemin': dataProvisional.totalbuildingvaluemin,
        'totalbuildingvaluemax': dataProvisional.totalbuildingvaluemax,
        'force_sale': dataProvisional.force_sale ?? '',
        'land': dataProvisional.land!.toList()
      });
    } else {
      request.body = jsonEncode({
        'name': dataProvisional.name,
        'totallandsizesqm': dataProvisional.totallandsizesqm,
        'totallandvaluemin': dataProvisional.totallandvaluemin,
        'totallandvaluemax': dataProvisional.totallandvaluemax,
        'totalbuildingsizesqm': dataProvisional.totalbuildingsizesqm,
        'totalbuildingvaluemin': dataProvisional.totalbuildingvaluemin,
        'totalbuildingvaluemax': dataProvisional.totalbuildingvaluemax,
        'force_sale': dataProvisional.force_sale ?? '',
        'fair_market': dataProvisional.fair_market ?? '',
        'fire_insurance': dataProvisional.fire_insurance ?? '',
        'land': dataProvisional.land!.toList(),
        'building': dataProvisional.building!.toList()
      });
    }

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
