import 'dart:io';

import 'package:book/Componnents/style.dart';
import 'package:book/Componnents/uploadLayout.dart';
import 'package:book/Componnents/uploadTD.dart';
import 'package:book/Model/LayoutModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
    return Container(
        decoration: BoxDecoration(
            color: Colors.blueGrey.shade100,
            borderRadius: BorderRadius.circular(10)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Copy land title deep No : ",
            style: THeader(),
          ),
          const SizedBox(
            height: 10,
          ),
          StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 9, //អ័ក្សX
            crossAxisSpacing: 9,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    overflow: TextOverflow.ellipsis,
                    TextSpan(children: [
                      TextSpan(
                        text: "Upload Image",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      TextSpan(
                        text: " *",
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      )
                    ]),
                  ),
                  TDImagePicker(
                    getFile: (value) {
                      if (io.length == 0) {
                        setState(() {
                          if (value != null) {
                            print("Upload DT 1 ${value.toString()}\n");

                            io.add(value);
                            objLayoutd.deepimage1 = value;
                          }
                        });
                      }
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  Text.rich(
                    overflow: TextOverflow.ellipsis,
                    TextSpan(children: [
                      TextSpan(
                        text: "Upload Image",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      TextSpan(
                        text: " *",
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      )
                    ]),
                  ),
                  TDImagePicker(
                    getFile: (value) {
                      if (io.length == 1) {
                        setState(() {
                          if (value != null) {
                            print("Upload DT 2 ${value.toString()}\n");

                            io.add(value);
                            objLayoutd.deepimage2 = value;
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
                  Text.rich(
                    overflow: TextOverflow.ellipsis,
                    TextSpan(children: [
                      TextSpan(
                        text: "Upload Image",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      TextSpan(
                        text: " *",
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      )
                    ]),
                  ),
                  LayerImagePicker(
                    getFile: (value) {
                      setState(() {
                        if (value != null) {
                          if (io.length == 3)
                            print("Upload Layout ${value.toString()}\n");
                          io.add(value);
                          objLayoutd.layoutimage = value;
                          widget.getForm!(objLayoutd);
                        }
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ]));
  }
}
