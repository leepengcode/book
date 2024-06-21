import 'dart:convert';

class IDCard {
  var mapimage;

  IDCard({
    this.mapimage,
  });
  factory IDCard.fromJson(Map<String, dynamic> json) {
    return IDCard(
      mapimage: json['mapimage'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'mapimage': mapimage,
    };
  }
}
