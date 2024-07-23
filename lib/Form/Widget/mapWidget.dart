import 'dart:io';

import 'package:book/Componnents/style.dart';
import 'package:book/Componnents/uploadSketchMap.dart';
import 'package:book/Model/GoogleMapModep.dart';
import 'package:book/Package/google_map_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps/google_maps.dart';
import 'package:image_picker/image_picker.dart';

class Mapwidget extends StatefulWidget {
  final ValueChanged<Gmap> getForm;
  Mapwidget({
    super.key,
    required this.getForm,
  });

  @override
  State<Mapwidget> createState() => _MapwidgetState();
}

class _MapwidgetState extends State<Mapwidget> {
  Gmap objGmap = Gmap(apmapimage: null, pmapimage: null, skmapimage: null);
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

  File? pmapimage;
  File? apmapimage;
  File? skmapimage;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 22),
        width: 1500,
        decoration: BoxDecoration(
            color: Colors.blueGrey.shade100,
            borderRadius: BorderRadius.circular(10)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Text(
                "Location Map in Phnom Penh",
                style: THeader(),
              ),
              Text(
                " *",
                style: TextStyle(color: Colors.red, fontSize: 15),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (pmapimage != null)
                        Image.network(
                          pmapimage!.path,
                          width: 1000,
                          height: 600,
                          fit: BoxFit.cover,
                        )
                    ],
                  ),
                  Positioned(
                      child: GestureDetector(
                          onTap: () async {
                            pmapimage = await pickImage('Pmap');
                            setState(() {
                              pmapimage;
                              objGmap.pmapimage = pmapimage;
                            });
                          },
                          child: Container(
                            width: 1000,
                            height: 600,
                            decoration: BoxDecoration(border: Border.all()),
                            child: (pmapimage == null)
                                ? Image.network(
                                    "https://img.icons8.com/cotton/100/image--v2.png")
                                : SizedBox(),
                          ))),
                ],
              )),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "Aerial Photograph of Phnom Penh Location ",
                style: THeader(),
              ),
              Text(
                " *",
                style: TextStyle(color: Colors.red, fontSize: 15),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (apmapimage != null)
                        Image.network(
                          apmapimage!.path,
                          width: 1000,
                          height: 600,
                          fit: BoxFit.cover,
                        )
                    ],
                  ),
                  Positioned(
                      child: GestureDetector(
                          onTap: () async {
                            apmapimage = await pickImage('apmap');
                            setState(() {
                              apmapimage;
                              objGmap.apmapimage = apmapimage;
                            });
                          },
                          child: Container(
                            width: 1000,
                            height: 600,
                            decoration: BoxDecoration(border: Border.all()),
                            child: (apmapimage == null)
                                ? Image.network(
                                    "https://img.icons8.com/cotton/100/image--v2.png")
                                : SizedBox(),
                          )))
                ],
              )),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "Map Sketch",
                style: THeader(),
              ),
              Text(
                " *",
                style: TextStyle(color: Colors.red, fontSize: 15),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (skmapimage != null)
                        Image.network(
                          skmapimage!.path,
                          width: 1000,
                          height: 600,
                          fit: BoxFit.cover,
                        )
                    ],
                  ),
                  Positioned(
                      child: GestureDetector(
                          onTap: () async {
                            skmapimage = await pickImage('skmap');
                            setState(() {
                              skmapimage;
                              objGmap.skmapimage = skmapimage;
                              widget.getForm(objGmap);
                            });
                          },
                          child: Container(
                            width: 1000,
                            height: 600,
                            decoration: BoxDecoration(border: Border.all()),
                            child: (skmapimage == null)
                                ? Image.network(
                                    "https://img.icons8.com/cotton/100/image--v2.png")
                                : SizedBox(),
                          )))
                ],
              )),
        ]));
  }
}
