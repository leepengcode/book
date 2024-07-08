import 'dart:convert';
<<<<<<< Updated upstream
import 'dart:io';
import 'package:flutter/foundation.dart';
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

  Cover({
    this.header,
    this.info,
=======

class Cover {
  final String header;
  final String info;
  final String? bank;
  final String? branch;
  final String? ownership;
  var image;
  final String ownername;
  final String deeptitle;
  final String? location;
  final String? street;
  final String cityorprovince;
  final String communeorkhan;
  final String districtorsankat;
  final String villageorphum;
  final String reportto;
  final String date;

  Cover({
    required this.header,
    required this.info,
>>>>>>> Stashed changes
    this.bank,
    this.branch,
    this.ownership,
    this.image,
<<<<<<< Updated upstream
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
  });

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
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    // return "${super.toString()} , '+ ' ${image!.path.toString()}";
    return "${super.toString()} , '+ ' ${image!.path}";
  }

  Future<Uint8List> getBlobData(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to load blob data');
    }
  }

  Future InsertCover(Cover objCover) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://192.168.1.31:8000/api/insertcover'));

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
  }
}

// Future<void> insertCover(Cover objCover) async {
//   var request = http.MultipartRequest(
//       'POST', Uri.parse('http://192.168.1.31:8000/api/insertcover'));

//   request.fields.addAll(objCover.toJson());

//   if (objCover.image != null) {
//     request.files.add(await http.MultipartFile.fromPath('image', objCover.image!.path));
//   }

//   http.StreamedResponse response = await request.send();

//   if (response.statusCode == 201) {
//     print(await response.stream.bytesToString());
//   } else {
//     print(response.reasonPhrase);
//   }

// }


=======
    required this.ownername,
    required this.deeptitle,
    this.location,
    this.street,
    required this.cityorprovince,
    required this.communeorkhan,
    required this.districtorsankat,
    required this.villageorphum,
    required this.reportto,
    required this.date,
  });
  factory Cover.fromJson(Map<String, dynamic> json) {
    return Cover(
      header: json['header'] ?? '',
      info: json['info'] ?? '',
      bank: json['bank'] ?? '',
      branch: json['branch'] ?? '',
      ownership: json['ownership'] ?? '',
      image: json['image'] ?? '',
      ownername: json['ownername'] ?? '',
      deeptitle: json['deeptitle'] ?? '',
      location: json['location'] ?? '',
      street: json['street'] ?? '',
      cityorprovince: json['cityorprovince'] ?? '',
      communeorkhan: json['communeorkhan'] ?? '',
      districtorsankat: json['districtorsankat'] ?? '',
      villageorphum: json['villageorphum'] ?? '',
      reportto: json['reportto'] ?? '',
      date: json['date'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'header': header,
      'info': info,
      'bank': bank,
      'branch': branch,
      'ownership': ownership,
      'image': image,
      'ownername': ownername,
      'deeptitle': deeptitle,
      'location': location,
      'street': street,
      'cityorprovince': cityorprovince,
      'communeorkhan': communeorkhan,
      'districtorsankat': districtorsankat,
      'villageorphum': villageorphum,
      'reportto': reportto,
      'date': date,
    };
  }
}
>>>>>>> Stashed changes
