import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http/http.dart' as http;

class Cover {
  String? header;
  String? info;
  String? bank;
  String? branch;
  String? ownership;
  File? image;
  String? ownername;
  String? deeptitle;
  String? location;
  String? street;
  String? cityorprovince;
  String? communeorkhan;
  String? districtorsangkat;
  String? villageorphum;
  String? reportto;
  String? date;
  String? code;

  Cover(
      {this.header,
      this.info,
      this.bank,
      this.branch,
      this.ownership,
      this.image,
      this.ownername,
      this.deeptitle,
      this.location,
      this.street,
      this.cityorprovince,
      this.communeorkhan,
      this.districtorsangkat,
      this.villageorphum,
      this.reportto,
      this.date,
      this.code});

  Map<String, String> toJson() {
    return {
      'header': header ?? '',
      'info': info ?? '',
      'bank': bank ?? '',
      'branch': branch ?? '',
      'ownership': ownership ?? '',
      'ownername': ownername ?? '',
      'deeptitle': deeptitle ?? '',
      'location': location ?? '',
      'street': street ?? '',
      'cityorprovince': cityorprovince ?? '',
      'communeorkhan': communeorkhan ?? '',
      'districtorsangkat': districtorsangkat ?? '',
      'villageorphum': villageorphum ?? '',
      'reportto': reportto ?? '',
      'date': date ?? '',
      'code': code ?? '',
    };
  }

  // @override
  // String toString() {
  //   // TODO: implement toString
  //   // return "${super.toString()} , '+ ' ${image!.path.toString()}";
  //   return "${super.toString()} , '+ ' ${image!.path}";
  // }

  Future<Uint8List> getBlobData(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // Uint8List cvByte = await CompressFile_to_Uint8List(response.bodyBytes);
      return response.bodyBytes;
    } else {
      throw Exception('Failed to load blob data');
    }
  }

  Future InsertCover(Cover objCover) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://www.angkorrealestate.com/book_report/bookReport/public/api/insertcover'));

    request.fields.addAll(objCover.toJson());

    if (objCover.image != null) {
      Uint8List cvByte;
      if (kIsWeb && objCover.image!.path.startsWith('blob:')) {
        // For web environment

        cvByte = await getBlobData(objCover.image!.path);
      } else {
        // For mobile environment
        cvByte = await File(objCover.image!.path).readAsBytes();
      }

      request.files.add(http.MultipartFile.fromBytes(
        'image',
        cvByte,
        filename: 'care.jpg',
      ));
    } else {
      print("Error: No image provided");
    }

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      print("object done");
    } else {
      print(response.statusCode);
      print("object not done");
    }
  }
}
