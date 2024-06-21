import 'package:book/Form/Widget/CoverWidget.dart';
import 'package:book/Form/Widget/FinalIndicationWidget.dart';
import 'package:book/Form/Widget/GoogleMap.dart';
import 'package:book/Form/Widget/NearbyProperty.dart';
import 'package:book/Form/Widget/PhotoDetail.dart';
import 'package:book/Form/Widget/PropertyInfo.dart';
import 'package:book/Form/Widget/ProvisionalValuationWidget.dart';
import 'package:book/Form/Widget/mapWidget.dart';
import 'package:book/Form/Widget/uploadIdCard.dart';
import 'package:book/Form/Widget/uploadLayoutWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({
    super.key,
  });

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  var ck1;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            CoverWidget(
              onChanged: (value) {
                setState(() {
                  ck1 = value.toString();
                  print("ch1 = ${ck1}\n");
                });
              },
            ),
            const SizedBox(
              height: 25,
            ),
            PropertyInfo_Widget(
              ck1: ck1,
            ),
            const SizedBox(
              height: 25,
            ),
            const uploadIDCard(),
            const SizedBox(
              height: 25,
            ),
            uploadLayoutWidget(
              ck1: ck1,
            ),
            const SizedBox(
              height: 25,
            ),
            // const Mapwidget(),
            const SizedBox(
              height: 25,
            ),
            PhotoDetailWidget(
              ck1: ck1,
            ),
            const SizedBox(
              height: 25,
            ),
            NearbyPropertyWidget(),
            SizedBox(
              height: 25,
            ),
            GoogleMapImage(),
            SizedBox(
              height: 25,
            ),
            ProvisionalValue(
              NoLandCount: 1,
              ck1: ck1,
            ),
            SizedBox(
              height: 30,
            ),
            FinalIndicationWidget(
              ck1: ck1,
              NoLandCount: 1,
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                print("Save");
              },
              child: Center(
                  child: Container(
                width: 150,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue),
                child: Center(
                    child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              )),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
