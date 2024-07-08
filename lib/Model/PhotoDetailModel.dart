import 'dart:convert';
import 'dart:io';

<<<<<<< Updated upstream
import 'package:universal_io/io.dart';

class PhotoDetail {
  File? frontviewimage;
  List<File>? viewimage = [];
  List<File>? insideimage = [];
  List<File>? landimage;
  File? roadviewimage1;
  File? roadviewimage2;
  File? surroundin1;
  File? surroundin2;
  File? surroundin3;
  File? surroundin4;
  File? surroundin5;
  File? surroundin6;
  String? dessurroundin1;
  String? dessurroundin2;
  String? dessurroundin3;
  String? dessurroundin4;
  String? dessurroundin5;
  String? dessurroundin6;

  PhotoDetail({
    this.frontviewimage,
    this.viewimage,
    this.insideimage,
    this.landimage,
    this.roadviewimage1,
    this.roadviewimage2,
=======
class PhotoDetail {
  var frontviewimage;
  List<File> viewimage;
  List<File> roadviewimage;
  var surroundin1;
  var surroundin2;
  var surroundin3;
  var surroundin4;
  var surroundin5;
  var surroundin6;
  final String? dessurroundin1;
  final String? dessurroundin2;
  final String? dessurroundin3;
  final String? dessurroundin4;
  final String? dessurroundin5;
  final String? dessurroundin6;

  PhotoDetail({
    this.frontviewimage,
    required this.viewimage,
    required this.roadviewimage,
>>>>>>> Stashed changes
    this.surroundin1,
    this.surroundin2,
    this.surroundin3,
    this.surroundin4,
    this.surroundin5,
    this.surroundin6,
<<<<<<< Updated upstream
    this.dessurroundin1,
    this.dessurroundin2,
    this.dessurroundin3,
    this.dessurroundin4,
    this.dessurroundin5,
    this.dessurroundin6,
=======
    required this.dessurroundin1,
    required this.dessurroundin2,
    required this.dessurroundin3,
    required this.dessurroundin4,
    required this.dessurroundin5,
    required this.dessurroundin6,
>>>>>>> Stashed changes
  });
  factory PhotoDetail.fromJson(Map<String, dynamic> json) {
    return PhotoDetail(
      frontviewimage: json['frontviewimage'] ?? '',
      viewimage: [],
<<<<<<< Updated upstream
      insideimage: [],
      landimage: [],
      roadviewimage1: json['roadviewimage1'] ?? '',
      roadviewimage2: json['roadviewimage2'] ?? '',
=======
      roadviewimage: [],
>>>>>>> Stashed changes
      surroundin1: json['surroundin1'] ?? '',
      surroundin2: json['surroundin2'] ?? '',
      surroundin3: json['surroundin3'] ?? '',
      surroundin4: json['surroundin4'] ?? '',
      surroundin5: json['surroundin5'] ?? '',
      surroundin6: json['surroundin6'] ?? '',
      dessurroundin1: json['dessurroundin1'] ?? '',
      dessurroundin2: json['dessurroundin2'] ?? '',
      dessurroundin3: json['dessurroundin3'] ?? '',
      dessurroundin4: json['dessurroundin4'] ?? '',
      dessurroundin5: json['dessurroundin5'] ?? '',
      dessurroundin6: json['dessurroundin6'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'frontviewimage': frontviewimage,
      'viewimage': viewimage,
<<<<<<< Updated upstream
      'insideimage': insideimage,
      'landimage': landimage,
      'roadviewimage1': roadviewimage1,
      'roadviewimage2': roadviewimage2,
=======
      'roadviewimage': roadviewimage,
>>>>>>> Stashed changes
      'surroundin1': surroundin1,
      'surroundin2': surroundin2,
      'surroundin3': surroundin3,
      'surroundin4': surroundin4,
      'surroundin5': surroundin5,
      'surroundin6': surroundin6,
      'dessurroundin1': dessurroundin1,
      'dessurroundin2': dessurroundin2,
      'dessurroundin3': dessurroundin3,
      'dessurroundin4': dessurroundin4,
      'dessurroundin5': dessurroundin5,
      'dessurroundin6': dessurroundin6,
    };
  }
<<<<<<< Updated upstream
  
=======
>>>>>>> Stashed changes
}
