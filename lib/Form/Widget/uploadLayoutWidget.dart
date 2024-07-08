import 'package:book/Componnents/style.dart';
import 'package:book/Componnents/uploadLayer.dart';
import 'package:book/Componnents/uploadTD.dart';
import 'package:flutter/material.dart';

class uploadLayoutWidget extends StatefulWidget {
  final String? ck1;
  const uploadLayoutWidget({
    super.key,
    this.ck1,
  });

  @override
  State<uploadLayoutWidget> createState() => _uploadLayoutWidgetState();
}

class _uploadLayoutWidgetState extends State<uploadLayoutWidget> {
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
                  TDImagePicker(),
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
                  TDImagePicker(),
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
                  LayerImagePicker(),
                ],
              ),
            ],
          ),
        ]));
  }
}
