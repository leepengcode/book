import 'package:book/Form/Widget/CoverWidget.dart';
import 'package:book/Form/Widget/FinalIndicationWidget.dart';
import 'package:book/Form/Widget/NearbyProperty.dart';
import 'package:book/Form/Widget/PhotoDetail.dart';
import 'package:book/Form/Widget/PropertyInfo.dart';
import 'package:book/Form/Widget/ProvisionalValuationWidget.dart';
import 'package:book/Form/Widget/mapWidget.dart';
import 'package:book/Form/Widget/uploadIdCard.dart';
import 'package:book/Form/Widget/uploadLayoutWidget.dart';
import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            CoverWidget(),
            const SizedBox(
              height: 25,
            ),
            const PropertyInfo_Widget(),
            const SizedBox(
              height: 25,
            ),
            const uploadIDCard(),
            const SizedBox(
              height: 25,
            ),
            const uploadLayoutWidget(),
            const SizedBox(
              height: 25,
            ),
            const Mapwidget(),
            const SizedBox(
              height: 25,
            ),
            const PhotoDetailWidget(),
            const SizedBox(
              height: 25,
            ),
            NearbyPropertyWidget(),
            SizedBox(
              height: 25,
            ),
            ProvisionalValue(
              NoLandCount: 1,
            ),
            SizedBox(
              height: 30,
            ),
            FinalIndicationWidget(
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
