import 'dart:convert';
import 'dart:js_interop';

import 'package:book/Model/ComparisonModel.dart';
import 'package:book/Model/CoverModel.dart';
import 'package:book/Model/FinalIndicationBuildingMdel.dart';
import 'package:book/Model/FinalIndicationModel.dart';
import 'package:book/Model/FinalMapModel.dart';
import 'package:book/Model/GoogleMapModep.dart';
import 'package:book/Model/IDCardModel.dart';
import 'package:book/Model/LayoutModel.dart';
import 'package:book/Model/OfficerReportModel.dart';
import 'package:book/Model/PhotoDetailModel.dart';
import 'package:book/Model/PropertyInfoModel.dart';
import 'package:book/Model/ProvisionalModel.dart';
import 'package:book/util/util_pdf_after_get.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

import '../../Model/FinalIndicationLandMdel.dart';
import '../../Model/ProvisionalBuildingMdel.dart';
import '../../Model/ProvisionalLandMdel.dart';

class BookListScreen extends StatefulWidget {
  const BookListScreen({super.key, this.id_book_report});
  final String? id_book_report;
  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  final String apiUrl = 'https://virakst.online/bookReport/public/api';
  int currentPage = 1;
  bool isLoading = false;
  bool hasMore = true;
  List books = [];

  @override
  void initState() {
    super.initState();
    // fetchBooks();'
    if (widget.id_book_report != null) {
      fetchBooks_by_id('${widget.id_book_report}');
      print("fetchBooks_by_id('${widget.id_book_report}');\n");
    } else {
      fetchBooks();
    }
  }

