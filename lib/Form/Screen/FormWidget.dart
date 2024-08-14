// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:book/Form/LeftSideBar.dart';
import 'package:book/Form/Screen/BookList.dart';
import 'package:book/Form/Widget/CoverWidget.dart';
import 'package:book/Form/Widget/FinalIndicationWidget.dart';
import 'package:book/Form/Widget/GoogleMap.dart';
import 'package:book/Form/Widget/InspatorWidget.dart';
import 'package:book/Form/Widget/NearbyProperty.dart';
import 'package:book/Form/Widget/PropertyInfo.dart';
import 'package:book/Form/Widget/ProvisionalValuationWidget.dart';
import 'package:book/Form/Widget/mapWidget.dart';
import 'package:book/Form/Widget/uploadIdCard.dart';
import 'package:book/Form/Widget/uploadLayoutWidget.dart';
import 'package:book/Model/ComparisonModel.dart';
import 'package:book/Model/CoverModel.dart';
import 'package:book/Model/FinalIndicationModel.dart';
import 'package:book/Model/FinalMapModel.dart';
import 'package:book/Model/GoogleMapModep.dart';
import 'package:book/Model/IDCardModel.dart';
import 'package:book/Model/LayoutModel.dart';
import 'package:book/Model/OfficerReportModel.dart';
import 'package:book/Model/PhotoDetailModel.dart';
import 'package:book/Model/PropertyInfoModel.dart';
import 'package:book/Model/ProvisionalModel.dart';
import 'package:book/util/util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http/http.dart' as http;
import 'dart:html' as html;
import '../Widget/PhotoDetail.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

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
  PropertyInfor? dataInfo;
  IDCard? dataIdcard;
  Layout? dataLayout;
  OfficerReport? dataOfficer;
  Gmap? dataGmap;
  FinalMap? datafinalmap;
  Comparison? dataComparison;
  List<File>? list_forviewproperty = [];
  List<File>? list_forinsideproperty = [];
  List<File> list_forviewland = [];
  PhotoDetail dataPhoto = PhotoDetail();

  Provisional dataProvisional = Provisional();
  FinalIndication dataFinalIndic = FinalIndication();
  var id_book;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              pinned: false,
              snap: true,
              floating: true,
              expandedHeight: 50.0,
              actions: [
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      dataPhoto;

                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyPDF(
                          objCover: dataCover,
                          objPropertyInfor: dataInfo,
                          objIdcard: dataIdcard,
                          objLayout: dataLayout,
                          objGmap: dataGmap,
                          objFinalIndication: dataFinalIndic,
                          objProvisional: dataProvisional,
                          objfinalmap: datafinalmap,
                          objOfficerReport: dataOfficer,
                          objPhotoDetail: dataPhoto,
                          list_forviewproperty: list_forviewproperty,
                          list_forinsideproperty: list_forinsideproperty,
                          list_forviewland: list_forviewland,
                        ),
                      ));
                    });
                  },
                  child: const Icon(
                    Icons.picture_as_pdf,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ]),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(
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
                            dataCover = value;
                            print("Cover : ${dataCover!.toJson()}");
                          } else {
                            print("Cover No data");
                          }
                        });
                      },
                    ),
                    Container(
                      height: 10,
                      color: Colors.black,
                    ),
                    PropertyInfo_Widget(
                      getForm: (value) {
                        setState(() {
                          dataInfo = value;
                          print("Property Info : ${dataInfo!.toJson()}");
                        });
                      },
                      ck1: ck1,
                    ),
                    Container(
                      height: 10,
                      color: Colors.black,
                    ),

                    uploadIDCard(
                      getForm: (value) {
                        if (value != null) {
                          setState(() {
                            dataIdcard = value;
                          });
                        }
                      },
                    ),
                    Container(
                      height: 10,
                      color: Colors.black,
                    ),
                    uploadLayoutWidget(
                      getForm: (value) {
                        dataLayout = value;
                      },
                      ck1: ck1,
                    ),
                    Container(
                      height: 10,
                      color: Colors.black,
                    ),
                    Mapwidget(
                      getForm: (value) {
                        print("Value : ${value}");
                        dataGmap = value;
                      },
                    ),
                    Container(
                      height: 10,
                      color: Colors.black,
                    ),

                    // if (ck1 != null)
                    PhotoDetailWidget(
                      getForm: (value) {
                        setState(() {
                          dataPhoto = value;
                          print("frontviewimage ${dataPhoto.frontviewimage}\n");
                        });
                      },
                      ck1: ck1,
                      get_viewproperty: (value) {
                        if (value != null) {
                          setState(() {
                            list_forviewproperty = value;
                            dataPhoto.viewimage = value;
                          });
                        }
                      },
                      get_insideproperty: (value) {
                        if (value != null) {
                          setState(() {
                            list_forinsideproperty = value;
                            dataPhoto.insideimage = value;
                          });
                        }
                      },
                      get_viewland: (value) {
                        if (value != null) {
                          setState(() {
                            list_forviewland = value;
                            dataPhoto.landimage = list_forviewland;
                          });
                        }
                      },
                    ),
                    Container(
                      height: 10,
                      color: Colors.black,
                    ),

                    NearbyPropertyWidget(
                      getForm: (value) {
                        dataOfficer = value;
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    GoogleMapImage(
                      getFile: (value) {
                        if (value != null) {
                          setState(() {
                            datafinalmap = value;
                          });
                        }
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ProvisionalValue(
                      getForm: (value) {
                        setState(() {
                          dataProvisional = value;
                        });
                      },
                      NoLandCount: 1,
                      ck1: ck1,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FinalIndicationWidget(
                      getForm: (value) {
                        setState(() {
                          dataFinalIndic = value;
                        });
                      },
                      ck1: ck1,
                      NoLandCount: 1,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () async {
                        // if (_await == true) {

                        await _valuableProgress(context);

                        await insertphotodetails(id_book);
                        await InsertPhoto(id_book);
                        // await insertphotodetails();

                        //   setState(() {
                        //     _await = false;
                        //   });
                        // }
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
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }

  var chars = "abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";

  String RandomString(int strlen) {
    Random rnd = Random(DateTime.now().millisecondsSinceEpoch);
    String result = "";
    for (var i = 0; i < strlen; i++) {
      result += chars[rnd.nextInt(chars.length)];
    }
    return result;
  }

  Future<void> _valuableProgress(BuildContext context) async {
    ProgressDialog pd = ProgressDialog(context: context);
    setState(() {
      id_book = '${RandomString(7)}${dataFinalIndic.issus_date}';
    });
    pd.show(
      max: 100,
      msg: 'File Downloading...',
      progressType: ProgressType.valuable,
    );

    for (int i = 0; i <= 100; i++) {
      pd.update(value: i);

      try {
        if (i == 2) {
          await Cover().InsertCover(dataCover!, id_book);
        } else if (i == 10) {
          await IDCard().InsertIdCard(dataIdcard!, id_book);
        } else if (i == 20) {
          await PropertyInfor().InsertInfo(dataInfo!, id_book);
        } else if (i == 30) {
          await Layout().InsertLayout(dataLayout!, id_book);
        } else if (i == 40) {
          await Gmap().insertGmap(dataGmap!, id_book);
        } else if (i == 70) {
          await OfficerReport().InsertOfficer(dataOfficer!, id_book);
        } else if (i == 80) {
          await FinalMap().InsertFinalMap(datafinalmap!, id_book);
        } else if (i == 90) {
          await Provisional().InsertProvisional(dataProvisional, id_book);
        } else if (i == 95) {
          await FinalIndication().InsertFinal(dataFinalIndic, id_book);
        }
      } catch (e) {
        print('Error at progress $i: $e');
      }

      await Future.delayed(Duration(milliseconds: 600));
    }

    pd.close();
  }

  bool _await = true;
  var ckeck_insert;
  late ProgressDialog pd;

  Future<Uint8List> getBlobData(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to load blob data');
    }
  }

  Future<String> convertToBase64(String path) async {
    var cvByte = await getBlobData(path);

    return base64Encode(cvByte);
  }

  Future<void> insertphotodetails(var id_book) async {
    var response2 = await http.post(
      Uri.parse(
          "https://virakst.online/bookReport/public/api/insertphotodetails/${id_book}"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'dessurroundin1': dataPhoto.dessurroundin1,
        'dessurroundin2': dataPhoto.dessurroundin2,
        'dessurroundin3': dataPhoto.dessurroundin3,
        'dessurroundin4': dataPhoto.dessurroundin4,
        'dessurroundin5': dataPhoto.dessurroundin5,
        'dessurroundin6': dataPhoto.dessurroundin6,
        'frontviewimage': await convertToBase64(dataPhoto.frontviewimage!.path),
        'surroundin1': await convertToBase64(dataPhoto.surroundin1!.path),
        'surroundin2': await convertToBase64(dataPhoto.surroundin2!.path),
        'surroundin3': await convertToBase64(dataPhoto.surroundin3!.path),
        'surroundin4': await convertToBase64(dataPhoto.surroundin4!.path),
        'surroundin5': await convertToBase64(dataPhoto.surroundin5!.path),
        'surroundin6': await convertToBase64(dataPhoto.surroundin6!.path),
        'roadviewimage1': await convertToBase64(dataPhoto.roadviewimage1!.path),
        'roadviewimage2': await convertToBase64(dataPhoto.roadviewimage2!.path)
      }),
    );
    if (response2.statusCode == 200 || response2.statusCode == 201) {
      print("Done in insertphotodetails");
    } else {
      print("Error in server ${response2.statusCode}, ${response2.body}");
    }
  }

  Future<void> InsertPhoto(var id_book) async {
    if (list_forviewland == []) {
      List<String> viewimage = [];
      List<String> insideimage = [];

      if (list_forinsideproperty != null &&
          list_forinsideproperty!.isNotEmpty) {
        for (var file in list_forinsideproperty!) {
          var base64Image = await convertToBase64(file.path);
          insideimage.add(base64Image);
        }
        print("insideimage is not null ${insideimage.length}");
      } else {
        print("insideimage is null or empty");
      }

      if (list_forviewproperty != null && list_forviewproperty!.isNotEmpty) {
        for (var file in list_forviewproperty!) {
          var base64Image = await convertToBase64(file.path);
          viewimage.add(base64Image);
        }
        print("viewimage is not null ${viewimage.length}");
      } else {
        print("viewimage is null or empty");
      }

      try {
        var response = await http.post(
          Uri.parse(
              "https://virakst.online/bookReport/public/api/insertphoto/${id_book}"),
          headers: {"Content-Type": "application/json"},
          body:
              jsonEncode({'insideimage': insideimage, 'viewimage': viewimage}),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          print("Done in InsertPhoto insideimage");
        } else {
          print("Error in server ${response.statusCode}, ${response.body}");
        }
      } catch (e) {
        if (e is SocketException) {
          print("Network error: $e");
        } else if (e is http.ClientException) {
          print("Client error: $e");
        } else {
          print("Unknown error: $e");
        }
      }
    } else {
      List<String> viewland = [];

      if (list_forviewland != null && list_forviewland.isNotEmpty) {
        for (var file in list_forviewland) {
          var base64Image = await convertToBase64(file.path);
          viewland.add(base64Image);
        }
        print("viewland is not null ${viewland.length}");
      } else {
        print("viewland is null or empty");
      }

      try {
        var response = await http.post(
          Uri.parse(
              "https://virakst.online/bookReport/public/api/insertphoto/${id_book}"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({'landimage': viewland}),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          print("Done in InsertPhoto landimage");
        } else {
          print("Error in server ${response.statusCode}, ${response.body}");
        }
      } catch (e) {
        print("Error catch in main $e");
      }
    }
  }
}
