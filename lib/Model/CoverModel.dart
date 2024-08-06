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

  factory Cover.fromJson(Map<String, dynamic> json) {
    return Cover(
      header: json['header'] ?? '',
      info: json['info'] ?? '',
      bank: json['bank'] ?? '',
      branch: json['branch'] ?? '',
      ownership: json['ownership'] ?? '',
      image: File.fromRawPath(base64Decode(
          json['image'] ?? '')), // Assuming image is stored as base64
      ownername: json['ownername'] ?? '',
      deeptitle: json['deeptitle'] ?? '',
      location: json['location'] ?? '',
      street: json['street'] ?? '',
      cityorprovince: json['cityorprovince'] ?? '',
      communeorkhan: json['communeorkhan'] ?? '',
      districtorsangkat: json['districtorsangkat'] ?? '',
      villageorphum: json['villageorphum'] ?? '',
      reportto: json['reportto'] ?? '',
      date: json['date'] ?? '',
      code: json['code'] ?? '',
    );
  }

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

  Future<String> convertToBase64(String path) async {
    var cvByte = await getBlobData(path);
    return base64Encode(cvByte);
  }

  Future InsertCover(Cover objCover, var id_book) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://virakst.online/bookReport/public/api/insertcover/${id_book}'));

    request.fields.addAll(objCover.toJson());

    if (objCover.image != null) {
      Uint8List cvByte;
      var cvByte1;
      if (kIsWeb && objCover.image!.path.startsWith('blob:')) {
        // For web environment

        cvByte1 = convertToBase64(objCover.image!.path);
      } else {
        // For mobile environment
        cvByte = await File(objCover.image!.path).readAsBytes();
      }

      request.files.add(http.MultipartFile.fromString('image', cvByte1));
    } else {
      print("Error: No image provided");
    }

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("Done in Cover");
    } else {
      print(response.statusCode);
      print("object not done");
    }
  }
}
