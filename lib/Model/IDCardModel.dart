import 'dart:convert';
<<<<<<< Updated upstream
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class IDCard {
  File? frontidcard1;
  File? frontidcard2;
  File? backidcard1;
  File? backidcard2;
=======

class IDCard {
  var frontidcard1;
  var frontidcard2;
  var backidcard1;
  var backidcard2;
>>>>>>> Stashed changes

  IDCard({
    this.frontidcard1,
    this.frontidcard2,
    this.backidcard1,
    this.backidcard2,
  });
  factory IDCard.fromJson(Map<String, dynamic> json) {
    return IDCard(
      frontidcard1: json['frontidcard1'] ?? '',
      frontidcard2: json['frontidcard2'] ?? '',
      backidcard1: json['backidcard1'] ?? '',
      backidcard2: json['backidcard2'] ?? '',
    );
  }
<<<<<<< Updated upstream

  // With file we don't use Tojson
  // Map<String, dynamic> toJson() {
  //   return {
  //     'frontidcard1': frontidcard1,
  //     'frontidcard2': frontidcard2,
  //     'backidcard1': backidcard1,
  //     'backidcard2': backidcard2,
  //   };
  // }

  Future<Uint8List> getBlobData(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to load blob data');
    }
  }

  Future InsertIdCard(IDCard objidcard) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://192.168.1.31:8000/api/insertidcard'));

    if (objidcard.frontidcard1 != null) {
      Uint8List cvByte;
      if (kIsWeb && objidcard.frontidcard1!.path.startsWith('blob:')) {
        // For web environment
        cvByte = await getBlobData(objidcard.frontidcard1!.path);
      } else {
        // For mobile environment
        cvByte = await File(objidcard.frontidcard1!.path).readAsBytes();
      }
      request.files.add(http.MultipartFile.fromBytes(
        'frontidcard1',
        cvByte,
        filename: 'asdasdasd.jpg',
      ));
    } else {
      print("Error: No image provided");
    }

    if (objidcard.frontidcard2 != null) {
      Uint8List cvByte;
      if (kIsWeb && objidcard.frontidcard2!.path.startsWith('blob:')) {
        // For web environment
        cvByte = await getBlobData(objidcard.frontidcard2!.path);
      } else {
        // For mobile environment
        cvByte = await File(objidcard.frontidcard2!.path).readAsBytes();
      }
      request.files.add(http.MultipartFile.fromBytes(
        'frontidcard2',
        cvByte,
        filename: 'asdasdasd.jpg',
      ));
    } else {
      print("Error: No image provided");
    }

    if (objidcard.backidcard1 != null) {
      Uint8List cvByte;
      if (kIsWeb && objidcard.backidcard1!.path.startsWith('blob:')) {
        // For web environment
        cvByte = await getBlobData(objidcard.backidcard1!.path);
      } else {
        // For mobile environment
        cvByte = await File(objidcard.backidcard1!.path).readAsBytes();
      }
      request.files.add(http.MultipartFile.fromBytes(
        'backidcard1',
        cvByte,
        filename: 'asdasdasd.jpg',
      ));
    } else {
      print("Error: No image provided");
    }

    if (objidcard.backidcard2 != null) {
      Uint8List cvByte;
      if (kIsWeb && objidcard.backidcard2!.path.startsWith('blob:')) {
        // For web environment
        cvByte = await getBlobData(objidcard.backidcard2!.path);
      } else {
        // For mobile environment
        cvByte = await File(objidcard.backidcard2!.path).readAsBytes();
      }
      request.files.add(http.MultipartFile.fromBytes(
        'backidcard2',
        cvByte,
        filename: 'asdasdasd.jpg',
      ));
    } else {
      print("Error: No image provided");
    }

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
=======
  Map<String, dynamic> toJson() {
    return {
      'frontidcard1': frontidcard1,
      'frontidcard2': frontidcard2,
      'backidcard1': backidcard1,
      'backidcard2': backidcard2,
    };
>>>>>>> Stashed changes
  }
}
