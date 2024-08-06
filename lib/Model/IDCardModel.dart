import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class IDCard {
  File? frontidcard1;
  // File? frontidcard2;
  File? backidcard1;
  // File? backidcard2;

  IDCard({
    this.frontidcard1,
    // this.frontidcard2,
    this.backidcard1,
    // this.backidcard2,
  });
  factory IDCard.fromJson(Map<String, dynamic> json) {
    return IDCard(
      frontidcard1: File.fromRawPath(base64Decode(json['frontidcard1'])),
      // frontidcard2: json['frontidcard2'] ?? '',
      backidcard1: File.fromRawPath(base64Decode(json['backidcard1'])),
      // backidcard2: json['backidcard2'] ?? '',
    );
  }

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

  Future InsertIdCard(IDCard objidcard, var id_book) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://virakst.online/bookReport/public/api/insertidcard/${id_book}'));

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

    // if (objidcard.frontidcard2 != null) {
    //   Uint8List cvByte;
    //   if (kIsWeb && objidcard.frontidcard2!.path.startsWith('blob:')) {
    //     // For web environment
    //     cvByte = await getBlobData(objidcard.frontidcard2!.path);
    //   } else {
    //     // For mobile environment
    //     cvByte = await File(objidcard.frontidcard2!.path).readAsBytes();
    //   }
    //   request.files.add(http.MultipartFile.fromBytes(
    //     'frontidcard2',
    //     cvByte,
    //     filename: 'asdasdasd.jpg',
    //   ));
    // } else {
    //   print("Error: No image provided");
    // }

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

    // if (objidcard.backidcard2 != null) {
    //   Uint8List cvByte;
    //   if (kIsWeb && objidcard.backidcard2!.path.startsWith('blob:')) {
    //     // For web environment
    //     cvByte = await getBlobData(objidcard.backidcard2!.path);
    //   } else {
    //     // For mobile environment
    //     cvByte = await File(objidcard.backidcard2!.path).readAsBytes();
    //   }
    //   request.files.add(http.MultipartFile.fromBytes(
    //     'backidcard2',
    //     cvByte,
    //     filename: 'asdasdasd.jpg',
    //   ));
    // } else {
    //   print("Error: No image provided");
    // }

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("Done in Card");
    } else {
      print(response.reasonPhrase);
    }
  }
}
