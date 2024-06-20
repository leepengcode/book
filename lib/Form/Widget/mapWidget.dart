import 'package:book/Componnents/style.dart';
import 'package:book/Componnents/uploadSketchMap.dart';
import 'package:book/Package/google_map_page.dart';
import 'package:flutter/material.dart';

class Mapwidget extends StatelessWidget {
  const Mapwidget({
    super.key,
  });

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
            child: Container(
              width: 1000,
              height: 500,
              child: GoogleMapPage(),
            ),
          ),
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
          Align(alignment: Alignment.center, child: SketMapImagePicker()),
          SizedBox(
            height: 20,
          ),
          Text(
            "Note",
            style: THeader(),
          ),
          Container(
            width: 1450,
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: "Enter Note",
                  border: InputBorder.none),
            ),
          )
        ]));
  }
}
