import 'package:book/Componnents/style.dart';
import 'package:book/Componnents/uploadLayer.dart';
import 'package:book/Componnents/uploadTD.dart';
import 'package:flutter/material.dart';

class uploadLayoutWidget extends StatelessWidget {
  const uploadLayoutWidget({
    super.key,
  });

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
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("Upload Image"),
                  TDImagePicker(),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Text("Upload Image"),
                  TDImagePicker(),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Land and Building Layout",
            style: THeader(),
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Upload Layout"),
                  LayerImagePicker(),
                ],
              ),
            ],
          ),
        ]));
  }
}
