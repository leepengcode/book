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
        fair_market: json['fair_market'] ?? '0.0',
        fire_insurance: json['fire_insurance'] ?? '0.0',
        force_sale: json['force_sale'] ?? '0.0');
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

  Future InsertProvisional(Provisional dataProvisional, var id_book) async {
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://virakst.online/bookReport/public/api/insertprovisional/${id_book}'));

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
        'fire_insurance': dataProvisional.fire_insurance ?? '123',
        'land': dataProvisional.land!.toList(),
        'building': dataProvisional.building!.toList()
      });
    }

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("Done in Provisional");
    } else {
      print(response.reasonPhrase);
    }
  }
}
