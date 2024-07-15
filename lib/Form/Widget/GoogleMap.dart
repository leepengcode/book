import 'dart:io';

import 'package:book/Componnents/googlelocation.dart';
import 'package:book/Componnents/style.dart';
import 'package:book/Model/FinalMapModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

typedef OnChangeCallback = void Function(dynamic value);

class GoogleMapImage extends StatefulWidget {
  final OnChangeCallback? getFile;
  const GoogleMapImage({super.key, this.getFile});

  @override
  State<GoogleMapImage> createState() => _GoogleMapState();
}

class _GoogleMapState extends State<GoogleMapImage> {
  FinalMap objfinalmap = FinalMap(Finalmap: null);
  File? image;
  String? imageUrl;
  Future<File?> pickImage(String? check_Calling) async {
    File? image;
    try {
      XFile? pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage == null) {
        return null;
      } else {
        setState(() {
          imageUrl = pickedImage.path;
          print("object $check_Calling : $imageUrl\n");
          image = File(pickedImage.path);
        });
        return image!;
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
      return null;
    }
  }

  File? map;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 22, horizontal: 22),
        width: 1500,
        decoration: BoxDecoration(
            color: Colors.blueGrey.shade100,
            borderRadius: BorderRadius.circular(10)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Google Location of Comparable Property",
            style: THeader(),
          ),
          SizedBox(
            height: 5,
          ),
          Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (map != null)
                        Image.network(
                          map!.path,
                          width: 1000,
                          height: 600,
                          fit: BoxFit.cover,
                        )
                    ],
                  ),
                  Positioned(
                      child: GestureDetector(
                          onTap: () async {
                            map = await pickImage('Pmap');
                            setState(() {
                              map;
                              objfinalmap.Finalmap = map;
                            });
                          },
                          child: Container(
                            width: 1000,
                            height: 600,
                            decoration: BoxDecoration(border: Border.all()),
                            child: (map == null)
                                ? Image.network(
                                    "https://img.icons8.com/cotton/100/image--v2.png")
                                : SizedBox(),
                          ))),
                ],
              )),
          InkWell(
              onTap: () {
                setState(() {
                  widget.getFile!(objfinalmap);
                });

                // Wrap widget.getForm call in a try-catch block
              },
              child: Center(
                child: Text("Tesing get"),
              ))
        ]));
  }
}
