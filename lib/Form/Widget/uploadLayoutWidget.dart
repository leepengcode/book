import 'dart:io';

import 'package:book/Componnents/style.dart';
import 'package:book/Componnents/uploadLayout.dart';
import 'package:book/Componnents/uploadTD.dart';
import 'package:book/Model/LayoutModel.dart';
import 'package:flutter/material.dart';

class uploadLayoutWidget extends StatefulWidget {
  final ValueChanged<Layout?>? getForm;
  final String? ck1;
  const uploadLayoutWidget({
    super.key,
    this.ck1,
    this.getForm,
  });

  @override
  State<uploadLayoutWidget> createState() => _uploadLayoutWidgetState();
}

class _uploadLayoutWidgetState extends State<uploadLayoutWidget> {
  List<File> io = [];
  Layout objLayoutd = Layout();
  bool ck = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onFocusChange: (value) {
        if (value == false) {
          setState(() {
            if (io.length == 3 && ck == false) {
              objLayoutd.deepimage1 = io[0];
              objLayoutd.deepimage2 = io[1];
              objLayoutd.layoutimage = io[2];
              print("kkokokoko ${io.length}\n\n\n");
              widget.getForm!(objLayoutd);
              ck = true;
            }
          });
        }
      },
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 22, horizontal: 22),
          width: 1500,
          decoration: BoxDecoration(
              color: Colors.blueGrey.shade100,
              borderRadius: BorderRadius.circular(10)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Copy land title deep No : ភព 67733",
              style: THeader(),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Upload Image",
                          style: THeader(),
                        ),
                        Text(
                          " *",
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        )
                      ],
                    ),
                    TDImagePicker(
                      getFile: (value) {
                        if (io.length == 0) {
                          setState(() {
                            if (value != null) {
                              print("Upload DT 1 ${value.toString()}\n");

                              io.add(value);
                            }
                          });
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Upload Image",
                          style: THeader(),
                        ),
                        Text(
                          " *",
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        )
                      ],
                    ),
                    TDImagePicker(
                      getFile: (value) {
                        if (io.length == 1) {
                          setState(() {
                            if (value != null) {
                              print("Upload DT 2 ${value.toString()}\n");

                              io.add(value);
                            }
                          });
                        }
                      },
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            if (widget.ck1 != "Property LAND VALUATION REPORT") ...[
              Text(
                "Land and Building Layout",
                style: THeader(),
              ),
            ] else ...[
              Text(
                "Land Layout",
                style: THeader(),
              ),
            ],
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Upload Image",
                          style: THeader(),
                        ),
                        Text(
                          " *",
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        )
                      ],
                    ),
                    LayerImagePicker(
                      getFile: (value) {
                        setState(() {
                          if (value != null) {
                            if (io.length == 3)
                              print("Upload Layout ${value.toString()}\n");
                            io.add(value);
                          }
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ])),
    );
  }
}
