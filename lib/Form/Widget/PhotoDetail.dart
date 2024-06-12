import 'package:book/Componnents/multiImage.dart';
import 'package:book/Componnents/style.dart';
import 'package:book/Componnents/uploadFrontImg.dart';
import 'package:flutter/material.dart';

class PhotoDetailWidget extends StatelessWidget {
  const PhotoDetailWidget({
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
          Text(
            "Details of Photos taken at the Site Inspection",
            style: THeader(),
          ),
          Text(
            "I. Photo front view of the property",
            style: THeader(),
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
          Text(
            "1. Photos view of the Flat ",
            style: THeader(),
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
          Text(
            "III. Photos Access Road view to the Subject Land",
            style: THeader(),
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
          Text(
            "IV. Photos surrounding view of the property",
            style: THeader(),
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
        ]));
  }
}
