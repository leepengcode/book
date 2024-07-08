import 'dart:convert';
import 'dart:io';

import 'package:book/Form/Widget/CoverWidget.dart';
import 'package:book/Form/Widget/FinalIndicationWidget.dart';
import 'package:book/Form/Widget/GoogleMap.dart';
import 'package:book/Form/Widget/NearbyProperty.dart';
import 'package:book/Form/Widget/PhotoDetail.dart';
import 'package:book/Form/Widget/PropertyInfo.dart';
import 'package:book/Form/Widget/ProvisionalValuationWidget.dart';
import 'package:book/Form/Widget/uploadIdCard.dart';
import 'package:book/Form/Widget/uploadLayoutWidget.dart';
import 'package:book/Model/CoverModel.dart';
import 'package:book/Model/GoogleMapModep.dart';
import 'package:book/Model/IDCardModel.dart';
import 'package:book/Model/PropertyInfoModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FormWidget extends StatefulWidget {
  const FormWidget({
    super.key,
  });

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  var ck1;
  Cover? dataCover;
  PropertyInfor? dataInfo;
  IDCard? dataIdcard;
  // Future InsertInfo() async {
  //   //   var request = http.MultipartRequest(
  //   //       'POST', Uri.parse('http://192.168.1.31:8000/api/insertinfo'));
  //   //   request.fields.addAll(dataInfo!.toJson());
  //   //   http.StreamedResponse response = await request.send();
  //   //   setState(() {
  //   //     print("test btn ${response.statusCode}\n");
  //   //   });
  //   //   if (response.statusCode == 200 || response.statusCode == 201) {
  //   //     // print(await response.stream.bytesToString());
  //   //     print("Success\n");
  //   //   } else {
  //   //     print(response.reasonPhrase);
  //   //   }
  //   // }
  // }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            // CoverWidget(
            //   onChanged: (value) {
            //     setState(() {
            //       ck1 = value.toString();
            //     });
            //   },
            //   getForm: (value) {
            //     setState(() {
            //       if (value != null) {
            //         print("object ${value.info}");
            //         dataCover = value;
            //       }
            //     });
            //   },
            // ),
            // const SizedBox(
            //   height: 25,
            // ),
            // PropertyInfo_Widget(
            //   getForm: (value) {
            //     setState(() {
            //       dataInfo = value;
            //     });
            //   },
            //   ck1: ck1,
            // ),
            // const SizedBox(
            //   height: 25,
            // ),
            uploadIDCard(
              getForm: (value) {
                if (value != null) {
                  dataIdcard = value;
                  //print("kokok\n");
                }
              },
            ),
            const SizedBox(
              height: 25,
            ),
            // uploadLayoutWidget(
            //   ck1: ck1,
            // ),
            // const SizedBox(
            //   height: 25,
            // ),
            // // const Mapwidget(),
            // const SizedBox(
            //   height: 25,
            // ),
            // PhotoDetailWidget(
            //   ck1: ck1,
            // ),
            // const SizedBox(
            //   height: 25,
            // ),
            // NearbyPropertyWidget(),
            // SizedBox(
            //   height: 25,
            // ),
            // GoogleMapImage(),
            // SizedBox(
            //   height: 25,
            // ),
            // ProvisionalValue(
            //   NoLandCount: 1,
            //   ck1: ck1,
            // ),
            // SizedBox(
            //   height: 30,
            // ),
            // FinalIndicationWidget(
            //   ck1: ck1,
            //   NoLandCount: 1,
            // ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                await InsertIdCard(dataIdcard!);

                // await PropertyInfor()
                //   ..InsertInfo(dataInfo!);

                // await Cover()
                //   ..InsertCover(dataCover!);
              },
              child: Center(
                  child: Container(
                width: 150,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue),
                child: Center(
                    child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              )),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

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
  }
}
