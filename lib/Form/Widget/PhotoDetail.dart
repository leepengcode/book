// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:book/Componnents/style.dart';
import 'package:book/Model/PhotoDetailModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

typedef OnChangeCallback = void Function(List<File>? value);

class PhotoDetailWidget extends StatefulWidget {
  final String? ck1;
  final OnChangeCallback? get_viewproperty;
  final OnChangeCallback? get_insideproperty;
  final OnChangeCallback? get_viewland;
  final ValueChanged<PhotoDetail> getForm;
  PhotoDetailWidget({
    super.key,
    this.ck1,
    required this.getForm,
    required this.get_viewproperty,
    required this.get_insideproperty,
    this.get_viewland,
  });

  @override
  State<PhotoDetailWidget> createState() => _PhotoDetailWidgetState();
}

class _PhotoDetailWidgetState extends State<PhotoDetailWidget> {
  PhotoDetail objPhotoDetail = PhotoDetail(
    frontviewimage: null,
    roadviewimage1: null,
    roadviewimage2: null,
    surroundin1: null,
    surroundin2: null,
    surroundin3: null,
    surroundin4: null,
    surroundin5: null,
    surroundin6: null,
    dessurroundin1: 'dessurroundin1',
    dessurroundin2: 'dessurroundin2',
    dessurroundin3: 'dessurroundin3',
    dessurroundin4: 'dessurroundin4',
    dessurroundin5: 'dessurroundin5',
    dessurroundin6: 'dessurroundin6',
  );
  File? frontview;
  File? road1_land1;
  File? road2_land2;

  File? surround1_lan1;
  File? surround2_lan2;
  File? surround3_lan3;
  File? surround4_lan4;
  File? surround5_lan5;
  File? surround6_lan6;

  List<File>? viewproperty;
  List<File>? insideproperty;
  List<File>? viewland;
  var c = "koko\n";
  final dessurround1_lan1 = TextEditingController();
  final dessurround2_lan2 = TextEditingController();
  final dessurround3_lan3 = TextEditingController();
  final dessurround4_lan4 = TextEditingController();
  final dessurround5_lan5 = TextEditingController();
  final dessurround6_lan6 = TextEditingController();

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

  List<File>? imageFileList = [];

  Future<List<File>> selectImages() async {
    List<File> tempList = [];
    try {
      List<XFile>? selectedImages = await ImagePicker().pickMultiImage();
      for (var image in selectedImages) {
        tempList.add(File(image.path));
      }

      return tempList;
    } catch (e) {
      print("Error picking images: $e");
      return tempList;
    }
  }

  void removeImage(int index) {
    setState(() {
      if (widget.ck1 != "Property LAND VALUATION REPORT") {
        viewproperty!.removeAt(index);
      } else {
        viewland!.removeAt(index);
      }
    });
  }

  void removeImageinsideproperty(int index) {
    setState(() {
      insideproperty!.removeAt(index);
    });
  }

