import 'package:book/Componnents/multiImage.dart';
import 'package:book/Componnents/style.dart';
import 'package:book/Componnents/uploadFrontImg.dart';
import 'package:flutter/material.dart';

class PhotoDetailWidget extends StatefulWidget {
  final String? ck1;
  const PhotoDetailWidget({
    super.key,
    this.ck1,
  });

  @override
  State<PhotoDetailWidget> createState() => _PhotoDetailWidgetState();
}

class _PhotoDetailWidgetState extends State<PhotoDetailWidget> {
  @override
  Widget build(BuildContext context) {
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
                Align(alignment: Alignment.center, child: FrontImgPicker()),
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
                      "1. Photos view of the Flat ",
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
                    width: 1000,
                    height: 500,
                    child: MultiPropertyImgPicker(),
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FrontImgPicker(),
                    SizedBox(
                      width: 25,
                    ),
                    FrontImgPicker(),
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
                        FrontImgPicker(),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 500,
                          child: TextField(
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
                        FrontImgPicker(),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 500,
                          child: TextField(
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
                        FrontImgPicker(),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 500,
                          child: TextField(
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
                        FrontImgPicker(),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 500,
                          child: TextField(
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
                        FrontImgPicker(),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 500,
                          child: TextField(
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
                        FrontImgPicker(),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 500,
                          child: TextField(
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
                Align(alignment: Alignment.center, child: FrontImgPicker()),
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
                    width: 1000,
                    height: 500,
                    child: MultiPropertyImgPicker(),
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FrontImgPicker(),
                    SizedBox(
                      width: 25,
                    ),
                    FrontImgPicker(),
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
                        FrontImgPicker(),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 500,
                          child: TextField(
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
                        FrontImgPicker(),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 500,
                          child: TextField(
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
                        FrontImgPicker(),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 500,
                          child: TextField(
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
                        FrontImgPicker(),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 500,
                          child: TextField(
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
                        FrontImgPicker(),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 500,
                          child: TextField(
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
                        FrontImgPicker(),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 500,
                          child: TextField(
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
                )
              ],
            )
          ]
        ]));
  }
}