  Future<void> fetchBooks() async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });

    final response =
        await http.get(Uri.parse('$apiUrl/getbook?page=$currentPage'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        currentPage++;
        isLoading = false;
        hasMore = data['next_page_url'] != null;
        books.addAll(data['data']);
      });
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load books');
    }
  }

  Cover? dataCover;
  PropertyInfor? dataInfo;
  IDCard? dataIdcard;
  Layout? dataLayout;
  OfficerReport? dataOfficer;
  Gmap? dataGmap;
  FinalMap? datafinalmap;
  Comparison? dataComparison;
  List<Uint8List>? list_forviewproperty = [];
  List<Uint8List>? list_forinsideproperty = [];
  List<Uint8List>? list_forviewland;
  PhotoDetail dataPhoto = PhotoDetail();
  List<Comparison> comparisons = [];
  Provisional dataProvisional = Provisional();
  FinalIndication dataFinalIndic = FinalIndication();
  List<Uint8List> viewimage = [];
  List<Uint8List> insideimage = [];
  List<Uint8List> landimage = [];
  Future<void> _valuableProgress(BuildContext context, var data) async {
    ProgressDialog pd = ProgressDialog(context: context);

    pd.show(
      max: 100,
      msg: 'File Downloading...',
      progressType: ProgressType.valuable,
    );

    for (int i = 0; i <= 100; i++) {
      pd.update(value: i);

      await Future.delayed(Duration(milliseconds: 100));
    }

    pd.close();
  }

  List<PLand> land = [];
  List<PBuilding> building = [];
  Future<void> fetchBooks_by_id(var id_book) async {
    print("id_book ${id_book}\n");
    final response = await http.get(Uri.parse('$apiUrl/getbook/${id_book}'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      try {
        dataCover = Cover.fromJson(data['tbcover']);
        dataInfo = PropertyInfor.fromJson(data['propertyinfo'][0]);
        dataIdcard = IDCard.fromJson(data['tbidcard'][0]);
        dataLayout = Layout.fromJson(data['tblayout'][0]);
        dataGmap = Gmap.fromJson(data['tbmap'][0]);
        dataFinalIndic = FinalIndication.fromJson(data['tbfinalindication'][0]);
        print("dataFinalIndic: ${data['tbfinalindication'][0]}");
        if (data['tbfinalbuilding'] != []) {
          for (var item in data['tbfinalbuilding']) {
            dataFinalIndic.building!
                .add(Building.fromJson(item as Map<String, dynamic>));
          }
        }

        for (var item in data['tbfinalland']) {
          dataFinalIndic.land!.add(Land.fromJson(item as Map<String, dynamic>));
        }

        dataProvisional = Provisional.fromJson(data['provisional'][0]);
        if (data['tbland'] is List) {
          for (var item in data['tbland']) {
            land.add(PLand.fromJson(item));
            print("object koko${land[0].totalmax}");
          }
        }
        dataProvisional.land = land;

        if (data['tbbuilding'] is List) {
          for (var item in data['tbbuilding']) {
            building.add(PBuilding.fromJson(item));
            print("object2 koko${building[0].totalmax}");
          }
        }
        dataProvisional.building = building;

        datafinalmap = FinalMap.fromJson(data['tbfinalmap'][0]);
        dataOfficer = OfficerReport.fromJson(data['tbofficer_reports'][0]);
        if (data['comparisons'] is List) {
          for (var item in data['comparisons']) {
            if (item is Map<String, dynamic>) {
              comparisons.add(Comparison.fromJson(item));
            }
          }
        }
        dataOfficer!.comparison = comparisons;

        dataPhoto = PhotoDetail.fromJson(data['photodetails'][0]);
        for (var item in data['tbinsideimagedetail']) {
          insideimage.add(base64Decode(item['insideimage']));
        }
        // dataPhoto.insideimage = insideimage;
        if (data['tblandviewdetail'] is List) {
          for (var item in data['tblandviewdetail']) {
            landimage.add(base64Decode(item['landimage']));
          }
        }
        // dataPhoto.landimage = landimage;
        if (data['tbviewimagedetail'] is List) {
          for (var item in data['tbviewimagedetail']) {
            viewimage.add(base64Decode(item['viewimage']));
          }
        }
        // dataPhoto.viewimage = viewimage;

        list_forviewproperty = viewimage;
        list_forinsideproperty = insideimage;
        list_forviewland = landimage;
      } catch (e) {
        print("object ${e.toExternalReference}\n");
      }
      // await _valuableProgress(context, data);
      try {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MyPDF_api(
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
            set_objCover_image: base64Decode(data['tbcover']['image']),
            set_fidcard1: base64Decode(data['tbidcard'][0]['frontidcard1']),
            set_bidcard1: base64Decode(data['tbidcard'][0]['backidcard1']),
            set_map1Image: base64Decode(data['tbmap'][0]['pmapimage']),
            set_map2Image: base64Decode(data['tbmap'][0]['apmapimage']),
            set_map3Image: base64Decode(data['tbmap'][0]['skmapimage']),
            frontviewimage:
                base64Decode(data['photodetails'][0]['frontviewimage']),
            roadviewimage1:
                base64Decode(data['photodetails'][0]['roadviewimage1']),
            roadviewimage2:
                base64Decode(data['photodetails'][0]['roadviewimage2']),
            surroundin1: base64Decode(data['photodetails'][0]['surroundin1']),
            surroundin2: base64Decode(data['photodetails'][0]['surroundin2']),
            surroundin3: base64Decode(data['photodetails'][0]['surroundin3']),
            surroundin4: base64Decode(data['photodetails'][0]['surroundin4']),
            surroundin5: base64Decode(data['photodetails'][0]['surroundin5']),
            surroundin6: base64Decode(data['photodetails'][0]['surroundin6']),
            pImage: base64Decode(data['tbfinalmap'][0]['finalmap']),
          ),
        ));
      } catch (e) {
        print("Error in book_list\n");
      }
    } else {
      throw Exception('Failed to load books');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Paginated List'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              if (books != null) ...[
                for (int i = books.length-1; i >=0 ; i--)
                  InkWell(
                    onTap: () async {
                      await fetchBooks_by_id(books[i]['id_book']);
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            // The image on the left side
                            SizedBox(
                              height: 200,
                              child: Image.memory(
                                base64Decode(books[i]['image']),
                                fit: BoxFit.cover, // Adjust image fit if needed
                              ),
                            ),
                            SizedBox(
                                width:
                                    10), // Add some spacing between the image and the text
                            // Text column for title and subtitle
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment
                                    .start, // Align text to the start
                                children: [
                                  // Title
                                  Text(
                                    '${books[i]['header']}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                      height:
                                          5), // Add some space between title and subtitle
                                  // Subtitle
                                  Text(
                                    '${books[i]['ownership']}',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(), // Add a divider to separate items
                      ],
                    ),
                  )
              ]
            ],
          ),
        ));
  }
}
