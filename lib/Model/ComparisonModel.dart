import 'dart:convert';

class Comparison {
  String parcel;
  String typeofproperty1;
  String typeofproperty2;
  String location;
  String landsize;
  String buildingsize;
  String landvalue;
  String buildingvalue;
  String landprice;
  String buildingprice;
  String totalprice;
  String typecompare;

  Comparison({
    required this.parcel,
    required this.typeofproperty1,
    required this.typeofproperty2,
    required this.location,
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
      typeofproperty1: json['typeofproperty1'] ?? '',
      typeofproperty2: json['typeofproperty2'] ?? '',
      location: json['location'] ?? '',
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
      'typeofproperty1': typeofproperty1,
      'typeofproperty2': typeofproperty2,
      'location': location,
      'buildingsize': buildingsize,
      'landvalue': landvalue,
      'buildingvalue': buildingvalue,
      'landprice': landprice,
      'buildingprice': buildingprice,
      'totalprice': totalprice,
      'typecompare': typecompare ?? "good",
    };
  }
}
