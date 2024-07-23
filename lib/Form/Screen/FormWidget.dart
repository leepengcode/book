// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

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
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:html' as html;
import '../Widget/PhotoDetail.dart';

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
  List<File>? list_forviewland;
  PhotoDetail dataPhoto = PhotoDetail();

  Provisional dataProvisional = Provisional();
  FinalIndication dataFinalIndic = FinalIndication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: 20),
      //       child: GestureDetector(
      //         onTap: () async {
      //           Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyPDF(),));
      //           // await Printing.layoutPdf(
      //           //     onLayout: (format) => generatePdf(format, 'ko' ));
      //           //             Navigator.pushNamed(context, '/pdf',arguments: <String, String>{
      //           //   'name': 'Berlin'
      //           // },);
      //         },
      //         child: const Icon(
      //           Icons.picture_as_pdf,
      //           color: Colors.black,
      //           size: 25,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
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
                          // objPropertyInfor: dataInfo,
                          // objIdcard: dataIdcard,
                          // objLayout: dataLayout,
                          // objGmap: dataGmap,
                          // objFinalIndication: dataFinalIndic,
                          objProvisional: dataProvisional,
                          // objfinalmap: datafinalmap,
                          // objOfficerReport: dataOfficer,
                          // objPhotoDetail: dataPhoto,
                          // list_forviewproperty: list_forviewproperty,
                          // list_forinsideproperty: list_forinsideproperty,
                          // list_forviewland: list_forviewland,
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
                          }
                        });
                      },
                    ),
                    Container(
                      height: 10,
                      color: Colors.black,
                    ),
                    // PropertyInfo_Widget(
                    //   getForm: (value) {
                    //     setState(() {
                    //       dataInfo = value;
                    //     });
                    //   },
                    //   ck1: ck1,
                    // ),
                    // Container(
                    //   height: 10,
                    //   color: Colors.black,
                    // ),

                    // uploadIDCard(
                    //   getForm: (value) {
                    //     if (value != null) {
                    //       setState(() {
                    //         dataIdcard = value;
                    //       });
                    //     }
                    //   },
                    // ),
                    // Container(
                    //   height: 10,
                    //   color: Colors.black,
                    // ),
                    // uploadLayoutWidget(
                    //   getForm: (value) {
                    //     dataLayout = value;
                    //   },
                    //   ck1: ck1,
                    // ),
                    // Container(
                    //   height: 10,
                    //   color: Colors.black,
                    // ),
                    // Mapwidget(
                    //   getForm: (value) {
                    //     if (value != null) {
                    //       print("Value : ${value}");
                    //       dataGmap = value;
                    //     }
                    //   },
                    // ),
                    // Container(
                    //   height: 10,
                    //   color: Colors.black,
                    // ),

                    // if (ck1 != null)
                    //   PhotoDetailWidget(
                    //     getForm: (value) {
                    //       setState(() {
                    //         dataPhoto = value;
                    //         print(
                    //             "frontviewimage ${dataPhoto.frontviewimage}\n");
                    //       });
                    //     },
                    //     ck1: ck1,
                    //     get_viewproperty: (value) {
                    //       if (value != null) {
                    //         setState(() {
                    //           list_forviewproperty = value;
                    //           dataPhoto.viewimage = value;
                    //           print(
                    //               "In main dataPhoto.viewimage ${dataPhoto.viewimage!.length}\n\n");
                    //         });
                    //       }
                    //     },
                    //     get_insideproperty: (value) {
                    //       if (value != null) {
                    //         setState(() {
                    //           list_forinsideproperty = value;
                    //           dataPhoto.insideimage = value;
                    //           print(
                    //               "In main dataPhoto.insideimage ${dataPhoto.insideimage!.length}\n\n");
                    //         });
                    //       }
                    //     },
                    //     get_viewland: (value) {
                    //       if (value != null) {
                    //         setState(() {
                    //           print("In main get_viewland\n\n");
                    //           list_forviewland = value;
                    //           dataPhoto.landimage = list_forviewland;
                    //         });
                    //       }
                    //     },
                    //   ),
                    // Container(
                    //   height: 10,
                    //   color: Colors.black,
                    // ),

                    // NearbyPropertyWidget(
                    //   getForm: (value) {
                    //     dataOfficer = value;
                    //   },
                    // ),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // GoogleMapImage(
                    //   getFile: (value) {
                    //     if (value != null) {
                    //       setState(() {
                    //         print("test2\n ${value!.Finalmap!.path}\n");
                    //         datafinalmap = value;
                    //       });
                    //     }
                    //   },
                    // ),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    ProvisionalValue(
                      getForm: (value) {
                        setState(() {
                          if (value != null) {
                            dataProvisional = value;
                          }
                        });
                      },
                      NoLandCount: 1,
                      ck1: ck1,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // FinalIndicationWidget(
                    //   getForm: (value) {
                    //     setState(() {
                    //       if (value != null) {
                    //         dataFinalIndic = value;
                    //       }
                    //     });
                    //   },
                    //   ck1: ck1,
                    //   NoLandCount: 1,
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    GestureDetector(
                      onTap: () async {
                        // await FinalMap().InsertFinalMap(datafinalmap!);

                        // await FinalIndication()
                        //   ..InsertFinal(dataFinalIndic);
                        await Provisional()
                          ..InsertProvisional(dataProvisional);

                        // await OfficerReport()
                        //   ..InsertOfficer(dataOfficer!);

                        // await Gmap().insertGmap(dataGmap!);

                        // await InsertPhoto();

                        // await Layout().InsertLayout(dataLayout!);
                        // await IDCard().InsertIdCard(dataIdcard!);

                        // await PropertyInfor()
                        //   ..InsertInfo(dataInfo!);

                        await Cover().InsertCover(dataCover!);
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
      // body: SingleChildScrollView(
      //   child: Center(
      //     child: Column(
      //       children: [

      //         CoverWidget(
      //           onChanged: (value) {
      //             setState(() {
      //               ck1 = value.toString();
      //             });
      //           },
      //           getForm: (value) {
      //             setState(() {
      //               if (value != null) {
      //                 print("object ${value.info}");
      //                 dataCover = value;
      //               }
      //             });
      //           },
      //         ),
      //         const SizedBox(
      //           height: 25,
      //         ),
      //         PropertyInfo_Widget(
      //           getForm: (value) {
      //             setState(() {
      //               dataInfo = value;
      //             });
      //           },
      //           ck1: ck1,
      //         ),
      //         const SizedBox(
      //           height: 25,
      //         ),
      //         uploadIDCard(
      //           getForm: (value) {
      //             if (value != null) {
      //               dataIdcard = value;
      //             }
      //           },
      //         ),
      //         const SizedBox(
      //           height: 25,
      //         ),
      //         uploadLayoutWidget(
      //           getForm: (value) {
      //             dataLayout = value;
      //           },
      //           ck1: ck1,
      //         ),
      //         const SizedBox(
      //           height: 25,
      //         ),
      //         Mapwidget(
      //           getForm: (value) {
      //             if (value != null) {
      //               print("Value : ${value}");
      //               dataGmap = value;
      //             }
      //           },
      //         ),
      //         const SizedBox(
      //           height: 25,
      //         ),
      //         if (ck1 != null)
      //           PhotoDetailWidget(
      //             getForm: (value) {
      //               setState(() {
      //                 dataPhoto = value;
      //               });
      //             },
      //             ck1: ck1,
      //             get_viewproperty: (value) {
      //               if (value != null) {
      //                 setState(() {
      //                   list_forviewproperty = value;
      //                 });
      //               }
      //             },
      //             get_insideproperty: (value) {
      //               if (value != null) {
      //                 setState(() {
      //                   list_forinsideproperty = value;
      //                 });
      //               }
      //             },
      //             get_viewland: (value) {
      //               if (value != null) {
      //                 setState(() {
      //                   print("In main get_viewland\n\n");
      //                   list_forviewland = value;
      //                 });
      //               }
      //             },
      //           ),
      //         const SizedBox(
      //           height: 25,
      //         ),
      //         NearbyPropertyWidget(
      //           getForm: (value) {
      //             dataOfficer = value;
      //           },
      //         ),
      //         SizedBox(
      //           height: 25,
      //         ),
      //         GoogleMapImage(
      //           getFile: (value) {
      //            setState(() {
      //               datafinalmap = value;
      //            });
      //           },
      //         ),
      //         SizedBox(
      //           height: 25,
      //         ),
      //         ProvisionalValue(
      //           getForm: (value) {
      //             setState(() {
      //               if (value != null) {
      //                 dataProvisional = value;
      //               }
      //             });
      //           },
      //           NoLandCount: 1,
      //           ck1: ck1,
      //         ),
      //         SizedBox(
      //           height: 30,
      //         ),
      //         FinalIndicationWidget(
      //           getForm: (value) {
      //             setState(() {
      //               if (value != null) {
      //                 dataFinalIndic = value;
      //               }
      //             });
      //           },
      //           ck1: ck1,
      //           NoLandCount: 1,
      //         ),
      //         SizedBox(
      //           height: 20,
      //         ),
      //         GestureDetector(
      //           onTap: () async {

      //             // await FinalMap().. InsertFinalMap(datafinalmap!);

      //             // await FinalIndication()
      //             //   ..InsertFinal(dataFinalIndic);
      //             // await Provisional()
      //             //   ..InsertProvisional(dataProvisional);

      //             // await OfficerReport()
      //             //   ..InsertOfficer(dataOfficer!);

      //             // await Gmap()
      //             //   ..insertGmap(dataGmap!);

      //             // await InsertPhoto();

      //             // await Layout()
      //             //   ..InsertLayout(dataLayout!);
      //             // await IDCard()
      //             //   ..InsertIdCard(dataIdcard!);

      //             // await PropertyInfor()
      //             //   ..InsertInfo(dataInfo!);

      //             // await Cover()
      //             //   ..InsertCover(dataCover!);
      //           },
      //           child: Center(
      //               child: Container(
      //             width: 150,
      //             height: 30,
      //             decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(20),
      //                 color: Colors.blue),
      //             child: Center(
      //                 child: Text(
      //               "Save",
      //               style: TextStyle(color: Colors.white, fontSize: 20),
      //             )),
      //           )),
      //         ),
      //         SizedBox(
      //           height: 20,
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  Future<Uint8List> getBlobData(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to load blob data');
    }
  }

  Future<void> InsertPhoto() async {
    if (list_forviewland == null) {
      List<String> viewimage = [];
      List<String> insideimage = [];
      Future<String> convertToBase64(String path) async {
        var cvByte = await getBlobData(path);
        return base64Encode(cvByte);
      }

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
          Uri.parse("http://192.168.1.31:8000/api/insertphoto"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            'dessurroundin1': dataPhoto.dessurroundin1,
            'dessurroundin2': dataPhoto.dessurroundin2,
            'dessurroundin3': dataPhoto.dessurroundin3,
            'dessurroundin4': dataPhoto.dessurroundin4,
            'dessurroundin5': dataPhoto.dessurroundin5,
            'dessurroundin6': dataPhoto.dessurroundin6,
            'frontviewimage':
                await convertToBase64(dataPhoto.frontviewimage!.path),
            'surroundin1': await convertToBase64(dataPhoto.surroundin1!.path),
            'surroundin2': await convertToBase64(dataPhoto.surroundin2!.path),
            'surroundin3': await convertToBase64(dataPhoto.surroundin3!.path),
            'surroundin4': await convertToBase64(dataPhoto.surroundin4!.path),
            'surroundin5': await convertToBase64(dataPhoto.surroundin5!.path),
            'surroundin6': await convertToBase64(dataPhoto.surroundin6!.path),
            'roadviewimage1':
                await convertToBase64(dataPhoto.roadviewimage1!.path),
            'roadviewimage2':
                await convertToBase64(dataPhoto.roadviewimage2!.path),
            'insideimage': insideimage,
            'viewimage': viewimage
          }),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          print(response.body);
        } else {
          print("Error in server ${response.statusCode}, ${response.body}");
        }
      } catch (e) {
        print("Error catch in main $e");
      }
    } else {
      List<String> viewland = [];
      Future<String> convertToBase64(String path) async {
        var cvByte = await getBlobData(path);
        return base64Encode(cvByte);
      }

      if (list_forviewland != null && list_forviewland!.isNotEmpty) {
        for (var file in list_forviewland!) {
          var base64Image = await convertToBase64(file.path);
          viewland.add(base64Image);
        }
        print("viewland is not null ${viewland.length}");
      } else {
        print("viewland is null or empty");
      }

      try {
        var response = await http.post(
          Uri.parse("http://192.168.1.31:8000/api/insertphoto"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            'dessurroundin1': dataPhoto.dessurroundin1,
            'dessurroundin2': dataPhoto.dessurroundin2,
            'dessurroundin3': dataPhoto.dessurroundin3,
            'dessurroundin4': dataPhoto.dessurroundin4,
            'dessurroundin5': dataPhoto.dessurroundin5,
            'dessurroundin6': dataPhoto.dessurroundin6,
            'frontviewimage':
                await convertToBase64(dataPhoto.frontviewimage!.path),
            'surroundin1': await convertToBase64(dataPhoto.surroundin1!.path),
            'surroundin2': await convertToBase64(dataPhoto.surroundin2!.path),
            'surroundin3': await convertToBase64(dataPhoto.surroundin3!.path),
            'surroundin4': await convertToBase64(dataPhoto.surroundin4!.path),
            'surroundin5': await convertToBase64(dataPhoto.surroundin5!.path),
            'surroundin6': await convertToBase64(dataPhoto.surroundin6!.path),
            'roadviewimage1':
                await convertToBase64(dataPhoto.roadviewimage1!.path),
            'roadviewimage2':
                await convertToBase64(dataPhoto.roadviewimage2!.path),
            'landimage': viewland,
          }),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          print(response.body);
        } else {
          print("Error in server ${response.statusCode}, ${response.body}");
        }
      } catch (e) {
        print("Error catch in main $e");
      }
    }
  }
}
