import 'dart:convert';

class GoogleMap {
  var mapimage;

  GoogleMap({
    this.mapimage,
  });

  factory GoogleMap.fromJson(Map<String, dynamic> json) {
    return GoogleMap(
      mapimage: json['mapimage'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'mapimage': mapimage,
    };
  }
}
