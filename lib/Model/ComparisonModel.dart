import 'dart:convert';

class Comparison {
  final String parcel;
  final String landsize;
  final String buildingsize;
  final String landvalue;
  final String buildingvalue;
  final String landprice;
  final String buildingprice;
  final String totalprice;
  final String typecompare;

  Comparison({
    required this.parcel,
    required this.landsize,
    required this.buildingsize,
    required this.landvalue,
    required this.buildingvalue,
    required this.landprice,
    required this.buildingprice,
    required this.totalprice,
    required this.typecompare,
  });

  // From JSON
  factory Comparison.fromJson(Map<String, dynamic> json) {
    return Comparison(
      parcel: json['parcel'] ?? '',
      landsize: json['landsize'] ?? '',
      buildingsize: json['buildingsize'] ?? '',
      landvalue: json['landvalue'] ?? '',
      buildingvalue: json['buildingvalue'] ?? '',
      landprice: json['landprice'] ?? '',
      buildingprice: json['buildingprice'] ?? '',
      totalprice: json['totalprice'] ?? '',
      typecompare: json['typecompare'] ?? '',
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'parcel': parcel,
      'landsize': landsize,
      'buildingsize': buildingsize,
      'landvalue': landvalue,
      'buildingvalue': buildingvalue,
      'landprice': landprice,
      'buildingprice': buildingprice,
      'totalprice': totalprice,
      'typecompare': typecompare,
    };
  }
}
