import 'dart:io';

import 'package:book/Model/GoogleMapModep.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
        padding: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            color: Colors.blueGrey.shade100,
            borderRadius: BorderRadius.circular(10)),
        child: StaggeredGrid.count(
            crossAxisCount: 3,
            mainAxisSpacing: 9, //អ័ក្សX
            crossAxisSpacing: 9,
            children: [
              Column(
                children: [
                  Text.rich(
                    overflow: TextOverflow.ellipsis,
                    TextSpan(children: [
                      TextSpan(
                        text: "Location Map in Phnom Penh",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      TextSpan(
                        text: " *",
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      )
                    ]),
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
                                  width: 300,
                                  height: 200,
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
                                    width: 300,
                                    height: 200,
                                    decoration:
                                        BoxDecoration(border: Border.all()),
                                    child: (pmapimage == null)
                                        ? Image.network(
                                            "https://img.icons8.com/cotton/100/image--v2.png")
                                        : SizedBox(),
                                  ))),
                        ],
                      )),
                ],
              ),
              Column(
                children: [
                  Text.rich(
                    overflow: TextOverflow.ellipsis,
                    TextSpan(children: [
                      TextSpan(
                        text: "Aerial Photograph of Phnom Penh Location ",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      TextSpan(
                        text: " *",
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      )
                    ]),
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
                                  width: 300,
                                  height: 200,
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
                                    width: 300,
                                    height: 200,
                                    decoration:
                                        BoxDecoration(border: Border.all()),
                                    child: (apmapimage == null)
                                        ? Image.network(
                                            "https://img.icons8.com/cotton/100/image--v2.png")
                                        : SizedBox(),
                                  )))
                        ],
                      )),
                ],
              ),
              Column(
                children: [
                  Text.rich(
                    overflow: TextOverflow.ellipsis,
                    TextSpan(children: [
                      TextSpan(
                        text: "Map Sketch",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      TextSpan(
                        text: " *",
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      )
                    ]),
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
                                  width: 300,
                                  height: 200,
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
                                    width: 300,
                                    height: 200,
                                    decoration:
                                        BoxDecoration(border: Border.all()),
                                    child: (skmapimage == null)
                                        ? Image.network(
                                            "https://img.icons8.com/cotton/100/image--v2.png")
                                        : SizedBox(),
                                  )))
                        ],
                      )),
                ],
              )
            ]));
  }
}
