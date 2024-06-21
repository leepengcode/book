import 'package:book/Componnents/googlelocation.dart';
import 'package:book/Componnents/style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GoogleMapImage extends StatefulWidget {
  const GoogleMapImage({super.key});

  @override
  State<GoogleMapImage> createState() => _GoogleMapState();
}

class _GoogleMapState extends State<GoogleMapImage> {
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
          Center(child: GoogleImagePicker()),
        ]));
  }
}