  @override
  void initState() {
    if (widget.ck1 != "Property LAND VALUATION REPORT") {
      viewproperty = [];
      insideproperty = [];
    } else {
      viewland = [];
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.ck1;
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 22),
        width: 1500,
        decoration: BoxDecoration(
            color: Colors.blueGrey.shade100,
            borderRadius: BorderRadius.circular(10)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          if (widget.ck1 != "Property LAND VALUATION REPORT") ...[
            Column(
              children: [
                Text(
                  "Details of Photos taken at the Site Inspection",
                  style: THeader(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "I. Photo front view of the property",
                      style: THeader(),
                    ),
                    Text(
                      " *",
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (frontview != null) ...[
                              Image.network(
                                frontview!.path,
                                width: 500,
                                height: 300,
                                fit: BoxFit.cover,
                              )
                            ]
                          ],
                        ),
                        Positioned(
                          child: GestureDetector(
                            onTap: () async {
                              frontview = await pickImage('frontview');
                              setState(() {
                                frontview;
                                objPhotoDetail.frontviewimage = frontview;
                              });
                            },
                            child: Container(
                              width: 500,
                              height: 300,
                              decoration: BoxDecoration(border: Border.all()),
                              child: (frontview == null)
                                  ? Image.network(
                                      "https://img.icons8.com/cotton/100/image--v2.png")
                                  : SizedBox(),
                            ),
                          ),
                        )
                      ],
                    )),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "II. Photos inside view of the property",
                  style: THeader(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "1. Photos view of the property",
                      style: THeader(),
                    ),
                    Text(
                      " *",
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      width: 1000,
                      height: 500,
                      color: Colors.white54,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              var selectedImages = await selectImages();
                              setState(() {
                                widget.get_viewproperty!(selectedImages);
                                viewproperty = selectedImages;
                              });
                            },
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Image.network(
                                "https://img.icons8.com/cotton/100/image--v2.png",
                              ),
                            ),
                          ),
                          Divider(),
                          Expanded(
                            child: viewproperty != null
                                ? GridView.builder(
                                    itemCount: viewproperty!.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                    ),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (kIsWeb) {
                                        return Stack(
                                          children: [
                                            Container(
                                              height: 320,
                                              padding: EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                border: Border.all(),
                                                color: const Color.fromARGB(
                                                    255, 255, 255, 255),
                                              ),
                                              child: Image.network(
                                                viewproperty![index].path,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            Positioned(
                                              top: 10,
                                              right: 10,
                                              child: IconButton(
                                                onPressed: () {
                                                  removeImage(index);
                                                },
                                                icon: Image.network(
                                                  "https://img.icons8.com/pulsar-gradient/23/delete-forever.png",
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      } else {
                                        return Container(
                                          padding: EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              border: Border.all()),
                                          child: Image.file(
                                            File(viewproperty![index].path),
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      }
                                    },
                                  )
                                : Center(child: Text('No images selected')),
                          ),
                        ],
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "2. Photos inside of the property",
                      style: THeader(),
                    ),
                    Text(
                      " *",
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    width: 1000,
                    height: 500,
                    color: Colors.white54,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            var selectedImages = await selectImages();

                            setState(() {
                              insideproperty = selectedImages;
                              widget.get_insideproperty!(selectedImages);
                            });
                          },
                          child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: Image.network(
                                  "https://img.icons8.com/cotton/100/image--v2.png")),
                        ),
                        Divider(),
                        Expanded(
                          child: GridView.builder(
                            itemCount: insideproperty!.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              if (kIsWeb) {
                                return Stack(
                                  children: [
                                    Container(
                                      height: 320,
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          border: Border.all(),
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255)),
                                      child: Image.network(
                                        insideproperty![index].path,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Positioned(
                                        top: 10,
                                        right: 10,
                                        child: IconButton(
                                            onPressed: () {
                                              removeImageinsideproperty(index);
                                            },
                                            icon: Image.network(
                                                "https://img.icons8.com/pulsar-gradient/23/delete-forever.png")))
                                  ],
                                );
                              } else {
                                return Container(
                                  padding: EdgeInsets.all(3),
                                  decoration:
                                      BoxDecoration(border: Border.all()),
                                  child: Image.file(
                                    File(insideproperty![index].path),
                                    fit: BoxFit.cover,
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "III. Photos Access Road view to the Subject Property",
                      style: THeader(),
                    ),
                    Text(
                      " *",
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (road1_land1 != null) ...[
                              Image.network(
                                road1_land1!.path,
                                width: 500,
                                height: 300,
                                fit: BoxFit.cover,
                              )
                            ]
                          ],
                        ),
                        Positioned(
                          child: GestureDetector(
                            onTap: () async {
                              road1_land1 = await pickImage('road1_land1');
                              setState(() {
                                road1_land1;
                                objPhotoDetail.roadviewimage1 = road1_land1;
                              });
                            },
                            child: Container(
                              width: 500,
                              height: 300,
                              decoration: BoxDecoration(border: Border.all()),
                              child: (road1_land1 == null)
                                  ? Image.network(
                                      "https://img.icons8.com/cotton/100/image--v2.png")
                                  : SizedBox(),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (road2_land2 != null) ...[
                              Image.network(
                                road2_land2!.path,
                                width: 500,
                                height: 300,
                                fit: BoxFit.cover,
                              )
                            ]
                          ],
                        ),
                        Positioned(
                          child: GestureDetector(
                            onTap: () async {
                              road2_land2 = await pickImage('road2_land2');
                              setState(() {
                                road2_land2;
                                objPhotoDetail.roadviewimage2 = road2_land2;
                              });
                            },
                            child: Container(
                              width: 500,
                              height: 300,
                              decoration: BoxDecoration(border: Border.all()),
                              child: (road2_land2 == null)
                                  ? Image.network(
                                      "https://img.icons8.com/cotton/100/image--v2.png")
                                  : SizedBox(),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "IV. Photos surrounding view of the property",
                      style: THeader(),
                    ),
                    Text(
                      " *",
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (surround1_lan1 != null) ...[
                                  Image.network(
                                    surround1_lan1!.path,
                                    width: 500,
                                    height: 300,
                                    fit: BoxFit.cover,
                                  )
                                ]
                              ],
                            ),
                            Positioned(
                              child: GestureDetector(
                                onTap: () async {
                                  surround1_lan1 =
                                      await pickImage('surround1_lan1');
                                  setState(() {
                                    surround1_lan1;
                                    objPhotoDetail.surroundin1 = surround1_lan1;
                                  });
                                },
                                child: Container(
                                  width: 500,
                                  height: 300,
                                  decoration:
                                      BoxDecoration(border: Border.all()),
                                  child: (surround1_lan1 == null)
                                      ? Image.network(
                                          "https://img.icons8.com/cotton/100/image--v2.png")
                                      : SizedBox(),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 500,
                          child: TextField(
                            controller: dessurround1_lan1,
                            onChanged: (value) {
                              setState(() {
                                objPhotoDetail.dessurroundin1 =
                                    value.toString();
                              });
                            },
                            maxLines: null,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: "Text",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16)),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (surround2_lan2 != null) ...[
                                  Image.network(
                                    surround2_lan2!.path,
                                    width: 500,
                                    height: 300,
                                    fit: BoxFit.cover,
                                  )
                                ]
                              ],
                            ),
                            Positioned(
                              child: GestureDetector(
                                onTap: () async {
                                  surround2_lan2 =
                                      await pickImage('surround2_lan2');
                                  setState(() {
                                    surround2_lan2;
                                    objPhotoDetail.surroundin2 = surround2_lan2;
                                  });
                                },
                                child: Container(
                                  width: 500,
                                  height: 300,
                                  decoration:
                                      BoxDecoration(border: Border.all()),
                                  child: (surround2_lan2 == null)
                                      ? Image.network(
                                          "https://img.icons8.com/cotton/100/image--v2.png")
                                      : SizedBox(),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 500,
                          child: TextField(
                            controller: dessurround2_lan2,
                            onChanged: (value) {
                              setState(() {
                                objPhotoDetail.dessurroundin2 =
                                    value.toString();
                              });
                            },
                            maxLines: null,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: "Text",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16)),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (surround3_lan3 != null) ...[
                                  Image.network(
                                    surround3_lan3!.path,
                                    width: 500,
                                    height: 300,
                                    fit: BoxFit.cover,
                                  )
                                ]
                              ],
                            ),
                            Positioned(
                              child: GestureDetector(
                                onTap: () async {
                                  surround3_lan3 =
                                      await pickImage('surround3_lan3');
                                  setState(() {
                                    surround3_lan3;
                                    objPhotoDetail.surroundin3 = surround3_lan3;
                                  });
                                },
                                child: Container(
                                  width: 500,
                                  height: 300,
                                  decoration:
                                      BoxDecoration(border: Border.all()),
                                  child: (surround3_lan3 == null)
                                      ? Image.network(
                                          "https://img.icons8.com/cotton/100/image--v2.png")
                                      : SizedBox(),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 500,
                          child: TextField(
                            controller: dessurround3_lan3,
                            onChanged: (value) {
                              setState(() {
                                objPhotoDetail.dessurroundin3 =
                                    value.toString();
                              });
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: "Text",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16)),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (surround4_lan4 != null) ...[
                                  Image.network(
                                    surround4_lan4!.path,
                                    width: 500,
                                    height: 300,
                                    fit: BoxFit.cover,
                                  )
                                ]
                              ],
                            ),
                            Positioned(
                              child: GestureDetector(
                                onTap: () async {
                                  surround4_lan4 =
                                      await pickImage('surround4_lan4');
                                  setState(() {
                                    surround4_lan4;
                                    objPhotoDetail.surroundin4 = surround4_lan4;
                                  });
                                },
                                child: Container(
                                  width: 500,
                                  height: 300,
                                  decoration:
                                      BoxDecoration(border: Border.all()),
                                  child: (surround4_lan4 == null)
                                      ? Image.network(
                                          "https://img.icons8.com/cotton/100/image--v2.png")
                                      : SizedBox(),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 500,
                          child: TextField(
                            controller: dessurround4_lan4,
                            onChanged: (value) {
                              setState(() {
                                objPhotoDetail.dessurroundin4 =
                                    value.toString();
                              });
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: "Text",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16)),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (surround5_lan5 != null) ...[
                                  Image.network(
                                    surround5_lan5!.path,
                                    width: 500,
                                    height: 300,
                                    fit: BoxFit.cover,
                                  )
                                ]
                              ],
                            ),
                            Positioned(
                              child: GestureDetector(
                                onTap: () async {
                                  surround5_lan5 =
                                      await pickImage('surround5_lan5');
                                  setState(() {
                                    surround5_lan5;
                                    objPhotoDetail.surroundin5 = surround5_lan5;
                                  });
                                },
                                child: Container(
                                  width: 500,
                                  height: 300,
                                  decoration:
                                      BoxDecoration(border: Border.all()),
                                  child: (surround5_lan5 == null)
                                      ? Image.network(
                                          "https://img.icons8.com/cotton/100/image--v2.png")
                                      : SizedBox(),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 500,
                          child: TextField(
                            controller: dessurround5_lan5,
                            onChanged: (value) {
                              setState(() {
                                objPhotoDetail.dessurroundin5 =
                                    value.toString();
                              });
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: "Text",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16)),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (surround6_lan6 != null) ...[
                                  Image.network(
                                    surround6_lan6!.path,
                                    width: 500,
                                    height: 300,
                                    fit: BoxFit.cover,
                                  )
                                ]
                              ],
                            ),
                            Positioned(
                              child: GestureDetector(
                                onTap: () async {
                                  surround6_lan6 =
                                      await pickImage('surround6_lan6');
                                  setState(() {
                                    surround6_lan6;
                                    objPhotoDetail.surroundin6 = surround6_lan6;
                                  });
                                },
                                child: Container(
                                  width: 500,
                                  height: 300,
                                  decoration:
                                      BoxDecoration(border: Border.all()),
                                  child: (surround6_lan6 == null)
                                      ? Image.network(
                                          "https://img.icons8.com/cotton/100/image--v2.png")
                                      : SizedBox(),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 500,
                          child: TextField(
                            controller: dessurround6_lan6,
                            onChanged: (value) {
                              setState(() {
                                objPhotoDetail.dessurroundin6 =
                                    value.toString();
                              });
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: "Text",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16)),
                            ),
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                widget.getForm(objPhotoDetail);
                              });

                              // Wrap widget.getForm call in a try-catch block
                            },
                            child: Center(
                              child: Text("Tesing get"),
                            ))
                      ],
                    )
                  ],
                )
              ],
            ),
          ] else ...[
            Column(
              children: [
                Text(
                  "Details of Photos taken at the Site Inspection",
                  style: THeader(),
                ),
                Row(
                  children: [
                    Text(
                      "I. Photo front view of the Land",
                      style: THeader(),
                    ),
                    Text(
                      " *",
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (frontview != null) ...[
                              Image.network(
                                frontview!.path,
                                width: 500,
                                height: 300,
                                fit: BoxFit.cover,
                              )
                            ]
                          ],
                        ),
                        Positioned(
                          child: GestureDetector(
                            onTap: () async {
                              frontview = await pickImage('frontview');
                              setState(() {
                                frontview;
                                objPhotoDetail.frontviewimage = frontview;
                              });
                            },
                            child: Container(
                              width: 500,
                              height: 300,
                              decoration: BoxDecoration(border: Border.all()),
                              child: (frontview == null)
                                  ? Image.network(
                                      "https://img.icons8.com/cotton/100/image--v2.png")
                                  : SizedBox(),
                            ),
                          ),
                        )
                      ],
                    )),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      "II. Photos inside view of the Land",
                      style: THeader(),
                    ),
                    Text(
                      " *",
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    width: 1000,
                    height: 500,
                    color: Colors.white54,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            var get_viewland = await selectImages();
                            setState(() {
                              viewland = get_viewland;
                              widget.get_viewland!(get_viewland);
                            });
                          },
                          child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: Image.network(
                                  "https://img.icons8.com/cotton/100/image--v2.png")),
                        ),
                        Divider(),
                        Expanded(
                          child: GridView.builder(
                            itemCount: viewland!.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              if (kIsWeb) {
                                return Stack(
                                  children: [
                                    Container(
                                      height: 320,
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          border: Border.all(),
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255)),
                                      child: Image.network(
                                        viewland![index].path,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Positioned(
                                        top: 10,
                                        right: 10,
                                        child: IconButton(
                                            onPressed: () {
                                              removeImage(index);
                                            },
                                            icon: Image.network(
                                                "https://img.icons8.com/pulsar-gradient/48/delete-forever.png")))
                                  ],
                                );
                              } else {
                                return Container(
                                  padding: EdgeInsets.all(3),
                                  decoration:
                                      BoxDecoration(border: Border.all()),
                                  child: Image.file(
                                    File(viewland![index].path),
                                    fit: BoxFit.cover,
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      "III. Photos Access Road view to the Subject Land",
                      style: THeader(),
                    ),
                    Text(
                      " *",
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (road1_land1 != null) ...[
                              Image.network(
                                road1_land1!.path,
                                width: 500,
                                height: 300,
                                fit: BoxFit.cover,
                              )
                            ]
                          ],
                        ),
                        Positioned(
                          child: GestureDetector(
                            onTap: () async {
                              road1_land1 = await pickImage('road1_land1');
                              setState(() {
                                road1_land1;
                                objPhotoDetail.roadviewimage1 = road1_land1;
                              });
                            },
                            child: Container(
                              width: 500,
                              height: 300,
                              decoration: BoxDecoration(border: Border.all()),
                              child: (road1_land1 == null)
                                  ? Image.network(
                                      "https://img.icons8.com/cotton/100/image--v2.png")
                                  : SizedBox(),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (road2_land2 != null) ...[
                              Image.network(
                                road2_land2!.path,
                                width: 500,
                                height: 300,
                                fit: BoxFit.cover,
                              )
                            ]
                          ],
                        ),
                        Positioned(
                          child: GestureDetector(
                            onTap: () async {
                              road2_land2 = await pickImage('road2_land2');
                              setState(() {
                                road2_land2;
                                objPhotoDetail.roadviewimage2 = road2_land2;
                              });
                            },
                            child: Container(
                              width: 500,
                              height: 300,
                              decoration: BoxDecoration(border: Border.all()),
                              child: (road2_land2 == null)
                                  ? Image.network(
                                      "https://img.icons8.com/cotton/100/image--v2.png")
                                  : SizedBox(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      "IV. Photos surrounding view of the Land",
                      style: THeader(),
                    ),
                    Text(
                      " *",
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (surround1_lan1 != null) ...[
                                  Image.network(
                                    surround1_lan1!.path,
                                    width: 500,
                                    height: 300,
                                    fit: BoxFit.cover,
                                  )
                                ]
                              ],
                            ),
                            Positioned(
                              child: GestureDetector(
                                onTap: () async {
                                  surround1_lan1 =
                                      await pickImage('surround1_lan1');
                                  setState(() {
                                    surround1_lan1;
                                    objPhotoDetail.surroundin1 = surround1_lan1;
                                  });
                                },
                                child: Container(
                                  width: 500,
                                  height: 300,
                                  decoration:
                                      BoxDecoration(border: Border.all()),
                                  child: (surround1_lan1 == null)
                                      ? Image.network(
                                          "https://img.icons8.com/cotton/100/image--v2.png")
                                      : SizedBox(),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 500,
                          child: TextField(
                            controller: dessurround1_lan1,
                            onChanged: (value) {
                              setState(() {
                                objPhotoDetail.dessurroundin1 =
                                    value.toString();
                              });
                            },
                            maxLines: null,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                hintText: "Text",
                                border: InputBorder.none),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (surround2_lan2 != null) ...[
                                  Image.network(
                                    surround2_lan2!.path,
                                    width: 500,
                                    height: 300,
                                    fit: BoxFit.cover,
                                  )
                                ]
                              ],
                            ),
                            Positioned(
                              child: GestureDetector(
                                onTap: () async {
                                  surround2_lan2 =
                                      await pickImage('surround2_lan2');
                                  setState(() {
                                    surround2_lan2;
                                    objPhotoDetail.surroundin2 = surround2_lan2;
                                  });
                                },
                                child: Container(
                                  width: 500,
                                  height: 300,
                                  decoration:
                                      BoxDecoration(border: Border.all()),
                                  child: (surround2_lan2 == null)
                                      ? Image.network(
                                          "https://img.icons8.com/cotton/100/image--v2.png")
                                      : SizedBox(),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 500,
                          child: TextField(
                            controller: dessurround2_lan2,
                            onChanged: (value) {
                              setState(() {
                                objPhotoDetail.dessurroundin2 =
                                    value.toString();
                              });
                            },
                            maxLines: null,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                hintText: "Text",
                                border: InputBorder.none),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (surround3_lan3 != null) ...[
                                  Image.network(
                                    surround3_lan3!.path,
                                    width: 500,
                                    height: 300,
                                    fit: BoxFit.cover,
                                  )
                                ]
                              ],
                            ),
                            Positioned(
                              child: GestureDetector(
                                onTap: () async {
                                  surround3_lan3 =
                                      await pickImage('surround3_lan3');
                                  setState(() {
                                    surround3_lan3;
                                    objPhotoDetail.surroundin3 = surround3_lan3;
                                  });
                                },
                                child: Container(
                                  width: 500,
                                  height: 300,
                                  decoration:
                                      BoxDecoration(border: Border.all()),
                                  child: (surround3_lan3 == null)
                                      ? Image.network(
                                          "https://img.icons8.com/cotton/100/image--v2.png")
                                      : SizedBox(),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 500,
                          child: TextField(
                            controller: dessurround3_lan3,
                            onChanged: (value) {
                              setState(() {
                                objPhotoDetail.dessurroundin3 =
                                    value.toString();
                              });
                            },
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                hintText: "Text",
                                border: InputBorder.none),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (surround4_lan4 != null) ...[
                                  Image.network(
                                    surround4_lan4!.path,
                                    width: 500,
                                    height: 300,
                                    fit: BoxFit.cover,
                                  )
                                ]
                              ],
                            ),
                            Positioned(
                              child: GestureDetector(
                                onTap: () async {
                                  surround4_lan4 =
                                      await pickImage('surround4_lan4');
                                  setState(() {
                                    surround4_lan4;
                                    objPhotoDetail.surroundin4 = surround4_lan4;
                                  });
                                },
                                child: Container(
                                  width: 500,
                                  height: 300,
                                  decoration:
                                      BoxDecoration(border: Border.all()),
                                  child: (surround4_lan4 == null)
                                      ? Image.network(
                                          "https://img.icons8.com/cotton/100/image--v2.png")
                                      : SizedBox(),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 500,
                          child: TextField(
                            controller: dessurround4_lan4,
                            onChanged: (value) {
                              setState(() {
                                objPhotoDetail.dessurroundin4 =
                                    value.toString();
                              });
                            },
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                hintText: "Text",
                                border: InputBorder.none),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (surround5_lan5 != null) ...[
                                  Image.network(
                                    surround5_lan5!.path,
                                    width: 500,
                                    height: 300,
                                    fit: BoxFit.cover,
                                  )
                                ]
                              ],
                            ),
                            Positioned(
                              child: GestureDetector(
                                onTap: () async {
                                  surround5_lan5 =
                                      await pickImage('surround5_lan5');
                                  setState(() {
                                    surround5_lan5;
                                    objPhotoDetail.surroundin5 = surround5_lan5;
                                  });
                                },
                                child: Container(
                                  width: 500,
                                  height: 300,
                                  decoration:
                                      BoxDecoration(border: Border.all()),
                                  child: (surround5_lan5 == null)
                                      ? Image.network(
                                          "https://img.icons8.com/cotton/100/image--v2.png")
                                      : SizedBox(),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 500,
                          child: TextField(
                            controller: dessurround5_lan5,
                            onChanged: (value) {
                              setState(() {
                                objPhotoDetail.dessurroundin5 =
                                    value.toString();
                              });
                            },
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                hintText: "Text",
                                border: InputBorder.none),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (surround6_lan6 != null) ...[
                                  Image.network(
                                    surround6_lan6!.path,
                                    width: 500,
                                    height: 300,
                                    fit: BoxFit.cover,
                                  )
                                ]
                              ],
                            ),
                            Positioned(
                              child: GestureDetector(
                                onTap: () async {
                                  surround6_lan6 =
                                      await pickImage('surround6_lan6');
                                  setState(() {
                                    surround6_lan6;
                                    objPhotoDetail.surroundin6 = surround6_lan6;
                                  });
                                },
                                child: Container(
                                  width: 500,
                                  height: 300,
                                  decoration:
                                      BoxDecoration(border: Border.all()),
                                  child: (surround6_lan6 == null)
                                      ? Image.network(
                                          "https://img.icons8.com/cotton/100/image--v2.png")
                                      : SizedBox(),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 500,
                          child: TextField(
                            controller: dessurround6_lan6,
                            onChanged: (value) {
                              setState(() {
                                objPhotoDetail.dessurroundin6 =
                                    value.toString();
                              });
                            },
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                hintText: "Text",
                                border: InputBorder.none),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        widget.getForm(objPhotoDetail);
                      });

                      // Wrap widget.getForm call in a try-catch block
                    },
                    child: Center(
                      child: Text("Tesing get"),
                    ))
              ],
            )
          ]
        ]));
  }
}
