import 'dart:convert';

import 'package:dio/dio.dart';

class PropertyInfor {
  String? plotno;
  String? north;
  String? south;
  String? east;
  String? west;
  String? landtitledeep;
  String? landsize;
  String? totalland;
  String? typeland;
  // String? occupant;
  String? tenure;
  String? flatsize;
  String? buildingsize;
  String? totalsize;
  String? buildingtype;
  String? buildingage;
  String? cost;
  String? byowner;
  String? metalroof;
  String? occoupied;
  String? disposability;
  String? quality;
  String? percentage;
  String? typeofbuilding;
  String? floor;
  String? roof;
  String? door;
  String? stair;
  String? windows;
  String? ceiling;
  String? wall;
  String? floornstory;
  String? bathroom;
  String? room;
  String? kitchen;
  String? diningnlivingroom;
  String? store;
  String? total;
  String? water;
  String? electricity;
  String? severage;
  String? telecom;
  String? security;
    String? parking;
  PropertyInfor({
    this.plotno,
    this.north,
    this.south,
    this.east,
    this.west,
    this.landtitledeep,
    this.landsize,
    this.totalland,
    this.typeland,
    // this.occupant,
    this.tenure,
    this.flatsize,
    this.buildingsize,
    this.totalsize,
    this.buildingtype,
    this.buildingage,
    this.cost,
    this.byowner,
    this.metalroof,
    this.occoupied,
    this.disposability,
    this.quality,
    this.percentage,
    this.typeofbuilding,
    this.floor,
    this.roof,
    this.door,
    this.stair,
    this.windows,
    this.ceiling,
    this.wall,
    this.floornstory,
    this.bathroom,
    this.room,
    this.kitchen,
    this.diningnlivingroom,
    this.store,
    this.total,
    this.water,
    this.electricity,
    this.severage,
    this.telecom,
    this.security,
    this.parking
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'plotno': plotno,
      'north': north,
      'south': south,
      'east': east,
      'west': west,
      'landtitledeep': landtitledeep,
      'landsize': landsize,
      'totalland': totalland,
      'typeland': typeland,
      // 'occupant': occupant,
      'tenure': tenure,
      'flatsize': flatsize,
      'buildingsize': buildingsize,
      'totalsize': totalsize,
      'buildingtype': buildingtype,
      'buildingage': buildingage,
      'cost': cost,
      'byowner': byowner,
      'metalroof': metalroof,
      'occoupied': occoupied,
      'disposability': disposability,
      'quality': quality,
      'percentage': percentage,
      'typeofbuilding': typeofbuilding,
      'floor': floor,
      'roof': roof,
      'door': door,
      'stair': stair,
      'windows': windows,
      'ceiling': ceiling,
      'wall': wall,
      'floornstory': floornstory,
      'bathroom': bathroom,
      'room': room,
      'kitchen': kitchen,
      'diningnlivingroom': diningnlivingroom,
      'store': store,
      'total': total,
      'water': water,
      'electricity': electricity,
      'severage': severage,
      'telecom': telecom,
      'security': security,
      'parking': parking,
    };
  }

  factory PropertyInfor.fromJson(Map<String, dynamic> json) {
    return PropertyInfor(
      plotno: json['plotno'] ?? '',
      north: json['north'] ?? '',
      south: json['south'] ?? '',
      east: json['east'] ?? '',
      west: json['west'] ?? '',
      landtitledeep: json['landtitledeep'] ?? '',
      landsize: json['landsize'] ?? '',
      totalland: json['totalland'] ?? '',
      typeland: json['typeland'] ?? '',
      // occupant: json['occupant'] ?? '',
      tenure: json['tenure'] ?? '',
      flatsize: json['flatsize'] ?? '',
      buildingsize: json['buildingsize'] ?? '',
      totalsize: json['totalsize'] ?? '',
      buildingtype: json['buildingtype'] ?? '',
      buildingage: json['buildingage'] ?? '',
      cost: json['cost'] ?? '',
      byowner: json['byowner'] ?? '',
      metalroof: json['metalroof'] ?? '',
      occoupied: json['occoupied'] ?? '',
      disposability: json['disposability'] ?? '',
      quality: json['quality'] ?? '',
      percentage: json['percentage'] ?? '',
      typeofbuilding: json['typeofbuilding'] ?? '',
      floor: json['floor'] ?? '',
      roof: json['roof'] ?? '',
      door: json['door'] ?? '',
      stair: json['stair'] ?? '',
      windows: json['windows'] ?? '',
      ceiling: json['ceiling'] ?? '',
      wall: json['wall'] ?? '',
      floornstory: json['floornstory'] ?? '',
      bathroom: json['bathroom'] ?? '',
      room: json['room'] ?? '',
      kitchen: json['kitchen'] ?? '',
      diningnlivingroom: json['diningnlivingroom'] ?? '',
      store: json['store'] ?? '',
      total: json['total'] ?? '',
      water: json['water'] ?? '',
      electricity: json['electricity'] ?? '',
      severage: json['severage'] ?? '',
      telecom: json['telecom'] ?? '',
      security: json['security'] ?? '',
      parking: json['parking'] ?? '',
    );
  }

  Map<String, String> toJson() {
    return {
      'plotno': plotno ?? '',
      'north': north ?? '',
      'south': south ?? '',
      'east': east ?? '',
      'west': west ?? '',
      'landtitledeep': landtitledeep ?? '',
      'landsize': landsize ?? '',
      'totalland': totalland ?? '',
      'typeland': typeland ?? '',
      // 'occupant': occupant ?? '',
      'tenure': tenure ?? '',
      'flatsize': flatsize ?? '',
      'buildingsize': buildingsize ?? '',
      'totalsize': totalsize ?? '',
      'buildingtype': buildingtype ?? '',
      'buildingage': buildingage ?? '',
      'cost': cost ?? '',
      'byowner': byowner ?? '',
      'metalroof': metalroof ?? '',
      'occoupied': occoupied ?? '',
      'disposability': disposability ?? '',
      'quality': quality ?? '',
      'percentage': percentage ?? '',
      'typeofbuilding': typeofbuilding ?? '',
      'floor': floor ?? '',
      'roof': roof ?? '',
      'door': door ?? '',
      'stair': stair ?? '',
      'windows': windows ?? '',
      'ceiling': ceiling ?? '',
      'wall': wall ?? '',
      'floornstory': floornstory ?? '',
      'bathroom': bathroom ?? '',
      'room': room ?? '',
      'kitchen': kitchen ?? '',
      'diningnlivingroom': diningnlivingroom ?? '',
      'store': store ?? '',
      'total': total ?? '',
      'water': water ?? '',
      'electricity': electricity ?? '',
      'severage': severage ?? '',
      'telecom': telecom ?? '',
      'security': security ?? '',
      'parking': parking ?? ''
    };
  }

  Future InsertInfo(PropertyInfor dataInfo) async {
    var dio = Dio();
    var response = await dio.request(
      'http://192.168.1.31:8000/api/insertinfo',
      options: Options(
        method: 'POST',
      ),
      data: dataInfo.toJson(),
    );
    print("statusCode : ${dataInfo.toJson()}\n\n\n\n");

    if (response.statusCode == 201 || response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print("${response.statusMessage}" + "${response.statusCode}");
    }
  }
}
