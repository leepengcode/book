import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class FinalMap {
  File? Finalmap;

  FinalMap({this.Finalmap});
  factory FinalMap.fromJson(Map<String, dynamic> json) {
    return FinalMap(
      Finalmap: File.fromRawPath(base64Decode(json['finalmap'])),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'Finalmap': Finalmap,
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

  Future InsertFinalMap(FinalMap objfinalmap, var id_book) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://virakst.online/bookReport/public/api/insertfinalmap/${id_book}'));

    print("Save \n\n");
    if (objfinalmap.Finalmap != null) {
      Uint8List cvByte;
      if (kIsWeb && objfinalmap.Finalmap!.path.startsWith('blob:')) {
        // For web environment
        cvByte = await getBlobData(objfinalmap.Finalmap!.path);
      } else {
        // For mobile environment
        cvByte = await File(objfinalmap.Finalmap!.path).readAsBytes();
      }
      request.files.add(http.MultipartFile.fromBytes(
        'finalmap',
        cvByte,
        filename: 'asdasdasd.jpg',
      ));
    } else {
      print("Error: No image provided");
    }
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("Done in InsertFinalMap");
    } else {
      print(response.reasonPhrase);
    }
  }
}
