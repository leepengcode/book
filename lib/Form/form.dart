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

class FormScreen extends StatefulWidget {
  FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("FILL THE FORM"),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/pdf');
              },
              child: const Icon(
                Icons.picture_as_pdf,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
