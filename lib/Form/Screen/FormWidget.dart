import 'package:book/Form/Widget/CoverWidget.dart';
import 'package:book/Form/Widget/FinalIndicationWidget.dart';
import 'package:book/Form/Widget/GoogleMap.dart';
import 'package:book/Form/Widget/NearbyProperty.dart';
import 'package:book/Form/Widget/PhotoDetail.dart';
import 'package:book/Form/Widget/PropertyInfo.dart';
import 'package:book/Form/Widget/ProvisionalValuationWidget.dart';
import 'package:book/Form/Widget/uploadIdCard.dart';
import 'package:book/Form/Widget/uploadLayoutWidget.dart';
import 'package:book/Model/CoverModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FormWidget extends StatefulWidget {
  const FormWidget({
    super.key,
  });

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  var ck1;
  Cover? dataCover;
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
                });
              },
              getForm: (value) {
                setState(() {
                  if (value != null) {
                    print("object ${value.info}");
                    dataCover = value;
                  }
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
              onTap: () async {
                print("Save");
                await InsertCover(dataCover!);
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

  Future InsertCover(Cover objCover) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://192.168.1.31:8000/api/insertcover'));
    request.fields.addAll(objCover.toJson().map(
        (key, value) => MapEntry(key, value != null ? value.toString() : '')));
    request.files
        .add(await http.MultipartFile.fromPath('image', objCover.image.path));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
