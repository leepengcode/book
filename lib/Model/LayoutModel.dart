import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';

class Layout {
  var deepimage1;
  var deepimage2;
  var layoutimage;

  Layout({
    this.deepimage1,
    this.deepimage2,
    this.layoutimage,
  });
  factory Layout.fromJson(Map<String, dynamic> json) {
    return Layout(
      deepimage1: base64Decode(json['deepimage1']),
      deepimage2: base64Decode(json['deepimage2']),
      layoutimage: base64Decode(json['layoutimage']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'deepimage1': deepimage1,
      'deepimage2': deepimage2,
      'layoutimage': layoutimage,
    };
  }

  Future<Uint8List> getBlobData(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to load blob data');
    }
  }

  Future InsertLayout(Layout objlayout, var id_book) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://virakst.online/bookReport/public/api/insertlayout/${id_book}'));

    print("object btnClick");
    if (objlayout.deepimage1 != null) {
      Uint8List cvByte;
      if (kIsWeb && objlayout.deepimage1!.path.startsWith('blob:')) {
        // For web environment
        cvByte = await getBlobData(objlayout.deepimage1!.path);
      } else {
        // For mobile environment
        cvByte = await File(objlayout.deepimage1!.path).readAsBytes();
      }
      request.files.add(http.MultipartFile.fromBytes(
        'deepimage1',
        cvByte,
        filename: 'asdasdasd.jpg',
      ));
    } else {
      print("Error: No image provided");
    }

    if (objlayout.deepimage2 != null) {
      Uint8List cvByte;
      if (kIsWeb && objlayout.deepimage2!.path.startsWith('blob:')) {
        // For web environment
        cvByte = await getBlobData(objlayout.deepimage2!.path);
      } else {
        // For mobile environment
        cvByte = await File(objlayout.deepimage2!.path).readAsBytes();
      }
      request.files.add(http.MultipartFile.fromBytes(
        'deepimage2',
        cvByte,
        filename: 'asdasdasd.jpg',
      ));
    } else {
      print("Error: No image provided");
    }

    if (objlayout.layoutimage != null) {
      Uint8List cvByte;
      if (kIsWeb && objlayout.layoutimage!.path.startsWith('blob:')) {
        // For web environment
        cvByte = await getBlobData(objlayout.layoutimage!.path);
      } else {
        // For mobile environment
        cvByte = await File(objlayout.layoutimage!.path).readAsBytes();
      }
      request.files.add(http.MultipartFile.fromBytes(
        'layoutimage',
        cvByte,
        filename: 'asdasdasd.jpg',
      ));
    } else {
      print("Error: No image provided");
    }

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("Done in Layout");
    } else {
      print(response.reasonPhrase);
    }
  }
}
