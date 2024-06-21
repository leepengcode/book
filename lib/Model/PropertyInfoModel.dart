import 'dart:convert';

class PropertyInfo {
  final String? plotno;
  final String? north;
  final String? south;
  final String? east;
  final String? west;
  final String? landtitledeep;
  final String? landsize;
  final String? totalland;
  final String? typeland;
  final String? occupant;
  final String? tenure;
  final String? flatsize;
  final String? buildingsize;
  final String? totalsize;
  final String? buildingtype;
  final String? buildingage;
  final String? cost;
  final String? byowner;
  final String? metalroof;
  final String? occoupied;
  final String? disposability;
  final String? quality;
  final String? percentage;
  final String? typeofbuilding;
  final String? floor;
  final String? roof;
  final String? door;
  final String? stair;
  final String? window;
  final String? ceiling;
  final String? wall;
  final String? floornstory;
  final String? bathroom;
  final String? room;
  final String? kitchen;
  final String? diningnlivingroom;
  final String? storage;
  final String? total;
  PropertyInfo(
      {this.plotno,
      this.north,
      this.south,
      this.east,
      this.west,
      this.landtitledeep,
      this.landsize,
      this.totalland,
      this.typeland,
      this.occupant,
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
      this.window,
      this.ceiling,
      this.wall,
      this.floornstory,
      this.bathroom,
      this.room,
      this.kitchen,
      this.diningnlivingroom,
      this.storage,
      this.total});

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
      'occupant': occupant,
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
      'window': window,
      'ceiling': ceiling,
      'wall': wall,
      'floornstory': floornstory,
      'bathroom': bathroom,
      'room': room,
      'kitchen': kitchen,
      'diningnlivingroom': diningnlivingroom,
      'storage': storage,
      'total': total,
    };
  }

  factory PropertyInfo.fromJson(Map<String, dynamic> json) {
    return PropertyInfo(
      plotno: json['plotno'] ?? '',
      north: json['north'] ?? '',
      south: json['south'] ?? '',
      east: json['east'] ?? '',
      west: json['west'] ?? '',
      landtitledeep: json['landtitledeep'] ?? '',
      landsize: json['landsize'] ?? '',
      totalland: json['totalland'] ?? '',
      typeland: json['typeland'] ?? '',
      occupant: json['occupant'] ?? '',
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
      window: json['window'] ?? '',
      ceiling: json['ceiling'] ?? '',
      wall: json['wall'] ?? '',
      floornstory: json['floornstory'] ?? '',
      bathroom: json['bathroom'] ?? '',
      room: json['room'] ?? '',
      kitchen: json['kitchen'] ?? '',
      diningnlivingroom: json['diningnlivingroom'] ?? '',
      storage: json['storage'] ?? '',
      total: json['total'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'plotno': plotno,
      'north': north,
      'south': south,
      'east': east,
      'west': west,
      'landtitledeep': landtitledeep,
      'landsize': landsize,
      'totalland': totalland,
      'typeland': typeland,
      'occupant': occupant,
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
      'window': window,
      'ceiling': ceiling,
      'wall': wall,
      'floornstory': floornstory,
      'bathroom': bathroom,
      'room': room,
      'kitchen': kitchen,
      'diningnlivingroom': diningnlivingroom,
      'storage': storage,
      'total': total,
    };
  }
}
