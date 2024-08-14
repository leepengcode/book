import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

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
  String? tenure;
  String? deepnumber;
  String? unit;
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
    this.tenure,
    this.deepnumber,
    this.unit,
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
    this.parking,
  });

  PropertyInfor.fromJson(Map<String, dynamic> json) {
    plotno = json['plotno'];
    north = json['north'];
    south = json['south'];
    east = json['east'];
    west = json['west'];
    landtitledeep = json['landtitledeep'];
    landsize = json['landsize'];
    totalland = json['totalland'];
    typeland = json['typeland'];
    tenure = json['tenure'];
    deepnumber = json['deepnumber'];
    unit = json['unit'];
    flatsize = json['flatsize'];
    buildingsize = json['buildingsize'];
    totalsize = json['totalsize'];
    buildingtype = json['buildingtype'];
    buildingage = json['buildingage'];
    cost = json['cost'];
    byowner = json['byowner'];
    metalroof = json['metalroof'];
    occoupied = json['occoupied'];
    disposability = json['disposability'];
    quality = json['quality'];
    percentage = json['percentage'];
    typeofbuilding = json['typeofbuilding'];
    floor = json['floor'];
    roof = json['roof'];
    door = json['door'];
    stair = json['stair'];
    windows = json['windows'];
    ceiling = json['ceiling'];
    wall = json['wall'];
    floornstory = json['floornstory'];
    bathroom = json['bathroom'];
    room = json['room'];
    kitchen = json['kitchen'];
    diningnlivingroom = json['diningnlivingroom'];
    store = json['store'];
    total = json['total'];
    water = json['water'];
    electricity = json['electricity'];
    severage = json['severage'];
    telecom = json['telecom'];
    security = json['security'];
    parking = json['parking'];
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
      'deepnumber': deepnumber ?? '',
      'unit': unit ?? '',
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
      'severage': severage ?? 'No data',
      'telecom': telecom ?? '',
      'security': security ?? '',
      'parking': parking ?? ''
    };
  }

  Future<void> InsertInfo(PropertyInfor dataInfo, var id_book) async {
    try {
      var request = http.Request(
          'POST',
          Uri.parse(
              'https://virakst.online/bookReport/public/api/insertinfo/${id_book}'));

      request.body = json.encode({
        "plotno": dataInfo.plotno ?? "No data",
        "north": dataInfo.north ?? "No data",
        "south": dataInfo.south ?? "No data",
        "east": dataInfo.east ?? "No data",
        "west": dataInfo.west ?? "No data",
        "landtitledeep": dataInfo.landtitledeep ?? "No data",
        "landsize": dataInfo.landsize ?? "No data",
        "totalland": dataInfo.totalland ?? "No data",
        "typeland": dataInfo.typeland ?? "No data",
        "tenure": dataInfo.tenure ?? "No data",
        "deepnumber": dataInfo.deepnumber ?? "No data",
        "unit": dataInfo.unit ?? "No data",
        "flatsize": dataInfo.flatsize ?? "No data",
        "buildingsize": dataInfo.buildingsize ?? "No data",
        "totalsize": dataInfo.totalsize ?? "No data",
        "buildingtype": dataInfo.buildingtype ?? "No data",
        "buildingage": dataInfo.buildingage ?? "No data",
        "cost": dataInfo.cost ?? "No data",
        "byowner": dataInfo.byowner ?? "No data",
        "metalroof": dataInfo.metalroof ?? "No data",
        "occoupied": dataInfo.occoupied ?? "No data",
        "disposability": dataInfo.disposability ?? "No data",
        "quality": dataInfo.quality ?? "No data",
        "percentage": dataInfo.percentage ?? "No data",
        "typeofbuilding": dataInfo.typeofbuilding ?? "No data",
        "floor": dataInfo.floor ?? "No data",
        "roof": dataInfo.roof ?? "No data",
        "door": dataInfo.door ?? "No data",
        "stair": dataInfo.stair ?? "No data",
        "windows": dataInfo.windows ?? "No data",
        "ceiling": dataInfo.ceiling ?? "No data",
        "wall": dataInfo.wall ?? "No data",
        "floornstory": dataInfo.floornstory ?? "No data",
        "bathroom": dataInfo.bathroom ?? "No data",
        "room": dataInfo.room ?? "No data",
        "kitchen": dataInfo.kitchen ?? "No data",
        "diningnlivingroom": dataInfo.diningnlivingroom ?? "No data",
        "store": dataInfo.store ?? "No data",
        "total": dataInfo.total ?? "No data",
        "water": dataInfo.water ?? "No data",
        "electricity": dataInfo.electricity ?? "No data",
        "severage": dataInfo.severage ?? "No data",
        "telecom": dataInfo.telecom ?? "No data",
        "security": dataInfo.security ?? "24/7",
        "parking": dataInfo.parking ?? "No data",
      });

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print('Response body: ${await response.stream.bytesToString()}');
      } else {
        print('Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
