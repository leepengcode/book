// ignore_for_file: unused_local_variable, deprecated_member_use

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:io' as io;
import 'package:book/Componnents/style.dart';
import 'package:book/Form/LeftSideBar.dart';
import 'package:book/Form/Screen/FormWidget.dart';
import 'package:book/Model/ComparisonModel.dart';
import 'package:book/Model/CoverModel.dart';
import 'package:book/Model/FinalIndicationBuildingMdel.dart';
import 'package:book/Model/FinalIndicationLandMdel.dart';
import 'package:book/Model/FinalIndicationModel.dart';
import 'package:book/Model/FinalMapModel.dart';
import 'package:book/Model/GoogleMapModep.dart';
import 'package:book/Model/IDCardModel.dart';
import 'package:book/Model/LayoutModel.dart';
import 'package:book/Model/OfficerReportModel.dart';
import 'package:book/Model/PhotoDetailModel.dart';
import 'package:book/Model/PropertyInfoModel.dart';
import 'package:book/Model/ProvisionalBuildingMdel.dart';
import 'package:book/Model/ProvisionalLandMdel.dart';
import 'package:book/Model/ProvisionalModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps/google_maps.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:http/http.dart' as http;
import 'package:number_to_words/number_to_words.dart';

class MyPDF_api extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyPDF_api({
    super.key,
    this.objCover,
    this.objPropertyInfor,
    this.objIdcard,
    this.objLayout,
    this.objGmap,
    this.objOfficerReport,
    this.objProvisional,
    this.objPLand,
    this.objPBuilding,
    this.objFinalIndication,
    this.objLand,
    this.objBuilding,
    this.objfinalmap,
    this.objComparison,
    this.objPhotoDetail,
    this.list_forviewproperty,
    this.list_forinsideproperty,
    this.list_forviewland,
    required this.set_objCover_image,
    required this.set_fidcard1,
    required this.set_bidcard1,
    required this.set_map1Image,
    required this.set_map2Image,
    required this.set_map3Image,
    required this.frontviewimage,
    required this.roadviewimage1,
    required this.roadviewimage2,
    required this.surroundin1,
    required this.surroundin2,
    required this.surroundin3,
    required this.surroundin4,
    required this.surroundin5,
    required this.surroundin6,
    required this.pImage,
  });
  final Cover? objCover;
  final PropertyInfor? objPropertyInfor;
  final IDCard? objIdcard;
  final Layout? objLayout;
  final Gmap? objGmap;
  final OfficerReport? objOfficerReport;
  final Comparison? objComparison;
  final Provisional? objProvisional;
  final PLand? objPLand;
  final PBuilding? objPBuilding;
  final FinalIndication? objFinalIndication;
  final Land? objLand;
  final Building? objBuilding;
  final FinalMap? objfinalmap;
  final PhotoDetail? objPhotoDetail;
  final List<Uint8List>? list_forviewproperty;
  final List<Uint8List>? list_forinsideproperty;
  final List<Uint8List>? list_forviewland;
  final Uint8List set_objCover_image;
  final Uint8List set_fidcard1;
  final Uint8List set_bidcard1;
  final Uint8List set_map1Image;
  final Uint8List set_map2Image;
  final Uint8List set_map3Image;
  final Uint8List frontviewimage;
  final Uint8List roadviewimage1;
  final Uint8List roadviewimage2;
  final Uint8List surroundin1;
  final Uint8List surroundin2;
  final Uint8List surroundin3;
  final Uint8List surroundin4;
  final Uint8List surroundin5;
  final Uint8List surroundin6;
  final Uint8List pImage;
  @override
  State<MyPDF_api> createState() => _MyPDFState_api();
}

class _MyPDFState_api extends State<MyPDF_api> {
  List<Uint8List> viewimg = [];
  List<Uint8List> insideimg = [];
  List<Uint8List> viewlandimg = [];

  // Uint8List? frontviewimage;
  // Uint8List? roadviewimage1;
  // Uint8List? roadviewimage2;
  // Uint8List? surroundin1;
  // Uint8List? surroundin2;
  // Uint8List? surroundin3;
  // Uint8List? surroundin4;
  // Uint8List? surroundin5;
  // Uint8List? surroundin6;
  // Uint8List? pImage;

  Future formart_to_pdf() async {
    // if (widget.objCover!.header !=
    //       "Property [LAND AND BUILDING] VALUATION REPORT") {
    //     await viewland();
    //   } else {
    //     await Viewimage();
    //     await Insideimg();
    //   }

    // Make sure paths are valid and file exists

    // pImage = await fileToUint8List(widget.objfinalmap!.Finalmap!.path);
    // try {
    //   await Printing.layoutPdf(onLayout: (format) => generatePdf(format));
    // } catch (e) {
    //   print('Error formatting PDF: $e');
    //   rethrow;
    // }
    // try {
    //   await Printing.layoutPdf(onLayout: (format) => generatePdf(format));
    // } catch (e, stacktrace) {
    //   print('Error formatting PDF: $e');
    //   print('Stacktrace: $stacktrace');
    //   rethrow;
    // }
  }

  var numformat = NumberFormat("###,###.00");

  String convertNumberToWords(int number) {
    if (number == 0) return 'Zero';
    if (number < 0) return 'Minus ${convertNumberToWords(-number)}';

    final units = [
      '',
      'One',
      'Two',
      'Three',
      'Four',
      'Five',
      'Six',
      'Seven',
      'Eight',
      'Nine'
    ];
    final teens = [
      'Eleven',
      'Twelve',
      'Thirteen',
      'Fourteen',
      'Fifteen',
      'Sixteen',
      'Seventeen',
      'Eighteen',
      'Nineteen'
    ];
    final tens = [
      '',
      'Ten',
      'Twenty',
      'Thirty',
      'Forty',
      'Fifty',
      'Sixty',
      'Seventy',
      'Eighty',
      'Ninety'
    ];
    final thousands = ['', 'Thousand', 'Million', 'Billion'];

    String words = '';

    int i = 0;
    while (number > 0) {
      int chunk = number % 1000;
      if (chunk != 0) {
        String chunkInWords = '';
        int hundreds = chunk ~/ 100;
        int remainder = chunk % 100;
        if (hundreds != 0) {
          chunkInWords += '${units[hundreds]} Hundred ';
        }
        if (remainder >= 11 && remainder <= 19) {
          chunkInWords += '${teens[remainder - 11]} ';
        } else {
          int tensPlace = remainder ~/ 10;
          int unitsPlace = remainder % 10;
          if (tensPlace != 0) {
            chunkInWords += '${tens[tensPlace]} ';
          }
          if (unitsPlace != 0) {
            chunkInWords += '${units[unitsPlace]} ';
          }
        }
        words = '$chunkInWords${thousands[i]} $words';
      }
      number ~/= 1000;
      i++;
    }

    return words.trim();
  }

  String convertToMoneyWords(double number) {
    final formatter = NumberFormat("###,###.00", "en_US");
    String formattedNumber = formatter.format(number);

    // Separate the integer and decimal parts
    int integerPart = number.toInt();
    int decimalPart = ((number - integerPart) * 100).toInt();

    // Convert both parts to words
    String integerPartInWords = convertNumberToWords(integerPart);
    String decimalPartInWords = convertNumberToWords(decimalPart);

    // Construct final string
    String result = "$integerPartInWords Dollar${integerPart != 1 ? 's' : ''}";
    if (decimalPart > 0) {
      result += " and $decimalPartInWords Cent${decimalPart != 1 ? 's' : ''}";
    }

    return result;
  }

  Uint8List? test_objCover_image;
  Uint8List fileToUint8List(String filePath) {
    return Uint8List.fromList(Utf8Encoder().convert(filePath));
  }

  @override
  void initState() {
    // TODO: implement initState

    formart_to_pdf();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return  MyleftSideBar();

    // return FutureBuilder(
    //     future: formart_to_pdf(),
    //     builder: (context, i) {
    //       if (i.hasError) {
    //         return Center(
    //           child: Text("Error ${i.error}\n"),
    //         );
    //       } else if (i.hasData) {
    //         return MyleftSideBar();
    //       } else {
    //         return Center(child: CircularProgressIndicator());
    //       }
    //     });
    return Scaffold(
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextButton(
                    onPressed: () async {
                      await formart_to_pdf();
                      await Printing.layoutPdf(
                          onLayout: (format) => generatePdf(format));
                    },
                    child: Text("Get PDF   ")),
              ],
            ),
          ),
        ),
      ),
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

  // Future Viewimage() async {
  //   for (int i = 0; i < widget.list_forviewproperty!.length; i++) {
  //     try {
  //       viewimg.add(widget.list_forviewproperty![i]);
  //     } catch (e) {
  //       print("Error loop get_listviewimg $e\n");
  //     }
  //   }
  // }

  // Future Insideimg() async {
  //   for (int i = 0; i < widget.list_forinsideproperty!.length; i++) {
  //     try {
  //       insideimg.add(widget.list_forinsideproperty![i]);
  //     } catch (e) {
  //       print("Error loop get_listinside\n");
  //     }
  //   }
  // }

  // Future viewland() async {
  //   for (int i = 0; i < widget.list_forviewland!.length; i++) {
  //     try {
  //       viewlandimg.add(widget.list_forviewland![i]);
  //     } catch (e) {
  //       print("Error loop get_listviewland\n");
  //     }
  //   }
  // }

  Future<Uint8List> generatePdf(
    final PdfPageFormat format,
  ) async {
    final doc = pw.Document(
      title: "FULL REPORT BOOK",
    );
    final pdf = pw.Document(version: PdfVersion.pdf_1_4, compress: true);
    final logoImage = pw.MemoryImage(
      (await rootBundle.load('assets/images/logo.jpg')).buffer.asUint8List(),
    );
    // final angkorImage1 = widget.set_objCover_image;
    // final image = pw.MemoryImage(imageData);
    // Uint8List angkorImage1 =
    //     await fileToUint8List(widget.objCover!.image!.path);

    String moneyInWords = "";
    String landinWord = "";
    String officespaceinword = "";
    String condoinword = "";
    // if (widget.objCover!.header ==
    //     "Property [LAND AND BUILDING] VALUATION REPORT") {
    //   double totalValue =
    //       double.parse(widget.objFinalIndication!.totallandvalue.toString()) +
    //           double.parse(
    //               widget.objFinalIndication!.totalbuildingvalue.toString());
    //   moneyInWords = convertToMoneyWords(totalValue);
    // } else if (widget.objCover!.header == "Property LAND VALUATION REPORT") {
    //   double totalland =
    //       double.parse(widget.objFinalIndication!.totallandvalue.toString());
    //   landinWord = convertToMoneyWords(totalland);
    // } else if (widget.objCover!.header ==
    //     "Property OFFICE SPACE VALUATION REPORT") {
    //   double totalofficespace = double.parse(
    //       widget.objFinalIndication!.totalbuildingvalue.toString());
    //   officespaceinword = convertToMoneyWords(totalofficespace);
    // } else if (widget.objCover!.header == "Property CONDO REPORT") {
    //   double totalofficespace = double.parse(
    //       widget.objFinalIndication!.totalbuildingvalue.toString());
    //   condoinword = convertToMoneyWords(totalofficespace);
    // }

    String fireinWord = "";
    if (widget.objCover!.header != "Property LAND VALUATION REPORT") {
      print("object${widget.objProvisional!.fire_insurance.toString()}\n");
      fireinWord = convertToMoneyWords(
          double.parse(widget.objProvisional!.fire_insurance.toString()));
      print("object${fireinWord}\n");
    }

    // Uint8List fidcard1 =
    //     await fileToUint8List(widget.objIdcard!.frontidcard1!.path);
    // Uint8List fidcard2 =
    //     await fileToUint8List(widget.objIdcard!.frontidcard2!.path);
    // Uint8List bidcard1 =
    //     await fileToUint8List(widget.objIdcard!.backidcard1!.path);
    // Uint8List bidcard2 = await fileToUint8List(widget.objIdcard!.backidcard2!.path);

    Uint8List ownerimg1 = widget.objLayout!.deepimage1;
    // await File(widget.objLayout!.deepimage1!.path).readAsBytes();

    Uint8List ownerimg2 = widget.objLayout!.deepimage2;

    Uint8List layoutimg = widget.objLayout!.layoutimage;

    Uint8List map1Image = widget.set_map1Image;

    Uint8List map2Image = widget.set_map2Image;

    Uint8List map3Image = widget.set_map3Image;

    final ByteData map = await rootBundle.load('assets/images/map.jpg');
    final Uint8List mapImage = map.buffer.asUint8List();

    final ByteData bank = await rootBundle.load('assets/images/bank.jpg');
    final Uint8List bankImage = bank.buffer.asUint8List();

    final ByteData certi1 =
        await rootBundle.load('assets/images/certificate1.jpg');
    final Uint8List certi1Image = certi1.buffer.asUint8List();

    final ByteData certi2 =
        await rootBundle.load('assets/images/certificate2.jpg');
    final Uint8List certi2Image = certi2.buffer.asUint8List();

    final ByteData mrden = await rootBundle.load('assets/images/mrden.jpg');
    final Uint8List DenImage = mrden.buffer.asUint8List();

    final ByteData mrdoung = await rootBundle.load('assets/images/mrdoung.jpg');
    final Uint8List DoungImage = mrdoung.buffer.asUint8List();

    final ByteData mrnull = await rootBundle.load('assets/images/mrnull.jpg');
    final Uint8List nullImage = mrnull.buffer.asUint8List();

    final ByteData mrnull1 = await rootBundle.load('assets/images/mrnull1.jpg');
    final Uint8List null1Image = mrnull1.buffer.asUint8List();

    Uint8List? layoutImage;

    final pageTheme = await _myPageTheme(format);
    final font = await PdfGoogleFonts.notoSansAdlamRegular();
    final h_font = await PdfGoogleFonts.notoSansAdlamBold();
    final b_font = await PdfGoogleFonts.notoSansAdlamBold();
    final khmer = await PdfGoogleFonts.notoSansKhmerBlack();

//style
    pw.TextStyle header1() {
      return pw.TextStyle(
        fontSize: 15,
        font: h_font,
        color: PdfColor.fromInt(0x2473b8),
      );
    }

    pw.TextStyle header2(bool c) {
      return pw.TextStyle(
          fontSize: 13,
          font: khmer,
          color: (c) ? PdfColor.fromInt(0x2473b8) : PdfColor.fromInt(0xc4242c),
          fontWeight: pw.FontWeight.bold);
    }

    pw.TextStyle header3() {
      return pw.TextStyle(
          fontSize: 13,
          font: h_font,
          color: PdfColors.black,
          fontWeight: pw.FontWeight.bold);
    }

    pw.TextStyle header4() {
      return pw.TextStyle(
          fontSize: 12,
          font: h_font,
          color: PdfColors.black,
          fontWeight: pw.FontWeight.bold);
    }

    pw.TextStyle header6() {
      return pw.TextStyle(
          fontSize: 8,
          font: h_font,
          color: PdfColors.blue900,
          fontWeight: pw.FontWeight.bold);
    }

    pw.TextStyle body() {
      return pw.TextStyle(
        fontSize: 11,
        font: font,
        color: PdfColors.black,
      );
    }

    pw.TextStyle b_body() {
      return pw.TextStyle(
        fontSize: 11,
        font: b_font,
        color: PdfColors.black,
      );
    }

    pw.TextStyle body1() {
      return pw.TextStyle(
        fontSize: 12,
        font: font,
        color: PdfColors.black,
      );
    }

    //first page
    // pdf.addPage(pw.Page(
    //   pageTheme: pageTheme,
    //   build: (final context) {
    //     return pw.FullPage(
    //       ignoreMargins: true,
    //       child: pw.Image(
    //         coverImage,
    //         fit: pw.BoxFit.cover,
    //       ),
    //     );
    //   },
    // ));

    //Sencond page
    pdf.addPage(
      pw.Page(
        pageTheme: pageTheme,
        build: (final context) {
          return pw.FullPage(
            ignoreMargins: true,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Container(
                  margin: const pw.EdgeInsets.only(
                      top: 25, right: 25), // Add margin here
                  child: pw.Text(
                    // ignore: unnecessary_null_comparison
                    "©BY CAMBODIA ANGKOR REAL ESTATE CO., LTD}",
                    style: pw.TextStyle(fontSize: 9, font: font),
                  ),
                ),
                pw.Expanded(
                  child: pw.Container(
                    margin: const pw.EdgeInsets.only(
                        top: 5, left: 40, right: 25, bottom: 25),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(
                        color: PdfColors.black,
                        width: 2, // Adjust border width as needed
                      ),
                    ),
                    child: pw.Center(
                        child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Padding(
                          padding: const pw.EdgeInsets.only(
                            top: 25,
                          ), // Add margin here
                          child: pw.Text(
                            "${widget.objCover!.header}\n\n REPORT TO",
                            style: header1(),
                            textAlign: pw.TextAlign.center,
                          ),
                        ),
                        if (widget.objCover!.info == "Bank") ...[
                          pw.Text(
                              "\n${widget.objCover!.bank} \n(${widget.objCover!.branch})",
                              style: header1(),
                              textAlign: pw.TextAlign.center),
                        ] else ...[
                          pw.Text("\n${widget.objCover!.ownership}",
                              style: header1(), textAlign: pw.TextAlign.center),
                        ],
                        pw.Padding(
                          padding: const pw.EdgeInsets.only(
                              top: 15, bottom: 15), // Add margin here
                          child: pw.Text("FOR", style: header1()),
                        ),
                        pw.Container(
                          child: pw.RichText(
                            text: pw.TextSpan(
                              text: '${widget.objCover!.ownername}',
                              style: header2(true), // Base style
                              children: [],
                            ),
                          ),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.only(
                            top: 10,
                          ), // Add margin here
                          child: pw.RichText(
                            text: pw.TextSpan(
                              text: 'Deep Title :',
                              style: header2(false), // Base style
                              children: [
                                pw.TextSpan(
                                  text: ' ${widget.objCover!.deeptitle}',
                                  style: header2(true),
                                ),
                              ],
                            ),
                          ),
                        ),
                        pw.Padding(
                            padding: pw.EdgeInsets.only(
                              left: 60,
                              right: 60,
                              top: 10,
                            ),
                            child: pw.Image(
                                pw.MemoryImage(widget.set_objCover_image),
                                fit: pw.BoxFit.cover,
                                height: 280)),
                        pw.Padding(
                          padding: const pw.EdgeInsets.only(
                              top: 15, right: 50, left: 60),
                          child: pw.RichText(
                              text: pw.TextSpan(
                                text: 'Address :',
                                style: header2(false), // Base style
                                children: [
                                  pw.TextSpan(
                                    text:
                                        ' ${widget.objCover!.location}, ${widget.objCover!.street}, ${widget.objCover!.cityorprovince}, ${widget.objCover!.communeorkhan}, ${widget.objCover!.districtorsangkat}, ${widget.objCover!.villageorphum}',
                                    style: header2(true),
                                  ),
                                ],
                              ),
                              textAlign:
                                  pw.TextAlign.center), // Add margin here
                        ),
                        pw.Padding(
                          padding:
                              const pw.EdgeInsets.only(), // Add margin here
                          child: pw.RichText(
                            text: pw.TextSpan(
                              text: '\nREPORTED, ${widget.objCover!.reportto},',
                              style: header2(true), // Base style
                            ),
                          ),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.only(
                            top: 5,
                          ), // Add margin here
                          child: pw.RichText(
                            text: pw.TextSpan(
                              text: 'ON :',
                              style: header2(false), // Base style
                              children: [
                                pw.TextSpan(
                                  text: ' ${widget.objCover!.date}',
                                  style: header2(true),
                                ),
                              ],
                            ),
                          ),
                        ),
                        pw.SizedBox(height: 5),
                        pw.RichText(
                          text: pw.TextSpan(
                            text: 'By',
                            style: header2(true), // Base style
                          ),
                        ),
                        pw.SizedBox(height: 5),
                        pw.RichText(
                          text: pw.TextSpan(
                            text: ' CAMBODIA ANGKOR REAL ESTATE CO.,LTD.',
                            style: header2(false), // Base style
                          ),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.only(
                              top: 5), // Add margin here
                          child: pw.RichText(
                            text: pw.TextSpan(
                              text: 'Copy Right by: C-A-R-E',
                              style: header2(true), // Base style
                            ),
                          ),
                        ),
                        pw.RichText(
                          text: pw.TextSpan(
                            text: '\nNº : ${widget.objCover!.code}',
                            style: header2(true), // Base style
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

    //Third Page
    pdf.addPage(
      pw.Page(
        pageTheme: pageTheme,
        build: (final context) {
          return pw.FullPage(
            ignoreMargins: true,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Container(
                  margin: const pw.EdgeInsets.only(top: 25, right: 25),
                  child: pw.Text(
                    "©BY CAMBODIA ANGKOR REAL ESTATE CO., LTD",
                    style: pw.TextStyle(fontSize: 9, font: font),
                  ),
                ),
                pw.Expanded(
                  child: pw.Container(
                    margin: const pw.EdgeInsets.only(
                        top: 5, left: 40, right: 25, bottom: 25),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(
                        color: PdfColors.black,
                        width: 2,
                      ),
                    ),
                    child: pw.Center(
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(top: 25),
                            child: pw.Text(
                              "Contents",
                              style: header1(),
                              textAlign: pw.TextAlign.center,
                            ),
                          ),
                          pw.Text("General Information",
                              style: header1(), textAlign: pw.TextAlign.center),
                          pw.Container(
                            padding:
                                const pw.EdgeInsets.only(left: 15, right: 15),
                            child: pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                              children: [
                                pw.Text("Subject",
                                    style: header1(),
                                    textAlign: pw.TextAlign.center),
                                pw.Text("Page",
                                    style: header1(),
                                    textAlign: pw.TextAlign.center),
                              ],
                            ),
                          ),
                          pw.Text(
                              "Introduction ............................................................................................................................................ - 1 -",
                              style: body(),
                              textAlign: pw.TextAlign.center),
                          pw.Text(
                            "\n${widget.objCover!.header}",
                            style: header2(true),
                            textAlign: pw.TextAlign.center,
                          ),
                          if (widget.objCover!.header ==
                              "Property [LAND AND BUILDING] VALUATION REPORT") ...[
                            pw.Text(
                                "\nProperty [LAND AND BUILDING] VALUATION REPORT .................................................................... - 2 -",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                          ] else if (widget.objCover!.header ==
                              "Property LAND VALUATION REPORT") ...[
                            pw.Text(
                                "\nProperty LAND VALUATION REPORT ................................................................................................. - 2 -",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                          ] else if (widget.objCover!.header ==
                              "Property OFFICE SPACE VALUATION REPORT") ...[
                            pw.Text(
                                "\nProperty OFFICE SPACE VALUATION REPORT ................................................................................. - 2 -",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                          ] else if (widget.objCover!.header ==
                              "Property CONDO REPORT") ...[
                            pw.Text(
                                "\nProperty CONDO REPORT .................................................................................................................. - 2 -",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                          ],
                          if (widget.objCover!.header ==
                              "Property LAND VALUATION REPORT") ...[
                            pw.Text(
                                "\nOwner's Identification Card ............................................................................................................... - 3 -",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                          ] else ...[
                            pw.Text(
                                "\nOwner's Identification Card ............................................................................................................... - 4 -",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                          ],
                          if (widget.objCover!.header ==
                              "Property LAND VALUATION REPORT") ...[
                            pw.Text(
                                "\nCopy Title Deed ..................................................................................................................................... - 4 -",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                          ] else ...[
                            pw.Text(
                                "\nCopy Title Deed ..................................................................................................................................... - 5 -",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                          ],
                          if (widget.objCover!.header ==
                              "Property [LAND AND BUILDING] VALUATION REPORT") ...[
                            pw.Text(
                                "\nLand and Building Layout ................................................................................................................... - 6 -",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                          ] else if (widget.objCover!.header ==
                                  "Property LAND VALUATION REPORT" &&
                              widget.objCover!.header ==
                                  "Property OFFICE SPACE VALUATION REPORT" &&
                              widget.objCover!.header ==
                                  "Property CONDO REPORT") ...[
                            pw.Text(
                                "\nLand Layout ........................................................................................................................................... - 5 -",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                          ] else if (widget.objCover!.header ==
                              "Property OFFICE SPACE VALUATION REPORT") ...[
                            pw.Text(
                                "\nOffice Space Layout ............................................................................................................................ - 6 -",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                          ] else if (widget.objCover!.header ==
                              "Property CONDO REPORT") ...[
                            pw.Text(
                                "\nCondo Layout ....................................................................................................................................... - 6 -",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                          ],
                          if (widget.objCover!.header ==
                                  "Property LAND VALUATION REPORT" &&
                              widget.objCover!.header ==
                                  "Property OFFICE SPACE VALUATION REPORT" &&
                              widget.objCover!.header ==
                                  "Property CONDO REPORT") ...[
                            pw.Text(
                                "\nCambodia Map & Location Map In Phnom Penh ............................................................................. - 6 -",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                          ] else ...[
                            pw.Text(
                                "\nCambodia Map & Location Map In Phnom Penh ............................................................................. - 7 -",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                          ],
                          if (widget.objCover!.header ==
                                  "Property LAND VALUATION REPORT" &&
                              widget.objCover!.header ==
                                  "Property OFFICE SPACE VALUATION REPORT" &&
                              widget.objCover!.header ==
                                  "Property CONDO REPORT") ...[
                            pw.Text(
                                "\nAerial Photograph Of Phnom Penh Loacation .................................................................................. - 7 -",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                          ] else ...[
                            pw.Text(
                                "\nAerial Photograph Of Phnom Penh Loacation .................................................................................. - 8 -",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                          ],
                          if (widget.objCover!.header ==
                                  "Property LAND VALUATION REPORT" &&
                              widget.objCover!.header ==
                                  "Property OFFICE SPACE VALUATION REPORT" &&
                              widget.objCover!.header ==
                                  "Property CONDO REPORT") ...[
                            pw.Text(
                                "\nDetails Of Photos Taken At The Site Inspection ................................................................................ - 8 -",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                          ] else ...[
                            pw.Text(
                                "\nDetails Of Photos Taken At The Site Inspection ................................................................................ - 9 -",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                          ],
                          if (widget.objCover!.header ==
                                  "Property LAND VALUATION REPORT" &&
                              widget.objCover!.header ==
                                  "Property OFFICE SPACE VALUATION REPORT" &&
                              widget.objCover!.header ==
                                  "Property CONDO REPORT") ...[
                            pw.Text(
                                "\nInspacting Officer's Report ................................................................................................................. - 10 -",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                          ] else ...[
                            pw.Text(
                                "\nInspacting Officer's Report ................................................................................................................. - 12 -",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                          ],
                          if (widget.objCover!.header ==
                                  "Property LAND VALUATION REPORT" &&
                              widget.objCover!.header ==
                                  "Property OFFICE SPACE VALUATION REPORT" &&
                              widget.objCover!.header ==
                                  "Property CONDO REPORT") ...[
                            pw.Text(
                                "\nProposed Developments Affecting The Value Of The Subject Land .............................................. - 11 -",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                          ] else ...[
                            pw.Text(
                                "\nProposed Developments Affecting The Value Of The Subject Land .............................................. - 13 -",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                          ],
                          if (widget.objCover!.header ==
                                  "Property LAND VALUATION REPORT" &&
                              widget.objCover!.header ==
                                  "Property OFFICE SPACE VALUATION REPORT" &&
                              widget.objCover!.header ==
                                  "Property CONDO REPORT") ...[
                            pw.Text(
                                "\nValue Of Comparable Nearby Property ............................................................................................ - 12 -",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                          ] else ...[
                            pw.Text(
                                "\nValue Of Comparable Nearby Property ............................................................................................ -14 -",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                          ],
                          if (widget.objCover!.header ==
                                  "Property LAND VALUATION REPORT" &&
                              widget.objCover!.header ==
                                  "Property OFFICE SPACE VALUATION REPORT" &&
                              widget.objCover!.header ==
                                  "Property CONDO REPORT") ...[
                            pw.Text(
                                "\nProvisional Valuation Made By The Inspecting Officer(S) .............................................................. - 14 -",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                          ] else ...[
                            pw.Text(
                                "\nProvisional Valuation Made By The Inspecting Officer(S) .............................................................. - 16 -",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                          ],
                          pw.Text(
                            "\nFinal Valuation",
                            style: header2(true),
                            textAlign: pw.TextAlign.center,
                          ),
                          if (widget.objCover!.header ==
                                  "Property LAND VALUATION REPORT" &&
                              widget.objCover!.header ==
                                  "Property OFFICE SPACE VALUATION REPORT" &&
                              widget.objCover!.header ==
                                  "Property CONDO REPORT") ...[
                            pw.Text(
                                "\nFinal Indication Of Subject Property Market Value ......................................................................... - 15 -",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                          ] else ...[
                            pw.Text(
                                "\nFinal Indication Of Subject Property Market Value ......................................................................... - 17 -",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                          ],
                          pw.Text(
                            "\nAppendix",
                            style: header2(true),
                            textAlign: pw.TextAlign.center,
                          ),
                          if (widget.objCover!.header ==
                                  "Property LAND VALUATION REPORT" &&
                              widget.objCover!.header ==
                                  "Property OFFICE SPACE VALUATION REPORT" &&
                              widget.objCover!.header ==
                                  "Property CONDO REPORT") ...[
                            pw.Text(
                                "\nC.A.R.E Limiting Terms, Condition & Liability ................................................................................... - 16 -",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                          ] else ...[
                            pw.Text(
                                "\nC.A.R.E Limiting Terms, Condition & Liability ................................................................................... - 18 -",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                          ],
                          if (widget.objCover!.header ==
                                  "Property LAND VALUATION REPORT" &&
                              widget.objCover!.header ==
                                  "Property OFFICE SPACE VALUATION REPORT" &&
                              widget.objCover!.header ==
                                  "Property CONDO REPORT") ...[
                            pw.Text(
                                "\nOur Valued Partners and CVEA & Professional Indemnity Insurance Certificate .......................... - 18 - ",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                          ] else ...[
                            pw.Text(
                                "\nOur Valued Partners and CVEA & Professional Indemnity Insurance Certificate .......................... - 20 - ",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                          ],
                          if (widget.objCover!.header ==
                                  "Property LAND VALUATION REPORT" &&
                              widget.objCover!.header ==
                                  "Property OFFICE SPACE VALUATION REPORT" &&
                              widget.objCover!.header ==
                                  "Property CONDO REPORT") ...[
                            pw.Text(
                                "\nLicenses and Certificate Property Valuation ..................................................................................... -19 -",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                            pw.SizedBox(height: 20),
                          ] else ...[
                            pw.Text(
                                "\nLicenses and Certificate Property Valuation ..................................................................................... -21 -",
                                style: body(),
                                textAlign: pw.TextAlign.center),
                            pw.SizedBox(height: 20),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

    // //Fourth page
    pdf.addPage(
      pw.Page(
        pageTheme: pageTheme,
        build: (final context) {
          return pw.FullPage(
            ignoreMargins: true,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Container(
                  margin: const pw.EdgeInsets.only(
                      top: 25, right: 25), // Add margin here
                  child: pw.Text(
                    "©BY CAMBODIA ANGKOR REAL ESTATE CO., LTD",
                    style: pw.TextStyle(fontSize: 9, font: font),
                  ),
                ),
                pw.Expanded(
                  child: pw.Container(
                    margin: const pw.EdgeInsets.only(
                        top: 5, left: 40, right: 25, bottom: 25),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(
                        color: PdfColors.black,
                        width: 2, // Adjust border width as needed
                      ),
                    ),
                    child: pw.Container(
                        padding: pw.EdgeInsets.only(left: 40, right: 20),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          // mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  top: 25, left: -20), // Add margin here
                              child: pw.Text(
                                "Introduction",
                                style: header1(),
                                textAlign: pw.TextAlign.center,
                              ),
                            ),
                            pw.Text(
                              "\nDerivation of fair and just open market value of land or property is an essential part of any real estate transaction. Evaluating land or property involves detailed analysis of the Subject Land or Subject Property (the land or property for sale or rent that is the subject of the evaluation) and a similar analysis of neighboring land or property.  Additional factors which may have a bearing on the true value of the Subject Land or Property, such as location; access; and the provision of utilities, are included in the evaluation. A professional real estate evaluation benefits the buyer and the seller",
                              style: body1(),
                              textAlign: pw.TextAlign.start,
                            ),
                            pw.Text("\nPurpose Of Appraisal",
                                style: header2(true)),
                            pw.Text(
                                "The appraisal of the Subject Property is for the purpose of deriving an open market value as at the time of valuation.",
                                style: body1()),
                            pw.Text("\nDate of Valuation",
                                style: header2(true)),
                            pw.Text(
                                "The date of valuation is the date the valuation report is signed by the relevant officers of C-A-R-E and stamped with the Company Seal.",
                                style: body1()),
                            pw.Text("\nMarket Comparison Method",
                                style: header2(true)),
                            pw.Container(
                              child: pw.RichText(
                                text: pw.TextSpan(
                                  text:
                                      'This method of valuation estimates the value of a Subject Property by comparing it with similar properties in the same location that have already sold. ',
                                  style: body1(), // Base style
                                  children: [
                                    pw.TextSpan(
                                      text: 'Relative Comparison Analysis',
                                      style: header2(true),
                                    ),
                                    pw.TextSpan(
                                      text:
                                          'is a qualitative analysis method, used in sales comparisons, that concentrates on applying the most suitable and effective comparison methods to the best available data in order to produce the most accurate valuation result possible.   ',
                                      style: body1(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            pw.Text("\nCost Method ", style: header2(true)),
                            pw.Text(
                                "This approach estimates the value of a given property by calculating the cost of replacing or reproducing a structure on the land, considering depreciation and site value or established by considering comparable sales transactions. ",
                                style: body1()),
                            pw.Text("\nResidual Method", style: header2(true)),
                            pw.Text(
                                "This method is use to determine the market value of the property, remaining from value of the completed development, measured in terms of Gross Development Value after deducting cost of redevelopment. Construction costs and other expenses for development of property together with assumed allowance for developer’s profit, sale incomes after development are being calculated. ",
                                style: body1()),
                          ],
                        )),
                  ),
                ),
                pw.SizedBox(height: 20)
              ],
            ),
          );
        },
      ),
    );

    //Five Page
    pdf.addPage(pw.Page(
      pageTheme: pageTheme,
      build: (final context) {
        return pw.FullPage(
          ignoreMargins: true,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            children: [
              pw.Container(
                margin: const pw.EdgeInsets.only(
                    top: 25, right: 25), // Add margin here
                child: pw.Text(
                  "©BY CAMBODIA ANGKOR REAL ESTATE CO., LTD",
                  style: pw.TextStyle(fontSize: 9, font: font),
                ),
              ),
              pw.Expanded(
                child: pw.Container(
                  margin: const pw.EdgeInsets.only(
                      top: 5, left: 40, right: 25, bottom: 25),
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(
                      color: PdfColors.black,
                      width: 2, // Adjust border width as needed
                    ),
                  ),
                  child: pw.Container(
                      padding: pw.EdgeInsets.only(left: 40, right: 20),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        children: [
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                top: 20, left: -20), // Add margin here
                            child: pw.Text(
                              " Valuation Report",
                              style: header2(true),
                              textAlign: pw.TextAlign.center,
                            ),
                          ),
                          pw.RichText(
                            text: pw.TextSpan(
                              text:
                                  '\nHaving undertaken detailed inspections of the site and, where necessary, consulted the relevant local and national authorities; Cambodia Angkor Real Estate Co. Ltd. hereby submits the following ',
                              style: body1(), // Base style
                              children: [
                                if (widget.objCover!.header ==
                                    "Property [LAND AND BUILDING] VALUATION REPORT") ...[
                                  pw.TextSpan(
                                    text: 'Property [Land and Building]',
                                    style: header2(true),
                                  ),
                                ] else if (widget.objCover!.header ==
                                    "Property LAND VALUATION REPORT") ...[
                                  pw.TextSpan(
                                    text: 'Property [Land]',
                                    style: header2(true),
                                  ),
                                ] else if (widget.objCover!.header ==
                                    "Property OFFICE SPACE VALUATION REPORT") ...[
                                  pw.TextSpan(
                                    text: 'Property [Office Space]',
                                    style: header2(true),
                                  ),
                                ] else ...[
                                  pw.TextSpan(
                                    text: 'Property [CONDO]',
                                    style: header2(true),
                                  ),
                                ],
                                pw.TextSpan(
                                  text:
                                      ' Valuation Report as a true and accurate reflection of the current market value of the Subject Property.  This Property [Land and Building] Valuation Report has been prepared to',
                                  style: body1(),
                                ),
                                pw.TextSpan(
                                  text:
                                      ' ${widget.objCover!.bank}. (${widget.objCover!.branch}),',
                                  style: header2(true),
                                ),
                                pw.TextSpan(
                                  text: ' for ownership’s name',
                                  style: body1(),
                                ),
                                pw.TextSpan(
                                  text: ' \n${widget.objCover!.ownername},',
                                  style: header2(true),
                                ),
                                pw.TextSpan(
                                  text:
                                      ' clients of Cambodia Angkor Real Estate Co., Ltd.  ',
                                  style: body1(),
                                ),
                              ],
                            ),
                          ),
                          pw.Text(
                              "One copy of the Title Deeds was provided by the clients.",
                              style: body1()),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  top: 20, left: -20), // Add margin here
                              child: pw.Column(children: [
                                if (widget.objCover!.header ==
                                    "Property [LAND AND BUILDING] VALUATION REPORT") ...[
                                  pw.Text(
                                    "General Details of Subject Property [Land and Building]",
                                    style: header2(true),
                                    textAlign: pw.TextAlign.center,
                                  ),
                                ] else if (widget.objCover!.header ==
                                    "Property LAND VALUATION REPORT") ...[
                                  pw.Text(
                                    "General Details of Subject Property [Land]",
                                    style: header2(true),
                                    textAlign: pw.TextAlign.center,
                                  ),
                                ] else if (widget.objCover!.header ==
                                    "Property OFFICE SPACE VALUATION REPORT") ...[
                                  pw.Text(
                                    "General Details of Subject Property [Office Space]",
                                    style: header2(true),
                                    textAlign: pw.TextAlign.center,
                                  ),
                                ] else ...[
                                  pw.Text(
                                    "General Details of Subject Property [Condo]",
                                    style: header2(true),
                                    textAlign: pw.TextAlign.center,
                                  ),
                                ],
                              ])),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                top: 10), // Add margin here
                            child: pw.Text(
                              "Land Location",
                              style: header2(true),
                              textAlign: pw.TextAlign.center,
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                top: 5, left: 20), // Add margin here
                            child: pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.SizedBox(
                                  width: 150, // Adjust width as necessary
                                  child: pw.Text(
                                    "Plot",
                                    style: body(),
                                    textAlign: pw.TextAlign.left,
                                  ),
                                ),
                                pw.Text(
                                  " : ${widget.objPropertyInfor!.plotno}",
                                  style: body(),
                                  textAlign: pw.TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                top: 5, left: 20), // Add margin here
                            child: pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.SizedBox(
                                  width: 150, // Adjust width as necessary
                                  child: pw.Text(
                                    "Street",
                                    style: body(),
                                    textAlign: pw.TextAlign.left,
                                  ),
                                ),
                                pw.Text(
                                  " : ${widget.objCover!.street}",
                                  style: body(),
                                  textAlign: pw.TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                top: 5, left: 20), // Add margin here
                            child: pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.SizedBox(
                                  width: 150, // Adjust width as necessary
                                  child: pw.Text(
                                    "Village/Phum",
                                    style: body(),
                                    textAlign: pw.TextAlign.left,
                                  ),
                                ),
                                pw.Text(
                                  " : ${widget.objCover!.villageorphum}",
                                  style: body(),
                                  textAlign: pw.TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                top: 5, left: 20), // Add margin here
                            child: pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.SizedBox(
                                  width: 150, // Adjust width as necessary
                                  child: pw.Text(
                                    "Communue/Khan",
                                    style: body(),
                                    textAlign: pw.TextAlign.left,
                                  ),
                                ),
                                pw.Text(
                                  " : ${widget.objCover!.communeorkhan}",
                                  style: body(),
                                  textAlign: pw.TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                top: 5, left: 20), // Add margin here
                            child: pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.SizedBox(
                                  width: 150, // Adjust width as necessary
                                  child: pw.Text(
                                    "District/Sangkat",
                                    style: body(),
                                    textAlign: pw.TextAlign.left,
                                  ),
                                ),
                                pw.Text(
                                  " : ${widget.objCover!.districtorsangkat}",
                                  style: body(),
                                  textAlign: pw.TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                top: 5, left: 20), // Add margin here
                            child: pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.SizedBox(
                                  width: 150, // Adjust width as necessary
                                  child: pw.Text(
                                    "Province",
                                    style: body(),
                                    textAlign: pw.TextAlign.left,
                                  ),
                                ),
                                pw.Text(
                                  " : ${widget.objCover!.cityorprovince}",
                                  style: body(),
                                  textAlign: pw.TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                top: 5, left: 20), // Add margin here
                            child: pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.SizedBox(
                                  width: 150, // Adjust width as necessary
                                  child: pw.Text(
                                    "Country",
                                    style: body(),
                                    textAlign: pw.TextAlign.left,
                                  ),
                                ),
                                pw.Text(
                                  " : Cambodia",
                                  style: body(),
                                  textAlign: pw.TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                top: 10), // Add margin here
                            child: pw.Text(
                              "Bordered by the following",
                              style: header2(true),
                              textAlign: pw.TextAlign.center,
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                top: 5, left: 20), // Add margin here
                            child: pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.SizedBox(
                                  width: 150, // Adjust width as necessary
                                  child: pw.Text(
                                    "North",
                                    style: body(),
                                    textAlign: pw.TextAlign.left,
                                  ),
                                ),
                                pw.Text(
                                  " : ${widget.objPropertyInfor!.north}",
                                  style: body(),
                                  textAlign: pw.TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                top: 5, left: 20), // Add margin here
                            child: pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.SizedBox(
                                  width: 150, // Adjust width as necessary
                                  child: pw.Text(
                                    "South",
                                    style: body(),
                                    textAlign: pw.TextAlign.left,
                                  ),
                                ),
                                pw.Text(
                                  " : ${widget.objPropertyInfor!.south}",
                                  style: body(),
                                  textAlign: pw.TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                top: 5, left: 20), // Add margin here
                            child: pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.SizedBox(
                                  width: 150, // Adjust width as necessary
                                  child: pw.Text(
                                    "East",
                                    style: body(),
                                    textAlign: pw.TextAlign.left,
                                  ),
                                ),
                                pw.Text(
                                  " : ${widget.objPropertyInfor!.east}",
                                  style: body(),
                                  textAlign: pw.TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                top: 5, left: 20), // Add margin here
                            child: pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.SizedBox(
                                  width: 150, // Adjust width as necessary
                                  child: pw.Text(
                                    "West",
                                    style: body(),
                                    textAlign: pw.TextAlign.left,
                                  ),
                                ),
                                pw.Text(
                                  " : ${widget.objPropertyInfor!.west}",
                                  style: body(),
                                  textAlign: pw.TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                top: 10), // Add margin here
                            child: pw.Text(
                              "Land Title Deed Number",
                              style: header2(true),
                              textAlign: pw.TextAlign.center,
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                top: 5, left: 20), // Add margin here
                            child: pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.SizedBox(
                                  width: 150, // Adjust width as necessary
                                  child: pw.Text(
                                    "Land Title Deep No",
                                    style: body(),
                                    textAlign: pw.TextAlign.left,
                                  ),
                                ),
                                pw.Text(
                                  " : ${widget.objPropertyInfor!.landtitledeep}",
                                  style: body(),
                                  textAlign: pw.TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                top: 10), // Add margin here
                            child: pw.Text(
                              "Land Size by Title Deed",
                              style: header2(true),
                              textAlign: pw.TextAlign.center,
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                top: 5, left: 20), // Add margin here
                            child: pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.SizedBox(
                                  width: 150, // Adjust width as necessary
                                  child: pw.Text(
                                    "Land Side",
                                    style: body(),
                                    textAlign: pw.TextAlign.left,
                                  ),
                                ),
                                pw.Text(
                                  " : ${widget.objPropertyInfor!.landsize}",
                                  style: body(),
                                  textAlign: pw.TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                top: 10), // Add margin here
                            child: pw.Text(
                              "Land Size by Measurement",
                              style: header2(true),
                              textAlign: pw.TextAlign.center,
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                top: 5, left: 20), // Add margin here
                            child: pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.SizedBox(
                                  width: 150, // Adjust width as necessary
                                  child: pw.Text(
                                    "Total Land Size",
                                    style: body(),
                                    textAlign: pw.TextAlign.left,
                                  ),
                                ),
                                pw.Text(
                                  " : ${widget.objPropertyInfor!.landsize}",
                                  style: body(),
                                  textAlign: pw.TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                top: 10), // Add margin here
                            child: pw.Text(
                              "Type of Land",
                              style: header2(true),
                              textAlign: pw.TextAlign.center,
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                top: 5, left: 20), // Add margin here
                            child: pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.SizedBox(
                                  width: 150, // Adjust width as necessary
                                  child: pw.Text(
                                    "Type of Land",
                                    style: body(),
                                    textAlign: pw.TextAlign.left,
                                  ),
                                ),
                                pw.Text(
                                  " : ${widget.objPropertyInfor!.typeland}",
                                  style: body(),
                                  textAlign: pw.TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                top: 5, left: 20), // Add margin here
                            child: pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.SizedBox(
                                  width: 150, // Adjust width as necessary
                                  child: pw.Text(
                                    "Tenure",
                                    style: body(),
                                    textAlign: pw.TextAlign.left,
                                  ),
                                ),
                                pw.Text(
                                  " : ${widget.objPropertyInfor!.tenure}",
                                  style: body(),
                                  textAlign: pw.TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              pw.SizedBox(height: 20)
            ],
          ),
        );
      },
    ));

    //New Page
    if (widget.objCover!.header != "Property LAND VALUATION REPORT") {
      pdf.addPage(
        pw.Page(
          pageTheme: pageTheme,
          build: (final context) {
            return pw.FullPage(
              ignoreMargins: true,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Container(
                    margin: const pw.EdgeInsets.only(
                        top: 25, right: 25), // Add margin here
                    child: pw.Text(
                      "©BY CAMBODIA ANGKOR REAL ESTATE CO., LTD",
                      style: pw.TextStyle(fontSize: 9, font: font),
                    ),
                  ),
                  pw.Expanded(
                    child: pw.Container(
                      margin: const pw.EdgeInsets.only(
                          top: 5, left: 40, right: 25, bottom: 25),
                      decoration: pw.BoxDecoration(
                        border: pw.Border.all(
                          color: PdfColors.black,
                          width: 2, // Adjust border width as needed
                        ),
                      ),
                      child: pw.Container(
                          padding: pw.EdgeInsets.only(left: 40, right: 20),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            // mainAxisAlignment: pw.MainAxisAlignment.center,
                            children: [
                              pw.SizedBox(height: 10),
                              if (widget.objCover!.header ==
                                  "Property OFFICE SPACE VALUATION REPORT") ...[
                                pw.Text(
                                  "Building Title Deep Number  ",
                                  style: header2(true),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.SizedBox(height: 10),
                                pw.Padding(
                                  padding: const pw.EdgeInsets.only(
                                      top: 5, left: 20), // Add margin here
                                  child: pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.SizedBox(
                                        width: 150, // Adjust width as necessary
                                        child: pw.Text(
                                          "Title Deep No",
                                          style: body(),
                                          textAlign: pw.TextAlign.left,
                                        ),
                                      ),
                                      pw.Text(
                                        " : ${widget.objPropertyInfor!.deepnumber}",
                                        style: body(),
                                        textAlign: pw.TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ),
                                pw.Padding(
                                  padding: const pw.EdgeInsets.only(
                                      top: 5, left: 20), // Add margin here
                                  child: pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.SizedBox(
                                        width: 150, // Adjust width as necessary
                                        child: pw.Text(
                                          "Unit",
                                          style: body(),
                                          textAlign: pw.TextAlign.left,
                                        ),
                                      ),
                                      pw.Text(
                                        " : ${widget.objPropertyInfor!.unit}",
                                        style: body(),
                                        textAlign: pw.TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                              pw.SizedBox(height: 10),
                              pw.Text(
                                "Building Size  ",
                                style: header2(true),
                                textAlign: pw.TextAlign.center,
                              ),
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(
                                    top: 5, left: 20), // Add margin here
                                child: pw.Row(
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.SizedBox(
                                      width: 150, // Adjust width as necessary
                                      child: pw.Text(
                                        "Building",
                                        style: body(),
                                        textAlign: pw.TextAlign.left,
                                      ),
                                    ),
                                    pw.Text(
                                      " : ${widget.objPropertyInfor!.flatsize}",
                                      style: body(),
                                      textAlign: pw.TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                              // pw.Padding(
                              //   padding:
                              //       const pw.EdgeInsets.only(top: 15, left: 20),
                              //   child: pw.Text(
                              //     "Roof Extension",
                              //     style: header4(),
                              //     textAlign: pw.TextAlign.center,
                              //   ),
                              // ),
                              // pw.Padding(
                              //   padding: const pw.EdgeInsets.only(left: 20),
                              //   child: pw.Row(
                              //     children: [
                              //       pw.Text(
                              //         "Building Size : ",
                              //         style: body(),
                              //         textAlign: pw.TextAlign.center,
                              //       ),
                              //       pw.Text(
                              //         "${widget.objPropertyInfor!.buildingsize ?? ''}",
                              //         style: body(),
                              //         textAlign: pw.TextAlign.center,
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              // pw.Padding(
                              //   padding:
                              //       const pw.EdgeInsets.only(top: 15, left: 20),
                              //   child: pw.Row(
                              //     children: [
                              //       pw.Text(
                              //         "Total Building Size : ",
                              //         style: header4(),
                              //         textAlign: pw.TextAlign.center,
                              //       ),
                              //       pw.Text(
                              //         "${widget.objPropertyInfor!.totalsize ?? ''}",
                              //         style: body(),
                              //         textAlign: pw.TextAlign.center,
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(top: 5),
                                child: pw.Text(
                                  "Building Detail",
                                  style: header2(true),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ),
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(
                                    top: 5, left: 20), // Added top margin
                                child: pw.Row(
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.SizedBox(
                                      width: 150, // Adjust width as necessary
                                      child: pw.Text(
                                        "Type of Building",
                                        style: body(),
                                        textAlign: pw.TextAlign.left,
                                      ),
                                    ),
                                    pw.Text(
                                      ": ${widget.objPropertyInfor!.typeofbuilding ?? ''}",
                                      style: body(),
                                      textAlign: pw.TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(
                                    top: 5, left: 20), // Added top margin
                                child: pw.Row(
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.SizedBox(
                                      width: 150, // Adjust width as necessary
                                      child: pw.Text(
                                        "Age of Building",
                                        style: body(),
                                        textAlign: pw.TextAlign.left,
                                      ),
                                    ),
                                    pw.Text(
                                      ": ${widget.objPropertyInfor!.buildingage ?? ''}",
                                      style: body(),
                                      textAlign: pw.TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(
                                    top: 5, left: 20), // Added top margin
                                child: pw.Row(
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.SizedBox(
                                      width: 150, // Adjust width as necessary
                                      child: pw.Text(
                                        "Cost of Construction",
                                        style: body(),
                                        textAlign: pw.TextAlign.left,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(
                                    top: 5, left: 20), // Added top margin
                                child: pw.Row(
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.SizedBox(
                                      width: 150, // Adjust width as necessary
                                      child: pw.Text(
                                        "By owner",
                                        style: body(),
                                        textAlign: pw.TextAlign.left,
                                      ),
                                    ),
                                    pw.Text(
                                      ": ${widget.objPropertyInfor!.byowner ?? ''}",
                                      style: body(),
                                      textAlign: pw.TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(
                                    top: 5, left: 20), // Added top margin
                                child: pw.Row(
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.SizedBox(
                                      width: 150, // Adjust width as necessary
                                      child: pw.Text(
                                        "Metal Roof area",
                                        style: body(),
                                        textAlign: pw.TextAlign.left,
                                      ),
                                    ),
                                    pw.Text(
                                      ": ${widget.objPropertyInfor!.metalroof ?? ''}",
                                      style: body(),
                                      textAlign: pw.TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(
                                    top: 5, left: 20), // Added top margin
                                child: pw.Row(
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.SizedBox(
                                      width: 150, // Adjust width as necessary
                                      child: pw.Text(
                                        "Occupied or Vacant",
                                        style: body(),
                                        textAlign: pw.TextAlign.left,
                                      ),
                                    ),
                                    pw.Text(
                                      ": ${widget.objPropertyInfor!.occoupied ?? ''}",
                                      style: body(),
                                      textAlign: pw.TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(
                                    top: 5, left: 20), // Added top margin
                                child: pw.Row(
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.SizedBox(
                                      width: 150, // Adjust width as necessary
                                      child: pw.Text(
                                        "Disposability",
                                        style: body(),
                                        textAlign: pw.TextAlign.left,
                                      ),
                                    ),
                                    pw.Text(
                                      ": ${widget.objPropertyInfor!.disposability ?? ''}",
                                      style: body(),
                                      textAlign: pw.TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(
                                    top: 5, left: 20), // Added top margin
                                child: pw.Row(
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.SizedBox(
                                      width: 150, // Adjust width as necessary
                                      child: pw.Text(
                                        "Quality given as a",
                                        style: body(),
                                        textAlign: pw.TextAlign.left,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(
                                    top: 5, left: 20), // Added top margin
                                child: pw.Row(
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.SizedBox(
                                      width: 150, // Adjust width as necessary
                                      child: pw.Text(
                                        "Percentage",
                                        style: body(),
                                        textAlign: pw.TextAlign.left,
                                      ),
                                    ),
                                    pw.Text(
                                      ": ${widget.objPropertyInfor!.percentage ?? ''}%",
                                      style: body(),
                                      textAlign: pw.TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(
                                    top: 5, left: 20), // Added top margin
                                child: pw.Row(
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.SizedBox(
                                      width: 150, // Adjust width as necessary
                                      child: pw.Text(
                                        "Type of building",
                                        style: body(),
                                        textAlign: pw.TextAlign.left,
                                      ),
                                    ),
                                    pw.Text(
                                      ": [${widget.objPropertyInfor!.typeofbuilding ?? ''}]",
                                      style: body(),
                                      textAlign: pw.TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(
                                  top: 5,
                                ), // Add margin here
                                child: pw.Text(
                                  "Building Description",
                                  style: header2(true),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ),
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(
                                    top: 5, left: 20), // Add margin here
                                child: pw.Text(
                                  "The building (Flat) is generally constructed by concrete foundation and frame, finished with brick and cement. The table below, detail more the materials of the building.  ",
                                  style: body(),
                                  textAlign: pw.TextAlign.start,
                                ),
                              ),
                              pw.Expanded(
                                  child: pw.Container(
                                      margin: const pw.EdgeInsets.only(
                                          top: 5, bottom: 5),
                                      decoration: pw.BoxDecoration(
                                        border: pw.Border.all(
                                          color: PdfColors.black,
                                          width:
                                              2, // Adjust border width as needed
                                        ),
                                      ),
                                      child: pw.Row(children: [
                                        pw.Expanded(
                                            flex: 4,
                                            child: pw.Container(
                                                decoration: pw.BoxDecoration(
                                                  border: pw.Border.all(
                                                    color: PdfColors.black,
                                                    width:
                                                        2, // Adjust border width as needed
                                                  ),
                                                ),
                                                child: pw.Column(children: [
                                                  pw.Expanded(
                                                      child: pw.Container(
                                                          child: pw.Text(
                                                              "Sources of Materials",
                                                              style: header4()),
                                                          alignment: pw
                                                              .Alignment
                                                              .center)),
                                                  pw.Expanded(
                                                      child: pw.Container(
                                                    width: double.infinity,
                                                    decoration:
                                                        pw.BoxDecoration(
                                                      border: pw.Border.all(
                                                        color: PdfColors.black,
                                                        width:
                                                            2, // Adjust border width as needed
                                                      ),
                                                    ),
                                                    child: pw.Padding(
                                                      padding: const pw
                                                              .EdgeInsets.only(
                                                          left:
                                                              20), // Added top margin
                                                      child: pw.Row(
                                                        crossAxisAlignment: pw
                                                            .CrossAxisAlignment
                                                            .center,
                                                        mainAxisAlignment: pw
                                                            .MainAxisAlignment
                                                            .start,
                                                        children: [
                                                          pw.Text(
                                                            "Floor",
                                                            style:
                                                                body(), // Apply consistent styling
                                                            textAlign: pw
                                                                .TextAlign
                                                                .left, // Align text to the left
                                                          ),
                                                          pw.SizedBox(
                                                              width:
                                                                  50), // Add spacing between label and value
                                                          pw.Text(
                                                            " : ${widget.objPropertyInfor!.floor ?? ''}",
                                                            style:
                                                                body(), // Apply consistent styling
                                                            textAlign: pw
                                                                .TextAlign
                                                                .left, // Align text to the left
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                                  pw.Expanded(
                                                      child: pw.Container(
                                                    decoration:
                                                        pw.BoxDecoration(
                                                      border: pw.Border.all(
                                                        color: PdfColors.black,
                                                        width:
                                                            2, // Adjust border width as needed
                                                      ),
                                                    ),
                                                    child: pw.Padding(
                                                      padding: const pw
                                                              .EdgeInsets.only(
                                                          left:
                                                              20), // Added left margin
                                                      child: pw.Row(
                                                        crossAxisAlignment: pw
                                                            .CrossAxisAlignment
                                                            .center,
                                                        mainAxisAlignment: pw
                                                            .MainAxisAlignment
                                                            .start,
                                                        children: [
                                                          pw.Text(
                                                            "Door",
                                                            style:
                                                                body(), // Apply consistent styling
                                                            textAlign: pw
                                                                .TextAlign
                                                                .left, // Align text to the left
                                                          ),
                                                          pw.SizedBox(
                                                              width:
                                                                  50), // Add spacing between label and value
                                                          pw.Text(
                                                            " : ${widget.objPropertyInfor!.door ?? ''}",
                                                            style:
                                                                body(), // Apply consistent styling
                                                            textAlign: pw
                                                                .TextAlign
                                                                .left, // Align text to the left
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                                  pw.Expanded(
                                                      child: pw.Container(
                                                    child: pw.Padding(
                                                      padding: const pw
                                                              .EdgeInsets.only(
                                                          left:
                                                              20), // Added left margin
                                                      child: pw.Row(
                                                        crossAxisAlignment: pw
                                                            .CrossAxisAlignment
                                                            .center,
                                                        mainAxisAlignment: pw
                                                            .MainAxisAlignment
                                                            .start,
                                                        children: [
                                                          pw.Text(
                                                            "Window",
                                                            style:
                                                                body(), // Apply consistent styling
                                                            textAlign: pw
                                                                .TextAlign
                                                                .left, // Align text to the left
                                                          ),
                                                          pw.SizedBox(
                                                              width:
                                                                  35), // Add spacing between label and value
                                                          pw.Text(
                                                            " : ${widget.objPropertyInfor!.windows ?? ''}",
                                                            style:
                                                                body(), // Apply consistent styling
                                                            textAlign: pw
                                                                .TextAlign
                                                                .left, // Align text to the left
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                                  pw.Expanded(
                                                      child: pw.Container(
                                                    decoration:
                                                        pw.BoxDecoration(
                                                      border: pw.Border.all(
                                                        color: PdfColors.black,
                                                        width:
                                                            2, // Adjust border width as needed
                                                      ),
                                                    ),
                                                    child: pw.Padding(
                                                      padding: const pw
                                                              .EdgeInsets.only(
                                                          left:
                                                              20), // Added left margin
                                                      child: pw.Row(
                                                        crossAxisAlignment: pw
                                                            .CrossAxisAlignment
                                                            .center,
                                                        mainAxisAlignment: pw
                                                            .MainAxisAlignment
                                                            .start,
                                                        children: [
                                                          pw.Text(
                                                            "Stair",
                                                            style:
                                                                body(), // Apply consistent styling
                                                            textAlign: pw
                                                                .TextAlign
                                                                .left, // Align text to the left
                                                          ),
                                                          pw.SizedBox(
                                                              width:
                                                                  50), // Add spacing between label and value
                                                          pw.Text(
                                                            " : ${widget.objPropertyInfor!.stair ?? ''}",
                                                            style:
                                                                body(), // Apply consistent styling
                                                            textAlign: pw
                                                                .TextAlign
                                                                .left, // Align text to the left
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                                  pw.Expanded(
                                                      child: pw.Container(
                                                    child: pw.Padding(
                                                      padding: const pw
                                                              .EdgeInsets.only(
                                                          left:
                                                              20), // Added left margin
                                                      child: pw.Row(
                                                        crossAxisAlignment: pw
                                                            .CrossAxisAlignment
                                                            .center,
                                                        mainAxisAlignment: pw
                                                            .MainAxisAlignment
                                                            .start,
                                                        children: [
                                                          pw.Text(
                                                            "Roof",
                                                            style:
                                                                body(), // Apply consistent styling
                                                            textAlign: pw
                                                                .TextAlign
                                                                .left, // Align text to the left
                                                          ),
                                                          pw.SizedBox(
                                                              width:
                                                                  50), // Add spacing between label and value
                                                          pw.Text(
                                                            " : ${widget.objPropertyInfor!.roof ?? ''}",
                                                            style:
                                                                body(), // Apply consistent styling
                                                            textAlign: pw
                                                                .TextAlign
                                                                .left, // Align text to the left
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                                  pw.Expanded(
                                                      child: pw.Container(
                                                    decoration:
                                                        pw.BoxDecoration(
                                                      border: pw.Border.all(
                                                        color: PdfColors.black,
                                                        width:
                                                            2, // Adjust border width as needed
                                                      ),
                                                    ),
                                                    child: pw.Padding(
                                                      padding: const pw
                                                              .EdgeInsets.only(
                                                          left:
                                                              20), // Added left margin
                                                      child: pw.Row(
                                                        crossAxisAlignment: pw
                                                            .CrossAxisAlignment
                                                            .center,
                                                        mainAxisAlignment: pw
                                                            .MainAxisAlignment
                                                            .start,
                                                        children: [
                                                          pw.Text(
                                                            "Ceiling",
                                                            style:
                                                                body(), // Apply consistent styling
                                                            textAlign: pw
                                                                .TextAlign
                                                                .left, // Align text to the left
                                                          ),
                                                          pw.SizedBox(
                                                              width:
                                                                  40), // Add spacing between label and value
                                                          pw.Text(
                                                            " : ${widget.objPropertyInfor!.ceiling ?? ''}",
                                                            style:
                                                                body(), // Apply consistent styling
                                                            textAlign: pw
                                                                .TextAlign
                                                                .left, // Align text to the left
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                                  pw.Expanded(
                                                      child: pw.Container(
                                                    decoration:
                                                        pw.BoxDecoration(
                                                      border: pw.Border.all(
                                                        color: PdfColors.black,
                                                        width:
                                                            2, // Adjust border width as needed
                                                      ),
                                                    ),
                                                    child: pw.Padding(
                                                      padding: const pw
                                                              .EdgeInsets.only(
                                                          left:
                                                              20), // Added left margin
                                                      child: pw.Row(
                                                        crossAxisAlignment: pw
                                                            .CrossAxisAlignment
                                                            .center,
                                                        mainAxisAlignment: pw
                                                            .MainAxisAlignment
                                                            .start,
                                                        children: [
                                                          pw.Text(
                                                            "Wall",
                                                            style:
                                                                body(), // Apply consistent styling
                                                            textAlign: pw
                                                                .TextAlign
                                                                .left, // Align text to the left
                                                          ),
                                                          pw.SizedBox(
                                                              width:
                                                                  55), // Add spacing between label and value
                                                          pw.Text(
                                                            ": ${widget.objPropertyInfor!.wall ?? ''}",
                                                            style:
                                                                body(), // Apply consistent styling
                                                            textAlign: pw
                                                                .TextAlign
                                                                .left, // Align text to the left
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ))
                                                ]))),
                                        if (widget.objCover!.header !=
                                                "Property OFFICE SPACE VALUATION REPORT" &&
                                            widget.objCover!.header !=
                                                "Property CONDO REPORT") ...[
                                          pw.Expanded(
                                              flex: 3,
                                              child: pw.Container(
                                                  child: pw.Column(children: [
                                                pw.Expanded(
                                                    child: pw.Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            pw.BoxDecoration(
                                                          border: pw.Border.all(
                                                            color:
                                                                PdfColors.black,
                                                            width:
                                                                2, // Adjust border width as needed
                                                          ),
                                                        ),
                                                        child: pw.Text(
                                                            "Internal Description",
                                                            style: header4()),
                                                        alignment: pw
                                                            .Alignment.center)),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                        child: pw.Text(
                                                          "Floor/Story",
                                                        ),
                                                        alignment: pw
                                                            .Alignment.center)),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                        decoration:
                                                            pw.BoxDecoration(
                                                          border: pw.Border.all(
                                                            color:
                                                                PdfColors.black,
                                                            width:
                                                                2, // Adjust border width as needed
                                                          ),
                                                        ),
                                                        child: pw.Text(
                                                          "Bathroom",
                                                        ),
                                                        alignment: pw
                                                            .Alignment.center)),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                        decoration:
                                                            pw.BoxDecoration(
                                                          border: pw.Border.all(
                                                            color:
                                                                PdfColors.black,
                                                            width:
                                                                2, // Adjust border width as needed
                                                          ),
                                                        ),
                                                        child: pw.Text(
                                                          "Room",
                                                        ),
                                                        alignment: pw
                                                            .Alignment.center)),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                        child: pw.Container(
                                                            child: pw.Text(
                                                              "Kitchen",
                                                            ),
                                                            alignment: pw
                                                                .Alignment
                                                                .center))),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                        decoration:
                                                            pw.BoxDecoration(
                                                          border: pw.Border.all(
                                                            color:
                                                                PdfColors.black,
                                                            width:
                                                                2, // Adjust border width as needed
                                                          ),
                                                        ),
                                                        child: pw.Container(
                                                            child: pw.Text(
                                                              "Dining/Living Room",
                                                            ),
                                                            alignment: pw
                                                                .Alignment
                                                                .center))),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                        child: pw.Text(
                                                          "Storage Room",
                                                        ),
                                                        alignment: pw
                                                            .Alignment.center)),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                        decoration:
                                                            pw.BoxDecoration(
                                                          border: pw.Border.all(
                                                            color:
                                                                PdfColors.black,
                                                            width:
                                                                2, // Adjust border width as needed
                                                          ),
                                                        ),
                                                        child: pw.Text(
                                                          "Total Accommodation",
                                                        ),
                                                        alignment: pw
                                                            .Alignment.center))
                                              ]))),
                                          pw.Expanded(
                                              flex: 2,
                                              child: pw.Container(
                                                  child: pw.Column(children: [
                                                pw.Expanded(
                                                    child: pw.Container(
                                                        decoration:
                                                            pw.BoxDecoration(
                                                          border: pw.Border.all(
                                                            color:
                                                                PdfColors.black,
                                                            width:
                                                                2, // Adjust border width as needed
                                                          ),
                                                        ),
                                                        child: pw.Text(
                                                            "Quantity",
                                                            style: header4()),
                                                        alignment: pw
                                                            .Alignment.center)),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                        decoration:
                                                            pw.BoxDecoration(
                                                          border: pw.Border.all(
                                                            color:
                                                                PdfColors.black,
                                                            width:
                                                                2, // Adjust border width as needed
                                                          ),
                                                        ),
                                                        child: pw.Text(
                                                          "${widget.objPropertyInfor!.floornstory ?? ''}",
                                                        ),
                                                        alignment: pw
                                                            .Alignment.center)),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                        decoration:
                                                            pw.BoxDecoration(
                                                          border: pw.Border.all(
                                                            color:
                                                                PdfColors.black,
                                                            width:
                                                                2, // Adjust border width as needed
                                                          ),
                                                        ),
                                                        child: pw.Text(
                                                          "${widget.objPropertyInfor!.bathroom ?? ''}",
                                                        ),
                                                        alignment: pw
                                                            .Alignment.center)),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                        child: pw.Text(
                                                          "${widget.objPropertyInfor!.room ?? ''}",
                                                        ),
                                                        alignment: pw
                                                            .Alignment.center)),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                        decoration:
                                                            pw.BoxDecoration(
                                                          border: pw.Border.all(
                                                            color:
                                                                PdfColors.black,
                                                            width:
                                                                2, // Adjust border width as needed
                                                          ),
                                                        ),
                                                        child: pw.Text(
                                                          "${widget.objPropertyInfor!.kitchen ?? ''}",
                                                        ),
                                                        alignment: pw
                                                            .Alignment.center)),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                        decoration:
                                                            pw.BoxDecoration(
                                                          border: pw.Border.all(
                                                            color:
                                                                PdfColors.black,
                                                            width:
                                                                2, // Adjust border width as needed
                                                          ),
                                                        ),
                                                        child: pw.Text(
                                                          "${widget.objPropertyInfor!.diningnlivingroom ?? ''}",
                                                        ),
                                                        alignment: pw
                                                            .Alignment.center)),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                        decoration:
                                                            pw.BoxDecoration(
                                                          border: pw.Border.all(
                                                            color:
                                                                PdfColors.black,
                                                            width:
                                                                2, // Adjust border width as needed
                                                          ),
                                                        ),
                                                        child: pw.Text(
                                                          "${widget.objPropertyInfor!.store ?? ''}",
                                                        ),
                                                        alignment: pw
                                                            .Alignment.center)),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                        decoration:
                                                            pw.BoxDecoration(
                                                          border: pw.Border.all(
                                                            color:
                                                                PdfColors.black,
                                                            width:
                                                                2, // Adjust border width as needed
                                                          ),
                                                        ),
                                                        child: pw.Text(
                                                          "${widget.objPropertyInfor!.total ?? ''}",
                                                        ),
                                                        alignment: pw
                                                            .Alignment.center))
                                              ]))),
                                        ],
                                      ]))),
                              pw.Text(
                                "Utilities/Facilities Available",
                                style: header2(true),
                                textAlign: pw.TextAlign.center,
                              ),
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(
                                    top: 5, left: 20), // Added top margin
                                child: pw.Row(
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.SizedBox(
                                      width: 180, // Adjust width as necessary
                                      child: pw.Text(
                                        "Water",
                                        style: body(),
                                        textAlign: pw.TextAlign.left,
                                      ),
                                    ),
                                    pw.Text(
                                      ": ${widget.objPropertyInfor!.water ?? ''}",
                                      style: body(),
                                      textAlign: pw.TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(
                                    top: 5, left: 20), // Added top margin
                                child: pw.Row(
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.SizedBox(
                                      width: 180, // Adjust width as necessary
                                      child: pw.Text(
                                        "Electricity",
                                        style: body(),
                                        textAlign: pw.TextAlign.left,
                                      ),
                                    ),
                                    pw.Text(
                                      ": ${widget.objPropertyInfor!.electricity ?? ''}",
                                      style: body(),
                                      textAlign: pw.TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(
                                    top: 5, left: 20), // Added top margin
                                child: pw.Row(
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.SizedBox(
                                      width: 180, // Adjust width as necessary
                                      child: pw.Text(
                                        "Sewerage",
                                        style: body(),
                                        textAlign: pw.TextAlign.left,
                                      ),
                                    ),
                                    pw.Text(
                                      ": ${widget.objPropertyInfor!.severage ?? ''}",
                                      style: body(),
                                      textAlign: pw.TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(
                                    top: 5, left: 20), // Added top margin
                                child: pw.Row(
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.SizedBox(
                                      width: 180, // Adjust width as necessary
                                      child: pw.Text(
                                        "Telecommunications",
                                        style: body(),
                                        textAlign: pw.TextAlign.left,
                                      ),
                                    ),
                                    pw.Text(
                                      ": ${widget.objPropertyInfor!.telecom ?? ''}",
                                      style: body(),
                                      textAlign: pw.TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(
                                    top: 5, left: 20), // Added top margin
                                child: pw.Row(
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.SizedBox(
                                      width: 180, // Adjust width as necessary
                                      child: pw.Text(
                                        "Security",
                                        style: body(),
                                        textAlign: pw.TextAlign.left,
                                      ),
                                    ),
                                    pw.Text(
                                      ": ${widget.objPropertyInfor!.security ?? ''}",
                                      style: body(),
                                      textAlign: pw.TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(
                                    top: 5, left: 20), // Added top margin
                                child: pw.Row(
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.SizedBox(
                                      width: 180, // Adjust width as necessary
                                      child: pw.Text(
                                        "Garage/Parking",
                                        style: body(),
                                        textAlign: pw.TextAlign.left,
                                      ),
                                    ),
                                    pw.Text(
                                      ": ${widget.objPropertyInfor!.parking ?? ''}",
                                      style: body(),
                                      textAlign: pw.TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                              pw.SizedBox(height: 20)
                            ],
                          )),
                    ),
                  ),
                  pw.SizedBox(height: 20)
                ],
              ),
            );
          },
        ),
      );
    }

    //Page six
    pdf.addPage(
      pw.Page(
        pageTheme: pageTheme,
        build: (final context) {
          return pw.FullPage(
            ignoreMargins: true,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Container(
                  margin: const pw.EdgeInsets.only(
                      top: 25, right: 25), // Add margin here
                  child: pw.Text(
                    "©BY CAMBODIA ANGKOR REAL ESTATE CO., LTD",
                    style: pw.TextStyle(fontSize: 9, font: font),
                  ),
                ),
                pw.Expanded(
                  child: pw.Container(
                    margin: const pw.EdgeInsets.only(
                        top: 5, left: 40, right: 25, bottom: 25),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(
                        color: PdfColors.black,
                        width: 2, // Adjust border width as needed
                      ),
                    ),
                    child: pw.Center(
                        child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      // mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                top: 25, left: 15, right: 15),
                            child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.center,
                              children: [
                                pw.Text('Owner’s Identification Card',
                                    style: header2(true),
                                    textAlign: pw.TextAlign.start),
                                pw.SizedBox(height: 10),
                                pw.GridView(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 6,
                                    mainAxisSpacing: 6,
                                    childAspectRatio: 0.59,
                                    children: [
                                      pw.Image(
                                          pw.MemoryImage(widget.set_fidcard1),
                                          fit: pw.BoxFit.cover,
                                          width: 260,
                                          height: 200),
                                      pw.Image(
                                          pw.MemoryImage(widget.set_bidcard1),
                                          fit: pw.BoxFit.cover,
                                          width: 260,
                                          height: 200),
                                      // pw.Image(pw.MemoryImage(fidcard2),
                                      //     fit: pw.BoxFit.cover, width: 260),
                                      // pw.Image(pw.MemoryImage(bidcard2),
                                      //     fit: pw.BoxFit.cover, width: 260),
                                    ])
                              ],
                            ) // Add margin here
                            )
                      ],
                    )),
                  ),
                ),
                pw.SizedBox(height: 20)
              ],
            ),
          );
        },
      ),
    );

    //Page Seven
    pdf.addPage(
      pw.Page(
        pageTheme: pageTheme,
        build: (final context) {
          return pw.FullPage(
            ignoreMargins: true,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Container(
                  margin: const pw.EdgeInsets.only(
                      top: 25, right: 25), // Add margin here
                  child: pw.Text(
                    "©BY CAMBODIA ANGKOR REAL ESTATE CO., LTD",
                    style: pw.TextStyle(fontSize: 9, font: font),
                  ),
                ),
                pw.Expanded(
                  child: pw.Container(
                    margin: const pw.EdgeInsets.only(
                        top: 5, left: 40, right: 25, bottom: 25),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(
                        color: PdfColors.black,
                        width: 2, // Adjust border width as needed
                      ),
                    ),
                    child: pw.Center(
                        child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                top: 25, left: 15, right: 15),
                            child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.center,
                              children: [
                                if (widget.objCover!.header ==
                                    "Property [LAND AND BUILDING] VALUATION REPORT") ...[
                                  pw.Text(
                                      'Copy Land and Building Title Deed No: ${widget.objCover!.deeptitle}',
                                      style: header2(true),
                                      textAlign: pw.TextAlign.start),
                                ] else if (widget.objCover!.header ==
                                    "Property LAND VALUATION REPORT") ...[
                                  pw.Text(
                                      'Copy Land Title Deed No: ${widget.objCover!.deeptitle}',
                                      style: header2(true),
                                      textAlign: pw.TextAlign.start),
                                ] else if (widget.objCover!.header ==
                                    "Property OFFICE SPACE VALUATION REPORT") ...[
                                  pw.Text(
                                      'Copy Office Space Title Deed No: ${widget.objCover!.deeptitle}',
                                      style: header2(true),
                                      textAlign: pw.TextAlign.start),
                                ] else ...[
                                  pw.Text(
                                      'Copy Condo Title Deed No: ${widget.objCover!.deeptitle}',
                                      style: header2(true),
                                      textAlign: pw.TextAlign.start),
                                ],
                                pw.SizedBox(height: 10),
                                pw.GridView(
                                    crossAxisCount: 1,
                                    // crossAxisSpacing: 2,
                                    mainAxisSpacing: 25,
                                    childAspectRatio: 0.59,
                                    children: [
                                      pw.Image(
                                        pw.MemoryImage(ownerimg1),
                                      ),
                                      pw.Image(
                                        pw.MemoryImage(ownerimg2),
                                      ),
                                    ])
                              ],
                            ) // Add margin here
                            )
                      ],
                    )),
                  ),
                ),
                pw.SizedBox(height: 20)
              ],
            ),
          );
        },
      ),
    );

    //Page Eight
    pdf.addPage(pw.Page(
      pageTheme: pageTheme,
      build: (final context) {
        return pw.FullPage(
          ignoreMargins: true,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            children: [
              pw.Container(
                margin: const pw.EdgeInsets.only(
                    top: 25, right: 25), // Add margin here
                child: pw.Text(
                  "©BY CAMBODIA ANGKOR REAL ESTATE CO., LTD",
                  style: pw.TextStyle(fontSize: 9, font: font),
                ),
              ),
              pw.Expanded(
                child: pw.Container(
                  margin: const pw.EdgeInsets.only(
                      top: 5, left: 40, right: 25, bottom: 25),
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(
                      color: PdfColors.black,
                      width: 2, // Adjust border width as needed
                    ),
                  ),
                  child: pw.Center(
                      child: pw.Padding(
                          padding: const pw.EdgeInsets.only(
                              top: 25, left: 15, right: 15),
                          child: pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            children: [
                              if (widget.objCover!.header ==
                                  "Property [LAND AND BUILDING] VALUATION REPORT") ...[
                                pw.Text('Land and Building Layout',
                                    style: header2(true),
                                    textAlign: pw.TextAlign.start),
                              ] else if (widget.objCover!.header ==
                                  "Property LAND VALUATION REPORT") ...[
                                pw.Text('Land Layout',
                                    style: header2(true),
                                    textAlign: pw.TextAlign.start),
                              ] else if (widget.objCover!.header ==
                                  "Property OFFICE SPACE VALUATION REPORT") ...[
                                pw.Text('Office Space Layout',
                                    style: header2(true),
                                    textAlign: pw.TextAlign.start),
                              ] else ...[
                                pw.Text('Condo Layout',
                                    style: header2(true),
                                    textAlign: pw.TextAlign.start),
                              ],
                              pw.Expanded(
                                child: (layoutimg != null)
                                    ? pw.Container(
                                        margin: const pw.EdgeInsets.only(
                                            top: 10,
                                            left: 25,
                                            right: 25,
                                            bottom: 50),
                                        decoration: pw.BoxDecoration(
                                          image: pw.DecorationImage(
                                              image: pw.MemoryImage(layoutimg)),
                                          border: pw.Border.all(
                                            color: PdfColors.black,
                                            width: 2,
                                            // Adjust border width as needed
                                          ),
                                        ))
                                    : pw.Container(
                                        margin: const pw.EdgeInsets.only(
                                            top: 10,
                                            left: 25,
                                            right: 25,
                                            bottom: 50),
                                        decoration: pw.BoxDecoration(
                                          border: pw.Border.all(
                                            color: PdfColors.black,
                                            width: 2,
                                            // Adjust border width as needed
                                          ),
                                        )),
                              )
                            ],
                          ) // Add margin here
                          )),
                ),
              ),
              pw.SizedBox(height: 20)
            ],
          ),
        );
      },
    ));

    // Page Ningh
    pdf.addPage(pw.Page(
      pageTheme: pageTheme,
      build: (final context) {
        return pw.FullPage(
          ignoreMargins: true,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            children: [
              pw.Container(
                margin: const pw.EdgeInsets.only(
                    top: 25, right: 25), // Add margin here
                child: pw.Text(
                  "©BY CAMBODIA ANGKOR REAL ESTATE CO., LTD",
                  style: pw.TextStyle(fontSize: 9, font: font),
                ),
              ),
              pw.Expanded(
                child: pw.Container(
                  margin: const pw.EdgeInsets.only(
                      top: 5, left: 40, right: 25, bottom: 25),
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(
                      color: PdfColors.black,
                      width: 2, // Adjust border width as needed
                    ),
                  ),
                  child: pw.Center(
                      child: pw.Padding(
                          padding: const pw.EdgeInsets.only(
                              top: 15, left: 15, right: 15),
                          child: pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            children: [
                              pw.Text('Cambodia Map',
                                  style: header2(true),
                                  textAlign: pw.TextAlign.start),
                              pw.Expanded(
                                flex: 3,
                                child: pw.Container(
                                    margin: const pw.EdgeInsets.only(
                                        top: 5, left: 10, right: 10, bottom: 5),
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                        color: PdfColors.black,
                                        width: 2,
                                      ),
                                    ),
                                    child: pw.Column(children: [
                                      pw.Expanded(
                                        flex: 5,
                                        child: pw.Container(
                                          decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                color: PdfColors.black,
                                                width: 2,
                                              ),
                                              image: pw.DecorationImage(
                                                  image: pw.MemoryImage(
                                                      mapImage))),
                                        ),
                                      ),
                                      pw.Expanded(
                                          flex: 3,
                                          child: pw.Container(
                                              decoration: pw.BoxDecoration(
                                                border: pw.Border.all(
                                                  color: PdfColors.black,
                                                  width: 2,
                                                ),
                                              ),
                                              child: pw.Row(children: [
                                                pw.Expanded(
                                                    flex: 2,
                                                    child: pw.Text(
                                                        "Phnom Penh To All Province",
                                                        style: body1(),
                                                        textAlign: pw
                                                            .TextAlign.center)),
                                                pw.Expanded(
                                                    flex: 3,
                                                    child: pw.Container(
                                                        decoration:
                                                            pw.BoxDecoration(
                                                          border: pw.Border.all(
                                                            color:
                                                                PdfColors.black,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        child: pw.Column(
                                                            crossAxisAlignment: pw
                                                                .CrossAxisAlignment
                                                                .center,
                                                            children: [
                                                              pw.Padding(
                                                                padding: pw.EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            4,
                                                                        vertical:
                                                                            3),
                                                                child: pw.Row(
                                                                    mainAxisAlignment: pw
                                                                        .MainAxisAlignment
                                                                        .spaceBetween,
                                                                    children: [
                                                                      pw.Text(
                                                                          "1-Angkor Wat =",
                                                                          style:
                                                                              pw.TextStyle(fontSize: 9)),
                                                                      pw.Text(
                                                                          " 321Km",
                                                                          style:
                                                                              pw.TextStyle(fontSize: 9)),
                                                                    ]),
                                                              ),
                                                              pw.Padding(
                                                                padding: pw.EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            4,
                                                                        vertical:
                                                                            3),
                                                                child: pw.Row(
                                                                    mainAxisAlignment: pw
                                                                        .MainAxisAlignment
                                                                        .spaceBetween,
                                                                    children: [
                                                                      pw.Text(
                                                                          "2-Siem Reap =",
                                                                          style:
                                                                              pw.TextStyle(fontSize: 9)),
                                                                      pw.Text(
                                                                          " 314Km",
                                                                          style:
                                                                              pw.TextStyle(fontSize: 9)),
                                                                    ]),
                                                              ),
                                                              pw.Padding(
                                                                padding: pw.EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            4,
                                                                        vertical:
                                                                            3),
                                                                child: pw.Row(
                                                                    mainAxisAlignment: pw
                                                                        .MainAxisAlignment
                                                                        .spaceBetween,
                                                                    children: [
                                                                      pw.Text(
                                                                          "3-Kirirum =",
                                                                          style:
                                                                              pw.TextStyle(fontSize: 9)),
                                                                      pw.Text(
                                                                          " 117Km",
                                                                          style:
                                                                              pw.TextStyle(fontSize: 9)),
                                                                    ]),
                                                              ),
                                                              pw.Padding(
                                                                padding: pw.EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            4,
                                                                        vertical:
                                                                            3),
                                                                child: pw.Row(
                                                                    mainAxisAlignment: pw
                                                                        .MainAxisAlignment
                                                                        .spaceBetween,
                                                                    children: [
                                                                      pw.Text(
                                                                          "4-Kampot =",
                                                                          style:
                                                                              pw.TextStyle(fontSize: 9)),
                                                                      pw.Text(
                                                                          " 148Km",
                                                                          style:
                                                                              pw.TextStyle(fontSize: 9)),
                                                                    ]),
                                                              ),
                                                              pw.Padding(
                                                                padding: pw.EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            4,
                                                                        vertical:
                                                                            3),
                                                                child: pw.Row(
                                                                    mainAxisAlignment: pw
                                                                        .MainAxisAlignment
                                                                        .spaceBetween,
                                                                    children: [
                                                                      pw.Text(
                                                                          "5-Krong Kep =",
                                                                          style:
                                                                              pw.TextStyle(fontSize: 9)),
                                                                      pw.Text(
                                                                          " 174Km",
                                                                          style:
                                                                              pw.TextStyle(fontSize: 9)),
                                                                    ]),
                                                              ),
                                                              pw.Padding(
                                                                padding: pw.EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            4,
                                                                        vertical:
                                                                            3),
                                                                child: pw.Row(
                                                                    mainAxisAlignment: pw
                                                                        .MainAxisAlignment
                                                                        .spaceBetween,
                                                                    children: [
                                                                      pw.Text(
                                                                          "6-Sihanoukville =",
                                                                          style:
                                                                              pw.TextStyle(fontSize: 9)),
                                                                      pw.Text(
                                                                          " 230Km",
                                                                          style:
                                                                              pw.TextStyle(fontSize: 9)),
                                                                    ]),
                                                              ),
                                                              pw.Padding(
                                                                padding: pw.EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            4,
                                                                        vertical:
                                                                            3),
                                                                child: pw.Row(
                                                                    mainAxisAlignment: pw
                                                                        .MainAxisAlignment
                                                                        .spaceBetween,
                                                                    children: [
                                                                      pw.Text(
                                                                          "7-Kampong Chhnang =",
                                                                          style:
                                                                              pw.TextStyle(fontSize: 9)),
                                                                      pw.Text(
                                                                          " 91Km",
                                                                          style:
                                                                              pw.TextStyle(fontSize: 9)),
                                                                    ]),
                                                              ),
                                                              pw.Padding(
                                                                padding: pw.EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            4,
                                                                        vertical:
                                                                            3),
                                                                child: pw.Row(
                                                                    mainAxisAlignment: pw
                                                                        .MainAxisAlignment
                                                                        .spaceBetween,
                                                                    children: [
                                                                      pw.Text(
                                                                          "8-Pursat =",
                                                                          style:
                                                                              pw.TextStyle(fontSize: 9)),
                                                                      pw.Text(
                                                                          " 189Km",
                                                                          style:
                                                                              pw.TextStyle(fontSize: 9)),
                                                                    ]),
                                                              ),
                                                              pw.Padding(
                                                                padding: pw.EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            4,
                                                                        vertical:
                                                                            3),
                                                                child: pw.Row(
                                                                    mainAxisAlignment: pw
                                                                        .MainAxisAlignment
                                                                        .spaceBetween,
                                                                    children: [
                                                                      pw.Text(
                                                                          "9-Battambang =",
                                                                          style:
                                                                              pw.TextStyle(fontSize: 9)),
                                                                      pw.Text(
                                                                          " 291Km",
                                                                          style:
                                                                              pw.TextStyle(fontSize: 9)),
                                                                    ]),
                                                              ),
                                                            ]))),
                                                pw.Expanded(
                                                    flex: 3,
                                                    child: pw.Container(
                                                        decoration:
                                                            pw.BoxDecoration(
                                                          border: pw.Border.all(
                                                            color:
                                                                PdfColors.black,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        child: pw.Column(
                                                          crossAxisAlignment: pw
                                                              .CrossAxisAlignment
                                                              .center,
                                                          children: [
                                                            pw.Padding(
                                                              padding: pw.EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          4,
                                                                      vertical:
                                                                          3),
                                                              child: pw.Row(
                                                                mainAxisAlignment: pw
                                                                    .MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  pw.Text(
                                                                      "10-Pailin =",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                  pw.Text(
                                                                      " 371Km",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                ],
                                                              ),
                                                            ),
                                                            pw.Padding(
                                                              padding: pw.EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          4,
                                                                      vertical:
                                                                          3),
                                                              child: pw.Row(
                                                                mainAxisAlignment: pw
                                                                    .MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  pw.Text(
                                                                      "11-Banteay Meanchey =",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                  pw.Text(
                                                                      " 359Km",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                ],
                                                              ),
                                                            ),
                                                            pw.Padding(
                                                              padding: pw.EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          4,
                                                                      vertical:
                                                                          3),
                                                              child: pw.Row(
                                                                mainAxisAlignment: pw
                                                                    .MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  pw.Text(
                                                                      "12-Bokor =",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                  pw.Text(
                                                                      " 189Km",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                ],
                                                              ),
                                                            ),
                                                            pw.Padding(
                                                              padding: pw.EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          4,
                                                                      vertical:
                                                                          3),
                                                              child: pw.Row(
                                                                mainAxisAlignment: pw
                                                                    .MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  pw.Text(
                                                                      "13-Kampong Cham =",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                  pw.Text(
                                                                      " 124Km",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                ],
                                                              ),
                                                            ),
                                                            pw.Padding(
                                                              padding: pw.EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          4,
                                                                      vertical:
                                                                          3),
                                                              child: pw.Row(
                                                                mainAxisAlignment: pw
                                                                    .MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  pw.Text(
                                                                      "14-Kampong Thom =",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                  pw.Text(
                                                                      " 168Km",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                ],
                                                              ),
                                                            ),
                                                            pw.Padding(
                                                              padding: pw.EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          4,
                                                                      vertical:
                                                                          3),
                                                              child: pw.Row(
                                                                mainAxisAlignment: pw
                                                                    .MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  pw.Text(
                                                                      "15-Prey Veng =",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                  pw.Text(
                                                                      " 90Km",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                ],
                                                              ),
                                                            ),
                                                            pw.Padding(
                                                              padding: pw.EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          4,
                                                                      vertical:
                                                                          3),
                                                              child: pw.Row(
                                                                mainAxisAlignment: pw
                                                                    .MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  pw.Text(
                                                                      "16-Svay Rieng =",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                  pw.Text(
                                                                      " 122Km",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                ],
                                                              ),
                                                            ),
                                                            pw.Padding(
                                                              padding: pw.EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          4,
                                                                      vertical:
                                                                          3),
                                                              child: pw.Row(
                                                                mainAxisAlignment: pw
                                                                    .MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  pw.Text(
                                                                      "17-Takeo =",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                  pw.Text(
                                                                      " 78Km",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                ],
                                                              ),
                                                            ),
                                                            pw.Padding(
                                                              padding: pw.EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          4,
                                                                      vertical:
                                                                          3),
                                                              child: pw.Row(
                                                                mainAxisAlignment: pw
                                                                    .MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  pw.Text(
                                                                      "18-Kandal =",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                  pw.Text(
                                                                      " 11Km",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ))),
                                                pw.Expanded(
                                                    flex: 3,
                                                    child: pw.Container(
                                                        decoration:
                                                            pw.BoxDecoration(
                                                          border: pw.Border.all(
                                                            color:
                                                                PdfColors.black,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        child: pw.Column(
                                                          crossAxisAlignment: pw
                                                              .CrossAxisAlignment
                                                              .center,
                                                          children: [
                                                            pw.Padding(
                                                              padding: pw.EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          4,
                                                                      vertical:
                                                                          3),
                                                              child: pw.Row(
                                                                mainAxisAlignment: pw
                                                                    .MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  pw.Text(
                                                                      "19-Steong Treng =",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                  pw.Text(
                                                                      " 455Km",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                ],
                                                              ),
                                                            ),
                                                            pw.Padding(
                                                              padding: pw.EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          4,
                                                                      vertical:
                                                                          3),
                                                              child: pw.Row(
                                                                mainAxisAlignment: pw
                                                                    .MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  pw.Text(
                                                                      "20-Kampong Speu =",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                  pw.Text(
                                                                      " 48Km",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                ],
                                                              ),
                                                            ),
                                                            pw.Padding(
                                                              padding: pw.EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          4,
                                                                      vertical:
                                                                          3),
                                                              child: pw.Row(
                                                                mainAxisAlignment: pw
                                                                    .MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  pw.Text(
                                                                      "21-Kratie =",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                  pw.Text(
                                                                      " 315Km",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                ],
                                                              ),
                                                            ),
                                                            pw.Padding(
                                                              padding: pw.EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          4,
                                                                      vertical:
                                                                          3),
                                                              child: pw.Row(
                                                                mainAxisAlignment: pw
                                                                    .MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  pw.Text(
                                                                      "22-Mondolkiri =",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                  pw.Text(
                                                                      " 521Km",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                ],
                                                              ),
                                                            ),
                                                            pw.Padding(
                                                              padding: pw.EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          4,
                                                                      vertical:
                                                                          3),
                                                              child: pw.Row(
                                                                mainAxisAlignment: pw
                                                                    .MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  pw.Text(
                                                                      "23-Preah Vihear =",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                  pw.Text(
                                                                      " 294Km",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                ],
                                                              ),
                                                            ),
                                                            pw.Padding(
                                                              padding: pw.EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          4,
                                                                      vertical:
                                                                          3),
                                                              child: pw.Row(
                                                                mainAxisAlignment: pw
                                                                    .MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  pw.Text(
                                                                      "24-Ratanakiri =",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                  pw.Text(
                                                                      " 588Km",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                ],
                                                              ),
                                                            ),
                                                            pw.Padding(
                                                              padding: pw.EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          4,
                                                                      vertical:
                                                                          3),
                                                              child: pw.Row(
                                                                mainAxisAlignment: pw
                                                                    .MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  pw.Text(
                                                                      "25-Koh Kong =",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                  pw.Text(
                                                                      " 271Km",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                ],
                                                              ),
                                                            ),
                                                            pw.Padding(
                                                              padding: pw.EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          4,
                                                                      vertical:
                                                                          3),
                                                              child: pw.Row(
                                                                mainAxisAlignment: pw
                                                                    .MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  pw.Text(
                                                                      "26-Oddar Meanchey =",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                  pw.Text(
                                                                      " 460Km",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              9)),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        )))
                                              ])))
                                    ])),
                              ),
                              pw.Text('Location Map in Phnom Penh',
                                  style: header2(true),
                                  textAlign: pw.TextAlign.start),
                              pw.Expanded(
                                  flex: 2,
                                  child: pw.Container(
                                      height: double.minPositive,
                                      margin: const pw.EdgeInsets.only(
                                          top: 5,
                                          left: 10,
                                          right: 10,
                                          bottom: 20),
                                      decoration: pw.BoxDecoration(
                                          border: pw.Border.all(
                                            color: PdfColors.black,
                                            width: 2,
                                          ),
                                          image: pw.DecorationImage(
                                              image:
                                                  pw.MemoryImage(map1Image)))))
                            ],
                          ) // Add margin here
                          )),
                ),
              ),
              pw.SizedBox(height: 20)
            ],
          ),
        );
      },
    ));

    // Page ninght
    pdf.addPage(pw.Page(
      pageTheme: pageTheme,
      build: (final context) {
        return pw.FullPage(
          ignoreMargins: true,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            children: [
              pw.Container(
                margin: const pw.EdgeInsets.only(
                    top: 25, right: 25), // Add margin here
                child: pw.Text(
                  "©BY CAMBODIA ANGKOR REAL ESTATE CO., LTD",
                  style: pw.TextStyle(fontSize: 9, font: font),
                ),
              ),
              pw.Expanded(
                child: pw.Container(
                  margin: const pw.EdgeInsets.only(
                      top: 5, left: 40, right: 25, bottom: 25),
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(
                      color: PdfColors.black,
                      width: 2, // Adjust border width as needed
                    ),
                  ),
                  child: pw.Center(
                      child: pw.Padding(
                          padding: const pw.EdgeInsets.only(
                              top: 15, left: 15, right: 15),
                          child: pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            children: [
                              pw.Text(
                                  'Aerial Photograph of Phnom Penh Location',
                                  style: header2(true),
                                  textAlign: pw.TextAlign.start),
                              pw.Expanded(
                                flex: 2,
                                child: pw.Container(
                                    margin: const pw.EdgeInsets.only(
                                        top: 5, left: 10, right: 10, bottom: 5),
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                        color: PdfColors.black,
                                        width: 2,
                                      ),
                                    ),
                                    child: pw.Column(children: [
                                      pw.Expanded(
                                        flex: 5,
                                        child: pw.Container(
                                          decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                color: PdfColors.black,
                                                width: 2,
                                              ),
                                              image: pw.DecorationImage(
                                                  image: pw.MemoryImage(
                                                      map2Image))),
                                        ),
                                      ),
                                    ])),
                              ),
                              pw.Text('Map Sketch',
                                  style: header2(true),
                                  textAlign: pw.TextAlign.start),
                              pw.Expanded(
                                  flex: 2,
                                  child: pw.Container(
                                      height: double.minPositive,
                                      margin: const pw.EdgeInsets.only(
                                          top: 5,
                                          left: 10,
                                          right: 10,
                                          bottom: 20),
                                      decoration: pw.BoxDecoration(
                                          border: pw.Border.all(
                                            color: PdfColors.black,
                                            width: 2,
                                          ),
                                          image: pw.DecorationImage(
                                              image:
                                                  pw.MemoryImage(map3Image)))))
                            ],
                          ) // Add margin here
                          )),
                ),
              ),
              pw.SizedBox(height: 20)
            ],
          ),
        );
      },
    ));

    //Page Ten
    pdf.addPage(pw.Page(
      pageTheme: pageTheme,
      build: (final context) {
        return pw.FullPage(
          ignoreMargins: true,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            children: [
              pw.Container(
                margin: const pw.EdgeInsets.only(
                    top: 25, right: 25), // Add margin here
                child: pw.Text(
                  "©BY CAMBODIA ANGKOR REAL ESTATE CO., LTD",
                  style: pw.TextStyle(fontSize: 9, font: font),
                ),
              ),
              pw.Expanded(
                flex: 6,
                child: pw.Container(
                  margin: const pw.EdgeInsets.only(
                      top: 10, left: 40, right: 25, bottom: 25),
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(
                      color: PdfColors.black,
                      width: 2, // Adjust border width as needed
                    ),
                  ),
                  child: pw.Center(
                      child: pw.Padding(
                          padding: const pw.EdgeInsets.only(
                              top: 10, left: 20, right: 20),
                          child: pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.start,
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            children: [
                              pw.Text(
                                  'Aerial Photograph of Phnom Penh Location',
                                  style: header2(true),
                                  textAlign: pw.TextAlign.start),
                              if (widget.objCover!.header ==
                                  "Property [LAND AND BUILDING] VALUATION REPORT") ...[
                                pw.Text('I. Photo front view of the Property',
                                    style: header2(true),
                                    textAlign: pw.TextAlign.start),
                              ] else if (widget.objCover!.header ==
                                  "Property LAND VALUATION REPORT") ...[
                                pw.Text('I. Photo front view of the Land',
                                    style: header2(true),
                                    textAlign: pw.TextAlign.start),
                              ] else if (widget.objCover!.header ==
                                  "Property OFFICE SPACE VALUATION REPORT") ...[
                                pw.Text(
                                    'I. Photo front view of the Office Space',
                                    style: header2(true),
                                    textAlign: pw.TextAlign.start),
                              ] else ...[
                                pw.Text('I. Photo front view of the Condo',
                                    style: header2(true),
                                    textAlign: pw.TextAlign.start),
                              ],
                              pw.Expanded(
                                flex: 2,
                                child: pw.Container(
                                  margin: const pw.EdgeInsets.only(
                                    top: 3,
                                  ),
                                  decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                        color: PdfColors.black,
                                        width: 2,
                                      ),
                                      image: pw.DecorationImage(
                                          image: pw.MemoryImage(
                                              widget.frontviewimage))),
                                ),
                              ),
                              if (widget.objCover!.header ==
                                  "Property [LAND AND BUILDING] VALUATION REPORT") ...[
                                pw.Text(
                                    'II. Photos inside view of the Property',
                                    style: header3(),
                                    textAlign: pw.TextAlign.start),
                                pw.Text('1.Photos view of the Property',
                                    style: header3(),
                                    textAlign: pw.TextAlign.start),
                              ] else if (widget.objCover!.header ==
                                  "Property LAND VALUATION REPORT") ...[
                                pw.Text('II. Photos inside view of the Land',
                                    style: header3(),
                                    textAlign: pw.TextAlign.start),
                                pw.Text('1.Photos view of the Land',
                                    style: header3(),
                                    textAlign: pw.TextAlign.start),
                              ] else if (widget.objCover!.header ==
                                  "Property OFFICE SPACE VALUATION REPORT") ...[
                                pw.Text(
                                    'II. Photos inside view of the Office Space',
                                    style: header3(),
                                    textAlign: pw.TextAlign.start),
                                pw.Text('1.Photos view of the Office Space ',
                                    style: header3(),
                                    textAlign: pw.TextAlign.start),
                              ] else ...[
                                pw.Text('II. Photos inside view of the Condo',
                                    style: header3(),
                                    textAlign: pw.TextAlign.start),
                                pw.Text('1.Photos view of the Condo ',
                                    style: header3(),
                                    textAlign: pw.TextAlign.start),
                              ],
                              if (widget.list_forviewproperty!.length >= 1 ||
                                  widget.list_forviewland!.length >= 1) ...[
                                if (widget.objCover!.header ==
                                    "Property [LAND AND BUILDING] VALUATION REPORT") ...[
                                  pw.Expanded(
                                    flex: 2,
                                    child: pw.GridView(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 2,
                                        mainAxisSpacing: 4,
                                        children: [
                                          for (var photo in widget
                                              .list_forviewproperty!) ...[
                                            pw.Image(pw.MemoryImage(photo),
                                                height: 150,
                                                width: 700,
                                                fit: pw.BoxFit.contain),
                                          ]
                                        ]),
                                  ),
                                ] else ...[
                                  pw.Expanded(
                                    flex: 2,
                                    child: pw.GridView(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 2,
                                        mainAxisSpacing: 4,
                                        children: [
                                          for (var photo
                                              in widget.list_forviewland!) ...[
                                            pw.Image(pw.MemoryImage(photo),
                                                height: 150,
                                                width: 700,
                                                fit: pw.BoxFit.contain),
                                          ]
                                        ]),
                                  ),
                                ],
                              ],
                              pw.SizedBox(height: 20)
                            ],
                          ) // Add margin here
                          )),
                ),
              ),
            ],
          ),
        );
      },
    ));

// Page Twell
    if (widget.objCover!.header ==
        "Property [LAND AND BUILDING] VALUATION REPORT") {
      pdf.addPage(pw.Page(
        pageTheme: pageTheme,
        build: (final context) {
          return pw.FullPage(
            ignoreMargins: true,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Container(
                  margin: const pw.EdgeInsets.only(
                      top: 25, right: 25), // Add margin here
                  child: pw.Text(
                    "©BY CAMBODIA ANGKOR REAL ESTATE CO., LTD",
                    style: pw.TextStyle(fontSize: 9, font: font),
                  ),
                ),
                pw.Expanded(
                  flex: 5,
                  child: pw.Container(
                    margin: const pw.EdgeInsets.only(
                        top: 10, left: 40, right: 25, bottom: 25),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(
                        color: PdfColors.black,
                        width: 2, // Adjust border width as needed
                      ),
                    ),
                    child: pw.Center(
                        child: pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                top: 10, left: 20, right: 20),
                            child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.center,
                              children: [
                                if (widget.objCover!.header ==
                                    "Property [LAND AND BUILDING] VALUATION REPORT") ...[
                                  pw.Text(
                                      'II. Photos inside view of the Property',
                                      style: header3(),
                                      textAlign: pw.TextAlign.start),
                                  pw.Text(
                                      '2.Photos view inside of the Property',
                                      style: header3(),
                                      textAlign: pw.TextAlign.start),
                                ] else if (widget.objCover!.header ==
                                    "Property LAND VALUATION REPORT") ...[
                                  pw.Text('II. Photos inside view of the Land',
                                      style: header3(),
                                      textAlign: pw.TextAlign.start),
                                  pw.Text('2.Photos view inside of the Land',
                                      style: header3(),
                                      textAlign: pw.TextAlign.start),
                                ] else if (widget.objCover!.header ==
                                    "Property OFFICE SPACE VALUATION REPORT") ...[
                                  pw.Text(
                                      'II. Photos inside view of the Office Space',
                                      style: header3(),
                                      textAlign: pw.TextAlign.start),
                                  pw.Text(
                                      '2.Photos view inside of the Office Space ',
                                      style: header3(),
                                      textAlign: pw.TextAlign.start),
                                ] else ...[
                                  pw.Text('II. Photos inside view of the Condo',
                                      style: header3(),
                                      textAlign: pw.TextAlign.start),
                                  pw.Text('2.Photos view inside of the Condo ',
                                      style: header3(),
                                      textAlign: pw.TextAlign.start),
                                ],
                                if (widget.list_forinsideproperty!.length >= 1)
                                  pw.Expanded(
                                    flex: 2,
                                    child: pw.GridView(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 2,
                                        mainAxisSpacing: 4,
                                        children: [
                                          for (var photo in widget
                                              .list_forinsideproperty!) ...[
                                            pw.Image(pw.MemoryImage(photo),
                                                height: 150,
                                                width: 700,
                                                fit: pw.BoxFit.contain),
                                          ]
                                        ]),
                                  ),
                                pw.SizedBox(height: 20)
                              ],
                            ) // Add margin here
                            )),
                  ),
                ),
              ],
            ),
          );
        },
      ));
    }

    //Page Twenty
    pdf.addPage(pw.Page(
      pageTheme: pageTheme,
      build: (final context) {
        return pw.FullPage(
          ignoreMargins: true,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            children: [
              pw.Container(
                margin: const pw.EdgeInsets.only(
                  top: 25,
                  right: 25,
                ), // Add margin here
                child: pw.Text(
                  "©BY CAMBODIA ANGKOR REAL ESTATE CO., LTD",
                  style: pw.TextStyle(fontSize: 9, font: font),
                ),
              ),
              pw.Expanded(
                flex: 6,
                child: pw.Container(
                  margin: const pw.EdgeInsets.only(
                      top: 10, left: 40, right: 25, bottom: 25),
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(
                      color: PdfColors.black,
                      width: 2, // Adjust border width as needed
                    ),
                  ),
                  child: pw.Center(
                      child: pw.Padding(
                          padding: const pw.EdgeInsets.only(
                              top: 10, left: 40, right: 40, bottom: 10),
                          child: pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.start,
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            children: [
                              if (widget.objCover!.header ==
                                  "Property [LAND AND BUILDING] VALUATION REPORT") ...[
                                pw.Text(
                                    'III. Photos view of Access Road to the Property',
                                    style: header3(),
                                    textAlign: pw.TextAlign.start),
                              ] else if (widget.objCover!.header ==
                                  "Property LAND VALUATION REPORT") ...[
                                pw.Text(
                                    'III. Photos view of Access Road to the Land',
                                    style: header3(),
                                    textAlign: pw.TextAlign.start),
                              ] else if (widget.objCover!.header ==
                                  "Property OFFICE SPACE VALUATION REPORT") ...[
                                pw.Text(
                                    'III. Photos view of Access Road to the Office Space',
                                    style: header3(),
                                    textAlign: pw.TextAlign.start),
                              ] else ...[
                                pw.Text(
                                    'III. Photos view of Access Road to the Condo',
                                    style: header3(),
                                    textAlign: pw.TextAlign.start),
                              ],
                              pw.Expanded(
                                flex: 2,
                                child: pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.spaceBetween,
                                    children: [
                                      pw.Image(
                                          pw.MemoryImage(widget.roadviewimage1),
                                          height: 150,
                                          width: 700,
                                          fit: pw.BoxFit.contain),
                                      pw.Image(
                                          pw.MemoryImage(widget.roadviewimage2),
                                          height: 150,
                                          width: 700,
                                          fit: pw.BoxFit.contain),
                                    ]),
                              ),
                              if (widget.objCover!.header ==
                                  "Property [LAND AND BUILDING] VALUATION REPORT") ...[
                                pw.Text(
                                    'IV. Photos surroundings view of the Property',
                                    style: header3(),
                                    textAlign: pw.TextAlign.start),
                              ] else if (widget.objCover!.header ==
                                  "Property LAND VALUATION REPORT") ...[
                                pw.Text(
                                    'IV. Photos surroundings view of the Land',
                                    style: header3(),
                                    textAlign: pw.TextAlign.start),
                              ] else if (widget.objCover!.header ==
                                  "Property OFFICE SPACE VALUATION REPORT") ...[
                                pw.Text(
                                    'IV. Photos surroundings view of the Office Space',
                                    style: header3(),
                                    textAlign: pw.TextAlign.start),
                              ] else ...[
                                pw.Text(
                                    'IV. Photos surroundings view of the Condo',
                                    style: header3(),
                                    textAlign: pw.TextAlign.start),
                              ],
                              pw.SizedBox(height: 10),
                              pw.Expanded(
                                  flex: 2,
                                  child: pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.spaceBetween,
                                      children: [
                                        pw.Column(
                                            crossAxisAlignment:
                                                pw.CrossAxisAlignment.center,
                                            children: [
                                              pw.Image(
                                                  pw.MemoryImage(
                                                      widget.surroundin1),
                                                  height: 150,
                                                  width: 700,
                                                  fit: pw.BoxFit.contain),
                                              pw.SizedBox(height: 2),
                                              pw.Text(
                                                  '${widget.objPhotoDetail!.dessurroundin1}',
                                                  style: header3(),
                                                  textAlign:
                                                      pw.TextAlign.start),
                                            ]),
                                        pw.Column(
                                            crossAxisAlignment:
                                                pw.CrossAxisAlignment.center,
                                            children: [
                                              pw.Image(
                                                  pw.MemoryImage(
                                                      widget.surroundin2),
                                                  height: 150,
                                                  width: 700,
                                                  fit: pw.BoxFit.contain),
                                              pw.SizedBox(height: 2),
                                              pw.Text(
                                                  '${widget.objPhotoDetail!.dessurroundin2}',
                                                  style: header3(),
                                                  textAlign:
                                                      pw.TextAlign.start),
                                            ])
                                      ])),
                              pw.Expanded(
                                flex: 2,
                                child: pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.spaceBetween,
                                    children: [
                                      pw.Column(
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.center,
                                          children: [
                                            pw.Image(
                                                pw.MemoryImage(
                                                    widget.surroundin3),
                                                height: 150,
                                                width: 700,
                                                fit: pw.BoxFit.contain),
                                            pw.SizedBox(height: 2),
                                            pw.Text(
                                                '${widget.objPhotoDetail!.dessurroundin3}',
                                                style: header3(),
                                                textAlign: pw.TextAlign.start),
                                          ]),
                                      pw.Column(
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.center,
                                          children: [
                                            pw.Image(
                                                pw.MemoryImage(
                                                    widget.surroundin4),
                                                height: 150,
                                                width: 700,
                                                fit: pw.BoxFit.contain),
                                            pw.SizedBox(height: 2),
                                            pw.Text(
                                                '${widget.objPhotoDetail!.dessurroundin4}',
                                                style: header3(),
                                                textAlign: pw.TextAlign.start),
                                          ])
                                    ]),
                              ),
                              pw.Expanded(
                                flex: 2,
                                child: pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.spaceBetween,
                                    children: [
                                      pw.Column(
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.center,
                                          children: [
                                            pw.Image(
                                                pw.MemoryImage(
                                                    widget.surroundin5),
                                                height: 150,
                                                width: 700,
                                                fit: pw.BoxFit.contain),
                                            pw.SizedBox(height: 2),
                                            pw.Text(
                                                '${widget.objPhotoDetail!.dessurroundin5}',
                                                style: header3(),
                                                textAlign: pw.TextAlign.start),
                                          ]),
                                      pw.Column(
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.center,
                                          children: [
                                            pw.Image(
                                                pw.MemoryImage(
                                                    widget.surroundin6),
                                                height: 150,
                                                width: 700,
                                                fit: pw.BoxFit.contain),
                                            pw.SizedBox(height: 2),
                                            pw.Text(
                                                '${widget.objPhotoDetail!.dessurroundin6}',
                                                style: header3(),
                                                textAlign: pw.TextAlign.start),
                                          ])
                                    ]),
                              ),
                            ],
                          ) // Add margin here
                          )),
                ),
              ),
            ],
          ),
        );
      },
    ));

    //Page Thirty
    pdf.addPage(
      pw.Page(
        pageTheme: pageTheme,
        build: (final context) {
          return pw.FullPage(
            ignoreMargins: true,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Container(
                  margin: const pw.EdgeInsets.only(
                      top: 25, right: 25), // Add margin here
                  child: pw.Text(
                    "©BY CAMBODIA ANGKOR REAL ESTATE CO., LTD",
                    style: pw.TextStyle(fontSize: 9, font: font),
                  ),
                ),
                pw.Expanded(
                  child: pw.Container(
                    margin: const pw.EdgeInsets.only(
                        top: 5, left: 40, right: 25, bottom: 25),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(
                        color: PdfColors.black,
                        width: 2, // Adjust border width as needed
                      ),
                    ),
                    child: pw.Container(
                        padding: pw.EdgeInsets.only(left: 40, right: 20),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          // mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  top: 25, left: -20), // Add margin here
                              child: pw.Text(
                                "Inspection Officer’s Report",
                                style: header1(),
                                textAlign: pw.TextAlign.center,
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            pw.RichText(
                              text: pw.TextSpan(
                                text: 'The Subject Property ',
                                style: body1(), // Base style
                                children: [
                                  if (widget.objCover!.header ==
                                      "Property [LAND AND BUILDING] VALUATION REPORT") ...[
                                    pw.TextSpan(
                                      text: ' [Land and Building] ',
                                      style: header2(true),
                                    ),
                                  ] else if (widget.objCover!.header ==
                                      "Property LAND VALUATION REPORT") ...[
                                    pw.TextSpan(
                                      text: ' [Land] ',
                                      style: header2(true),
                                    ),
                                  ] else if (widget.objCover!.header ==
                                      "Property OFFICE SPACE VALUATION REPORT") ...[
                                    pw.TextSpan(
                                      text: ' [Office Space] ',
                                      style: header2(true),
                                    ),
                                  ] else ...[
                                    pw.TextSpan(
                                      text: ' [Condo] ',
                                      style: header2(true),
                                    ),
                                  ],
                                  pw.TextSpan(
                                    text:
                                        'was inspected by an appraisal team from Cambodia Angkor Real Estate Co., Ltd. on ',
                                    style: body1(),
                                  ),
                                  pw.TextSpan(
                                    text: '${widget.objCover!.date}. ',
                                    style: body1(),
                                  ),
                                  pw.TextSpan(
                                    text:
                                        'This report has been compiled directly from information gathered during the site inspection.',
                                    style: body1(),
                                  ),
                                ],
                              ),
                            ),
                            pw.Text("\nCondition of property",
                                style: header3()),
                            pw.RichText(
                              text: pw.TextSpan(
                                text: '${widget.objOfficerReport!.conditions}',
                                style: body1(), // Base style
                              ),
                            ),
                            pw.Text("\nImmediate Environment",
                                style: header3()),
                            pw.Text("${widget.objOfficerReport!.immediate}",
                                style: body1()),
                            pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  top: 25, left: -20), // Add margin here
                              child: pw.Text(
                                "Additional Comments (SWOT Analysis",
                                style: header1(),
                                textAlign: pw.TextAlign.center,
                              ),
                            ),
                            pw.RichText(
                              text: pw.TextSpan(
                                text:
                                    'The additional comments of Cambodia Angkor Real Estate provide main information   of the subject property as below:',
                                style: body1(), // Base style
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            pw.Container(
                                decoration:
                                    pw.BoxDecoration(border: pw.Border.all()),
                                width: double.infinity,
                                child: pw.Column(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.Row(
                                        mainAxisAlignment:
                                            pw.MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            pw.CrossAxisAlignment.center,
                                        children: [
                                          pw.Expanded(
                                              flex: 5,
                                              child: pw.Container(
                                                  height: 25,
                                                  decoration: pw.BoxDecoration(
                                                      border: pw.Border.all()),
                                                  child: pw.Center(
                                                      child: pw.Text("Strenght",
                                                          style: pw.TextStyle(
                                                              fontSize: 15))))),
                                          pw.Expanded(
                                              flex: 5,
                                              child: pw.Container(
                                                  height: 25,
                                                  decoration: pw.BoxDecoration(
                                                      border: pw.Border.all()),
                                                  child: pw.Center(
                                                      child: pw.Text("Waekness",
                                                          style: pw.TextStyle(
                                                              fontSize: 15)))))
                                        ]),
                                    pw.Row(
                                        mainAxisAlignment:
                                            pw.MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            pw.CrossAxisAlignment.start,
                                        children: [
                                          pw.Expanded(
                                              flex: 5,
                                              child: pw.Container(
                                                  padding: pw.EdgeInsets.only(
                                                      left: 10,
                                                      top: 5,
                                                      right: 10,
                                                      bottom: 5),
                                                  decoration: pw.BoxDecoration(
                                                      border: pw.Border(
                                                    left:
                                                        pw.BorderSide(width: 1),
                                                    right:
                                                        pw.BorderSide(width: 1),
                                                    top:
                                                        pw.BorderSide(width: 1),
                                                  )),
                                                  child: pw.Text(
                                                      "${widget.objOfficerReport!.strength}",
                                                      style: pw.TextStyle(
                                                          fontSize: 15),
                                                      textAlign:
                                                          pw.TextAlign.start))),
                                          pw.Expanded(
                                              flex: 5,
                                              child: pw.Container(
                                                  padding: pw.EdgeInsets.only(
                                                      left: 10,
                                                      top: 5,
                                                      right: 10,
                                                      bottom: 5),
                                                  decoration: pw.BoxDecoration(
                                                      border: pw.Border(
                                                    left:
                                                        pw.BorderSide(width: 1),
                                                    right:
                                                        pw.BorderSide(width: 1),
                                                    top:
                                                        pw.BorderSide(width: 1),
                                                  )),
                                                  child: pw.Text(
                                                      "${widget.objOfficerReport!.weakness}",
                                                      style: pw.TextStyle(
                                                          fontSize: 15),
                                                      textAlign:
                                                          pw.TextAlign.start)))
                                        ]),
                                    pw.Row(
                                        mainAxisAlignment:
                                            pw.MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            pw.CrossAxisAlignment.center,
                                        children: [
                                          pw.Expanded(
                                              flex: 5,
                                              child: pw.Container(
                                                  height: 25,
                                                  decoration: pw.BoxDecoration(
                                                      border: pw.Border.all()),
                                                  child: pw.Center(
                                                      child: pw.Text(
                                                          "Opportunities",
                                                          style: pw.TextStyle(
                                                              fontSize: 15))))),
                                          pw.Expanded(
                                              flex: 5,
                                              child: pw.Container(
                                                  height: 25,
                                                  decoration: pw.BoxDecoration(
                                                      border: pw.Border.all()),
                                                  child: pw.Center(
                                                      child: pw.Text("Threats",
                                                          style: pw.TextStyle(
                                                              fontSize: 15)))))
                                        ]),
                                    pw.Row(
                                        mainAxisAlignment:
                                            pw.MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            pw.CrossAxisAlignment.start,
                                        children: [
                                          pw.Expanded(
                                              flex: 5,
                                              child: pw.Container(
                                                  padding: pw.EdgeInsets.only(
                                                      left: 10,
                                                      top: 5,
                                                      right: 10,
                                                      bottom: 5),
                                                  decoration: pw.BoxDecoration(
                                                      border: pw.Border(
                                                    left:
                                                        pw.BorderSide(width: 1),
                                                    right:
                                                        pw.BorderSide(width: 1),
                                                    top:
                                                        pw.BorderSide(width: 1),
                                                  )),
                                                  child: pw.Text(
                                                      "${widget.objOfficerReport!.opportunity}",
                                                      style: pw.TextStyle(
                                                          fontSize: 15),
                                                      textAlign:
                                                          pw.TextAlign.start))),
                                          pw.Expanded(
                                              flex: 5,
                                              child: pw.Container(
                                                  padding: pw.EdgeInsets.only(
                                                      left: 10,
                                                      top: 5,
                                                      right: 10,
                                                      bottom: 5),
                                                  decoration: pw.BoxDecoration(
                                                      border: pw.Border(
                                                    left:
                                                        pw.BorderSide(width: 1),
                                                    right:
                                                        pw.BorderSide(width: 1),
                                                    top:
                                                        pw.BorderSide(width: 1),
                                                  )),
                                                  child: pw.Text(
                                                      "${widget.objOfficerReport!.threat}",
                                                      style: pw.TextStyle(
                                                          fontSize: 15),
                                                      textAlign:
                                                          pw.TextAlign.start)))
                                        ]),
                                  ],
                                ))
                          ],
                        )),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

    //Page Fourty
    pdf.addPage(
      pw.Page(
        pageTheme: pageTheme,
        build: (final context) {
          return pw.FullPage(
            ignoreMargins: true,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Container(
                  margin: const pw.EdgeInsets.only(
                      top: 25, right: 25), // Add margin here
                  child: pw.Text(
                    "©BY CAMBODIA ANGKOR REAL ESTATE CO., LTD",
                    style: pw.TextStyle(fontSize: 9, font: font),
                  ),
                ),
                pw.Expanded(
                  child: pw.Container(
                    margin: const pw.EdgeInsets.only(
                        top: 5, left: 40, right: 25, bottom: 25),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(
                        color: PdfColors.black,
                        width: 2, // Adjust border width as needed
                      ),
                    ),
                    child: pw.Container(
                        padding: pw.EdgeInsets.only(left: 40, right: 20),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          // mainAxisAlignment: pw.MainAxisAlignment.start,
                          children: [
                            pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  top: 25, left: -20), // Add margin here
                              child: pw.Text(
                                "Proposed Developments Affecting the Value of the Subject Property [Land and Building]",
                                style: header1(),
                                textAlign: pw.TextAlign.start,
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            pw.RichText(
                              text: pw.TextSpan(
                                text:
                                    'Proposed Developments Beneficial to the Value of the Subject Property [Land and Building]',
                                style: header4(), // Base style
                              ),
                            ),
                            pw.RichText(
                              text: pw.TextSpan(
                                text:
                                    'At the date of the signing of this Valuation, Cambodia Angkor Real Estate Co. Ltd. is not aware of any proposed developments likely to beneficially affect the future value of the Subject Property [Land and Building].',
                                style: body1(), // Base style
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            pw.RichText(
                              text: pw.TextSpan(
                                text:
                                    'Proposed Developments Detrimental to the Value of the Subject Property [Land and Building]',
                                style: header4(), // Base style
                              ),
                            ),
                            pw.RichText(
                              text: pw.TextSpan(
                                text:
                                    'At the date of the signing of this Valuation, Cambodia Angkor Real Estate Co. Ltd. is not aware of any proposed developments likely to detrimentally affect the future value of the Subject Property [Land and Building].',
                                style: body1(), // Base style
                              ),
                            ),
                            pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  top: 15, left: -20), // Add margin here
                              child: pw.Text(
                                "Results of Consultation Process                                                                [Comments from Relevant Local and National Authorities]",
                                style: header1(),
                                textAlign: pw.TextAlign.start,
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            pw.RichText(
                              text: pw.TextSpan(
                                  text: 'Ministry of Planning',
                                  style: header4() // Base style
                                  ),
                            ),
                            pw.RichText(
                              text: pw.TextSpan(
                                text:
                                    'Cambodia Angkor Real Estate Co., Ltd. is not aware of any current planning proposals that would affect the Subject Property [Land and Building]. Consequently it has not been necessary to consult the Ministry of Planning or the Ministry of Land Management, Urban Planning and Construction. ',
                                style: body1(), // Base style
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            pw.RichText(
                              text: pw.TextSpan(
                                  text:
                                      'Ministry of Land Management, Urban Planning and Construction',
                                  style: header4() // Base style
                                  ),
                            ),
                            pw.RichText(
                              text: pw.TextSpan(
                                text: 'See above.',
                                style: body1(), // Base style
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            pw.RichText(
                              text: pw.TextSpan(
                                  text: 'Cadastral Land Registry Office',
                                  style: header4() // Base style
                                  ),
                            ),
                            pw.RichText(
                              text: pw.TextSpan(
                                text:
                                    'The true copies of the Ownership Title Deeds were provided by the client. According to the client, the name of current owner of the Subject Property [Land and building] is the same as that recorded on the Title Deed. Consequently, the Cadastral Land Registry Office has not been consulted regarding this valuation. ',
                                style: body1(), // Base style
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            pw.RichText(
                              text: pw.TextSpan(
                                  text:
                                      'Other Provincial / District-level Departments and Agencies',
                                  style: header4() // Base style
                                  ),
                            ),
                            pw.RichText(
                              text: pw.TextSpan(
                                text:
                                    'As the Ownership Title Deed is registered nationally it has not been necessary to consult at District or Provincial level. ',
                                style: body1(), // Base style
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            pw.RichText(
                              text: pw.TextSpan(
                                  text: 'Comments of the Commune Chief',
                                  style: header4() // Base style
                                  ),
                            ),
                            pw.RichText(
                              text: pw.TextSpan(
                                text:
                                    'As the Ownership Title Deed is registered nationally it has not been necessary to consult the Commune Chief. ',
                                style: body1(), // Base style
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            pw.RichText(
                              text: pw.TextSpan(
                                  text: 'Comments of the Village Chief',
                                  style: header4() // Base style
                                  ),
                            ),
                            pw.RichText(
                              text: pw.TextSpan(
                                text:
                                    'As Ownership Title Deed is registered nationally it has not been necessary to consult the Village Chief.',
                                style: body1(), // Base style
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

    //Page Fifteen
    pdf.addPage(
      pw.Page(
        pageTheme: pageTheme,
        build: (final context) {
          return pw.FullPage(
            ignoreMargins: true,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Container(
                  margin: const pw.EdgeInsets.only(
                      top: 25, right: 25), // Add margin here
                  child: pw.Text(
                    "©BY CAMBODIA ANGKOR REAL ESTATE CO., LTD",
                    style: pw.TextStyle(fontSize: 9, font: font),
                  ),
                ),
                pw.Expanded(
                  child: pw.Container(
                    margin: const pw.EdgeInsets.only(
                        top: 5, left: 40, right: 25, bottom: 25),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(
                        color: PdfColors.black,
                        width: 2, // Adjust border width as needed
                      ),
                    ),
                    child: pw.Container(
                        padding: pw.EdgeInsets.only(left: 10, right: 10),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          // mainAxisAlignment: pw.MainAxisAlignment.start,
                          children: [
                            pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  top: 20, left: 0), // Add margin here
                              child: pw.Text(
                                "Value of Comparable nearby Property",
                                style: header1(),
                                textAlign: pw.TextAlign.start,
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            pw.RichText(
                              text: pw.TextSpan(
                                text: 'Market Prices',
                                style: header4(), // Base style
                              ),
                            ),
                            pw.RichText(
                              text: pw.TextSpan(
                                text:
                                    'The market price of land and Building in Cambodia differs region to region depending on a number of factors, particularly the location and whether the site has development approval.  The location usually affects how fast the value of the subject land or Building rises in a given period.In the area near the Subject Property [Land and Building], Cambodia Angkor Real Estate Co. Ltd. estimates that, in general, property of a similar size and nature to the Subject Property [Land and Building]is currently worth around:',
                                style: body1(), // Base style
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            pw.Text(
                                "${numformat.format(double.parse(widget.objOfficerReport!.markrtprice.toString()))} / sqm",
                                style: header2(false),
                                textAlign: pw.TextAlign.center),
                            pw.SizedBox(height: 10),
                            pw.RichText(
                              text: pw.TextSpan(
                                text: 'Comparisons with nearby Property',
                                style: header4(), // Base style
                              ),
                            ),
                            pw.RichText(
                              text: pw.TextSpan(
                                text:
                                    'In preparing the Sales Comparable, the Valuer gathered both sold and on market properties verified and analyzed each sale. Utilized secondary data to support market trends as well as other factors pertinent to this assignment.',
                                style: body1(), // Base style
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            pw.RichText(
                              text: pw.TextSpan(
                                text:
                                    'The chart below summarizes sales from which land value can be estimated. The following comparable were considered most representative of the land activity in the area of the subject property.',
                                style: body1(), // Base style
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            pw.Row(children: [
                              pw.Expanded(
                                  flex: 2,
                                  child: pw.Container(
                                      height: 30,
                                      decoration: pw.BoxDecoration(
                                          border: pw.Border.all()),
                                      child:
                                          pw.Center(child: pw.Text("Parcel")))),
                              pw.Expanded(
                                  flex: 4,
                                  child: pw.Container(
                                      height: 30,
                                      decoration: pw.BoxDecoration(
                                          border: pw.Border.all()),
                                      child: pw.Center(
                                          child: pw.Text("Type Of Propery")))),
                              pw.Expanded(
                                  flex: 3,
                                  child: pw.Container(
                                      height: 30,
                                      decoration: pw.BoxDecoration(
                                          border: pw.Border.all()),
                                      child: pw.Center(
                                          child: pw.Text("Sixe (sqm)")))),
                              pw.Expanded(
                                  flex: 6,
                                  child: pw.Container(
                                      height: 30,
                                      decoration: pw.BoxDecoration(
                                          border: pw.Border.all()),
                                      child: pw.Center(
                                          child: pw.Text(
                                              "Subject Value in USD / sqm",
                                              style: pw.TextStyle(),
                                              textAlign:
                                                  pw.TextAlign.center)))),
                              pw.Expanded(
                                  flex: 3,
                                  child: pw.Container(
                                      height: 30,
                                      decoration: pw.BoxDecoration(
                                          border: pw.Border.all()),
                                      child: pw.Center(
                                          child: pw.Text("Price / USD")))),
                              pw.Expanded(
                                  flex: 4,
                                  child: pw.Container(
                                      height: 30,
                                      decoration: pw.BoxDecoration(
                                          border: pw.Border.all()),
                                      child: pw.Center(
                                          child: pw.Text("Total Price"))))
                            ]),
                            if (widget.objOfficerReport!.comparison!.length >=
                                1)
                              for (int i = 0;
                                  i <
                                      widget
                                          .objOfficerReport!.comparison!.length;
                                  i++)
                                pw.Container(
                                  width: double.infinity,
                                  decoration: pw.BoxDecoration(
                                    border: pw.Border.all(),
                                  ),
                                  child: pw.Column(
                                    children: [
                                      pw.Row(
                                        children: [
                                          pw.Expanded(
                                            flex: 2,
                                            child: pw.Container(
                                              decoration: pw.BoxDecoration(
                                                border: pw.Border(
                                                  left: pw.BorderSide(width: 1),
                                                ),
                                              ),
                                              child: pw.Center(
                                                child: pw.Text(
                                                    "${widget.objOfficerReport!.comparison![i].parcel}"),
                                              ),
                                            ),
                                          ),
                                          pw.Expanded(
                                            flex: 20,
                                            child: pw.Column(
                                              crossAxisAlignment:
                                                  pw.CrossAxisAlignment.center,
                                              children: [
                                                pw.Container(
                                                  height: 25,
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(),
                                                  ),
                                                  child: pw.Center(
                                                    child: pw.Text(
                                                        "${widget.objOfficerReport!.comparison![i].location}",
                                                        style: pw.TextStyle(),
                                                        textAlign:
                                                            pw.TextAlign.start),
                                                  ),
                                                ),
                                                pw.Row(
                                                    mainAxisAlignment: pw
                                                        .MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      pw.Expanded(
                                                          flex: 4,
                                                          child: pw.Container(
                                                              height: 25,
                                                              decoration: pw
                                                                  .BoxDecoration(
                                                                      border: pw
                                                                              .Border
                                                                          .all()),
                                                              child: pw.Center(
                                                                  child: pw.Text(
                                                                      "${widget.objOfficerReport!.comparison![i].typeofproperty1}")))),
                                                      pw.Expanded(
                                                          flex: 3,
                                                          child: pw.Container(
                                                              height: 25,
                                                              decoration: pw
                                                                  .BoxDecoration(
                                                                      border: pw
                                                                              .Border
                                                                          .all()),
                                                              child: pw.Center(
                                                                  child: pw.Text(
                                                                      "${((widget.objOfficerReport!.comparison![i].landprice))}")))),
                                                      pw.Expanded(
                                                          flex: 6,
                                                          child: pw.Container(
                                                              height: 25,
                                                              decoration: pw
                                                                  .BoxDecoration(
                                                                      border: pw
                                                                              .Border
                                                                          .all()),
                                                              child: pw.Center(
                                                                  child: pw.Text(
                                                                      "${numformat.format(double.parse(widget.objOfficerReport!.comparison![i].landvalue.toString()))}")))),
                                                      pw.Expanded(
                                                          flex: 3,
                                                          child: pw.Container(
                                                              height: 25,
                                                              decoration: pw
                                                                  .BoxDecoration(
                                                                      border: pw
                                                                              .Border
                                                                          .all()),
                                                              child: pw.Center(
                                                                  child: pw.Text(
                                                                      "${numformat.format(double.parse(widget.objOfficerReport!.comparison![i].landprice))}")))),
                                                      pw.Expanded(
                                                          flex: 4,
                                                          child: pw.Container(
                                                              height: 25,
                                                              decoration: pw.BoxDecoration(
                                                                  border: pw.Border.new(
                                                                      left: pw.BorderSide(
                                                                          width:
                                                                              1),
                                                                      right: pw.BorderSide(
                                                                          width:
                                                                              1),
                                                                      top: pw.BorderSide(
                                                                          width:
                                                                              1))),
                                                              child: pw.Padding(
                                                                padding: pw
                                                                        .EdgeInsets
                                                                    .only(
                                                                        top:
                                                                            20),
                                                                child: pw.Center(
                                                                    child: pw.Text(
                                                                        "${numformat.format(double.parse(widget.objOfficerReport!.comparison![i].totalprice))}",
                                                                        style: pw
                                                                            .TextStyle(),
                                                                        textAlign: pw
                                                                            .TextAlign
                                                                            .center)),
                                                              )))
                                                    ]),
                                                pw.Row(
                                                    mainAxisAlignment: pw
                                                        .MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      pw.Expanded(
                                                          flex: 4,
                                                          child: pw.Container(
                                                              height: 25,
                                                              decoration: pw
                                                                  .BoxDecoration(
                                                                      border: pw
                                                                              .Border
                                                                          .all()),
                                                              child: pw.Center(
                                                                  child: pw.Text(
                                                                      "${widget.objOfficerReport!.comparison![i].typeofproperty2}")))),
                                                      pw.Expanded(
                                                          flex: 3,
                                                          child: pw.Container(
                                                              height: 25,
                                                              decoration: pw
                                                                  .BoxDecoration(
                                                                      border: pw
                                                                              .Border
                                                                          .all()),
                                                              child: pw.Center(
                                                                  child: pw.Text(
                                                                      "${((widget.objOfficerReport!.comparison![i].buildingsize))}")))),
                                                      pw.Expanded(
                                                          flex: 6,
                                                          child: pw.Container(
                                                              height: 25,
                                                              decoration: pw
                                                                  .BoxDecoration(
                                                                      border: pw
                                                                              .Border
                                                                          .all()),
                                                              child: pw.Center(
                                                                  child: pw.Text(
                                                                      "${numformat.format(double.parse(
                                                                        widget
                                                                            .objOfficerReport!
                                                                            .comparison![i]
                                                                            .buildingvalue,
                                                                      ))}",
                                                                      style: pw.TextStyle(),
                                                                      textAlign: pw.TextAlign.center)))),
                                                      pw.Expanded(
                                                          flex: 3,
                                                          child: pw.Container(
                                                              height: 25,
                                                              decoration: pw
                                                                  .BoxDecoration(
                                                                      border: pw
                                                                              .Border
                                                                          .all()),
                                                              child: pw.Center(
                                                                  child: pw.Text(
                                                                      "${numformat.format(double.parse(widget.objOfficerReport!.comparison![i].buildingprice))}")))),
                                                      pw.Expanded(
                                                          flex: 4,
                                                          child: pw.Container(
                                                              height: 25,
                                                              decoration: pw
                                                                  .BoxDecoration(
                                                                      border: pw
                                                                              .Border
                                                                          .new(
                                                                left: pw
                                                                    .BorderSide(
                                                                        width:
                                                                            1),
                                                                right: pw
                                                                    .BorderSide(
                                                                        width:
                                                                            1),
                                                              )),
                                                              child: pw.Center(
                                                                  child:
                                                                      pw.Text(
                                                                          ""))))
                                                    ]),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                          ],
                        )),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

    //Page sixteen
    pdf.addPage(pw.Page(
      pageTheme: pageTheme,
      build: (final context) {
        return pw.FullPage(
          ignoreMargins: true,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            children: [
              pw.Container(
                margin: const pw.EdgeInsets.only(
                    top: 25, right: 25), // Add margin here
                child: pw.Text(
                  "©BY CAMBODIA ANGKOR REAL ESTATE CO., LTD",
                  style: pw.TextStyle(fontSize: 9, font: font),
                ),
              ),
              pw.Expanded(
                child: pw.Container(
                  margin: const pw.EdgeInsets.only(
                      top: 5, left: 40, right: 25, bottom: 25),
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(
                      color: PdfColors.black,
                      width: 2, // Adjust border width as needed
                    ),
                  ),
                  child: pw.Center(
                      child: pw.Padding(
                          padding: const pw.EdgeInsets.only(
                              top: 10, left: 15, right: 15),
                          child: pw.Column(
                            // mainAxisAlignment: pw.MainAxisAlignment.start,
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Padding(
                                padding: pw.EdgeInsets.only(left: 5),
                                child: pw.Text(
                                    'Google Location of Comparable Property',
                                    style: header2(true),
                                    textAlign: pw.TextAlign.start),
                              ),
                              pw.Expanded(
                                child: pw.Container(
                                    margin: const pw.EdgeInsets.only(
                                        top: 10,
                                        left: 10,
                                        right: 10,
                                        bottom: 20),
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                        color: PdfColors.black,
                                        width: 2,
                                      ),
                                    ),
                                    child: pw.Column(children: [
                                      pw.Expanded(
                                        flex: 5,
                                        child: pw.Container(
                                          decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                color: PdfColors.black,
                                                width: 2,
                                              ),
                                              image: pw.DecorationImage(
                                                  image: pw.MemoryImage(
                                                      widget.pImage))),
                                        ),
                                      )
                                    ])),
                              ),
                            ],
                          ) // Add margin here
                          )),
                ),
              ),
            ],
          ),
        );
      },
    ));

    //Page Seventeen

    pdf.addPage(
      pw.Page(
        pageTheme: pageTheme,
        build: (final context) {
          return pw.FullPage(
            ignoreMargins: true,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Container(
                  margin: const pw.EdgeInsets.only(
                      top: 25, right: 25), // Add margin here
                  child: pw.Text(
                    "©BY CAMBODIA ANGKOR REAL ESTATE CO., LTD",
                    style: pw.TextStyle(fontSize: 9, font: font),
                  ),
                ),
                pw.Expanded(
                    child: pw.Container(
                  margin: const pw.EdgeInsets.only(
                      top: 5, left: 40, right: 25, bottom: 25),
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(
                      color: PdfColors.black,
                      width: 2, // Adjust border width as needed
                    ),
                  ),
                  child: pw.Center(
                    child: pw.Padding(
                        padding: const pw.EdgeInsets.only(
                            top: 20, left: 15, right: 15),
                        child: pw.Padding(
                            padding: pw.EdgeInsets.only(
                                left: 15, bottom: 50, right: 15),
                            child: pw.Column(
                              // mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Padding(
                                  padding: pw.EdgeInsets.only(left: -20),
                                  child: pw.Text(
                                      'Provisional Valuation Made by the Inspection Officer(s)',
                                      style: header1(),
                                      textAlign: pw.TextAlign.start),
                                ),
                                pw.SizedBox(height: 15),
                                pw.RichText(
                                  text: pw.TextSpan(
                                    text:
                                        'The Subject Property [Land and Building] is in area of Phnom Penh. The Inspection Officer’s provisional evaluation after the detail and careful study of a number of comparable sales, and have taken into account the economic conditions at the time of valuation and have arrived at the opinion that the current market value of the Subject Property [Land and Building] researched by ',
                                    style: body1(), // Base style
                                    children: [
                                      pw.TextSpan(
                                        text: '${widget.objProvisional!.name}',
                                        style: header2(true),
                                      ),
                                      pw.TextSpan(
                                        text: ' are as follows:',
                                        style: body1(),
                                      ),
                                    ],
                                  ),
                                ),
                                if (widget.objCover!.header ==
                                    "Property [LAND AND BUILDING] VALUATION REPORT") ...[
                                  pw.SizedBox(height: 10),
                                  pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.center,
                                      children: [
                                        pw.Expanded(
                                            flex: 2,
                                            child: pw.Container(
                                                height: 25,
                                                decoration: pw.BoxDecoration(
                                                    border: pw.Border.all()),
                                                child: pw.Center(
                                                    child: pw.Text("No",
                                                        style: pw.TextStyle(
                                                            fontSize: 10))))),
                                        pw.Expanded(
                                            flex: 5,
                                            child: pw.Container(
                                                height: 25,
                                                decoration: pw.BoxDecoration(
                                                    border: pw.Border.all()),
                                                child: pw.Center(
                                                    child: pw.Text(
                                                        "Subject Property",
                                                        style: pw.TextStyle(
                                                            fontSize: 10))))),
                                        pw.Expanded(
                                            flex: 3,
                                            child: pw.Container(
                                                height: 25,
                                                decoration: pw.BoxDecoration(
                                                    border: pw.Border.all()),
                                                child: pw.Center(
                                                    child: pw.Text("Size Sqm",
                                                        style: pw.TextStyle(
                                                            fontSize: 10))))),
                                        pw.Expanded(
                                            flex: 3,
                                            child: pw.Container(
                                                height: 25,
                                                decoration: pw.BoxDecoration(
                                                    border: pw.Border.all()),
                                                child: pw.Center(
                                                    child: pw.Text(
                                                        "\$/sqm(Min)",
                                                        style: pw.TextStyle(
                                                            fontSize: 10))))),
                                        pw.Expanded(
                                            flex: 4,
                                            child: pw.Container(
                                                height: 25,
                                                decoration: pw.BoxDecoration(
                                                    border: pw.Border.all()),
                                                child: pw.Center(
                                                    child: pw.Text("Total(\$)",
                                                        style: pw.TextStyle(
                                                            fontSize: 10))))),
                                        pw.Expanded(
                                            flex: 4,
                                            child: pw.Container(
                                                height: 25,
                                                decoration: pw.BoxDecoration(
                                                    border: pw.Border.all()),
                                                child: pw.Center(
                                                    child: pw.Text(
                                                        "\$/sqm(Max)",
                                                        style: pw.TextStyle(
                                                            fontSize: 10))))),
                                        pw.Expanded(
                                            flex: 4,
                                            child: pw.Container(
                                                height: 25,
                                                decoration: pw.BoxDecoration(
                                                    border: pw.Border.all()),
                                                child: pw.Center(
                                                    child: pw.Text("Total(\$)",
                                                        style: pw.TextStyle(
                                                            fontSize: 10)))))
                                      ]),
                                  pw.Container(
                                    width: double.infinity,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(),
                                    ),
                                    child: pw.Row(
                                      children: [
                                        pw.Expanded(
                                          flex: 20,
                                          child: pw.Column(
                                            crossAxisAlignment:
                                                pw.CrossAxisAlignment.center,
                                            children: [
                                              pw.Row(
                                                  mainAxisAlignment: pw
                                                      .MainAxisAlignment.start,
                                                  crossAxisAlignment: pw
                                                      .CrossAxisAlignment.start,
                                                  children: [
                                                    pw.Expanded(
                                                        flex: 20,
                                                        child: pw.Container(
                                                            height: 25,
                                                            decoration: pw
                                                                .BoxDecoration(
                                                                    border: pw
                                                                            .Border
                                                                        .all()),
                                                            child: pw.Center(
                                                                child: pw.Text(
                                                                    "A.Land")))),
                                                  ]),
                                              if (widget.objProvisional!.land!
                                                      .length >=
                                                  1)
                                                for (int i = 0;
                                                    i <
                                                        widget.objProvisional!
                                                            .land!.length;
                                                    i++)
                                                  pw.Row(
                                                      mainAxisAlignment: pw
                                                          .MainAxisAlignment
                                                          .center,
                                                      crossAxisAlignment: pw
                                                          .CrossAxisAlignment
                                                          .center,
                                                      children: [
                                                        pw.Expanded(
                                                            flex: 2,
                                                            child: pw.Container(
                                                                height: 25,
                                                                decoration: pw.BoxDecoration(
                                                                    border: pw
                                                                            .Border
                                                                        .all()),
                                                                child: pw.Center(
                                                                    child: pw.Text(
                                                                        "${widget.objProvisional!.land![i].no}",
                                                                        style: pw.TextStyle(
                                                                            fontSize:
                                                                                10))))),
                                                        pw.Expanded(
                                                            flex: 5,
                                                            child: pw.Container(
                                                                height: 25,
                                                                decoration: pw.BoxDecoration(
                                                                    border: pw
                                                                            .Border
                                                                        .all()),
                                                                child: pw.Center(
                                                                    child: pw.Text(
                                                                        "Land",
                                                                        style: pw.TextStyle(
                                                                            fontSize:
                                                                                10))))),
                                                        pw.Expanded(
                                                            flex: 3,
                                                            child: pw.Container(
                                                                height: 25,
                                                                decoration: pw.BoxDecoration(
                                                                    border: pw.Border
                                                                        .all()),
                                                                child: pw.Center(
                                                                    child: pw.Text(
                                                                        numformat.format(double.parse(widget
                                                                            .objProvisional!
                                                                            .land![i]
                                                                            .size_sqm
                                                                            .toString())),
                                                                        style: pw.TextStyle(fontSize: 10))))),
                                                        pw.Expanded(
                                                            flex: 3,
                                                            child: pw.Container(
                                                                height: 25,
                                                                decoration: pw.BoxDecoration(
                                                                    border: pw.Border
                                                                        .all()),
                                                                child: pw.Center(
                                                                    child: pw.Text(
                                                                        numformat.format(double.parse(widget
                                                                            .objProvisional!
                                                                            .land![i]
                                                                            .minsqm
                                                                            .toString())),
                                                                        style: pw.TextStyle(fontSize: 10))))),
                                                        pw.Expanded(
                                                            flex: 4,
                                                            child: pw.Container(
                                                                height: 25,
                                                                decoration: pw.BoxDecoration(
                                                                    border: pw.Border
                                                                        .all()),
                                                                child: pw.Center(
                                                                    child: pw.Text(
                                                                        numformat.format(double.parse(widget
                                                                            .objProvisional!
                                                                            .land![i]
                                                                            .totalmin
                                                                            .toString())),
                                                                        style: pw.TextStyle(fontSize: 10))))),
                                                        pw.Expanded(
                                                            flex: 4,
                                                            child: pw.Container(
                                                                height: 25,
                                                                decoration: pw.BoxDecoration(
                                                                    border: pw.Border
                                                                        .all()),
                                                                child: pw.Center(
                                                                    child: pw.Text(
                                                                        numformat.format(double.parse(widget
                                                                            .objProvisional!
                                                                            .land![i]
                                                                            .maxsqm
                                                                            .toString())),
                                                                        style: pw.TextStyle(fontSize: 10))))),
                                                        pw.Expanded(
                                                            flex: 4,
                                                            child: pw.Container(
                                                                height: 25,
                                                                decoration: pw.BoxDecoration(
                                                                    border: pw.Border
                                                                        .all()),
                                                                child: pw.Center(
                                                                    child: pw.Text(
                                                                        numformat.format(double.parse(widget
                                                                            .objProvisional!
                                                                            .land![i]
                                                                            .totalmax
                                                                            .toString())),
                                                                        style: pw.TextStyle(fontSize: 10)))))
                                                      ]),
                                              pw.Row(
                                                  mainAxisAlignment: pw
                                                      .MainAxisAlignment.center,
                                                  crossAxisAlignment: pw
                                                      .CrossAxisAlignment
                                                      .center,
                                                  children: [
                                                    pw.Expanded(
                                                        flex: 7,
                                                        child: pw.Container(
                                                            height: 25,
                                                            decoration: pw
                                                                .BoxDecoration(
                                                                    border: pw
                                                                            .Border
                                                                        .all()),
                                                            child: pw.Center(
                                                                child: pw.Text(
                                                                    "Total",
                                                                    style: pw.TextStyle(
                                                                        fontSize:
                                                                            10))))),
                                                    pw.Expanded(
                                                        flex: 3,
                                                        child: pw.Container(
                                                            height: 25,
                                                            decoration:
                                                                pw.BoxDecoration(
                                                                    border: pw.Border
                                                                        .all()),
                                                            child: pw.Center(
                                                                child: pw.Text(
                                                                    numformat.format(double.parse(widget
                                                                        .objProvisional!
                                                                        .totallandsizesqm
                                                                        .toString())),
                                                                    style: pw.TextStyle(fontSize: 10))))),
                                                    pw.Expanded(
                                                        flex: 7,
                                                        child: pw.Container(
                                                            height: 25,
                                                            decoration:
                                                                pw.BoxDecoration(
                                                                    border: pw.Border
                                                                        .all()),
                                                            child: pw.Center(
                                                                child: pw.Text(
                                                                    numformat.format(double.parse(widget
                                                                        .objProvisional!
                                                                        .totallandvaluemin
                                                                        .toString())),
                                                                    style: pw.TextStyle(fontSize: 10))))),
                                                    pw.Expanded(
                                                        flex: 8,
                                                        child: pw.Container(
                                                            height: 25,
                                                            decoration:
                                                                pw.BoxDecoration(
                                                                    border: pw.Border
                                                                        .all()),
                                                            child: pw.Center(
                                                                child: pw.Text(
                                                                    numformat.format(double.parse(widget
                                                                        .objProvisional!
                                                                        .totallandvaluemax
                                                                        .toString())),
                                                                    style: pw.TextStyle(fontSize: 10)))))
                                                  ]),
                                              if (widget.objProvisional!
                                                      .building!.length >=
                                                  1)
                                                pw.Row(
                                                    mainAxisAlignment: pw
                                                        .MainAxisAlignment
                                                        .start,
                                                    crossAxisAlignment: pw
                                                        .CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      pw.Expanded(
                                                          flex: 20,
                                                          child: pw.Container(
                                                              height: 25,
                                                              decoration: pw
                                                                  .BoxDecoration(
                                                                      border: pw
                                                                              .Border
                                                                          .all()),
                                                              child: pw.Center(
                                                                  child: pw.Text(
                                                                      "B.Building")))),
                                                    ]),
                                              if (widget.objProvisional!
                                                      .building!.length >=
                                                  1)
                                                for (int i = 0;
                                                    i <
                                                        widget.objProvisional!
                                                            .building!.length;
                                                    i++)
                                                  pw.Row(
                                                      mainAxisAlignment: pw
                                                          .MainAxisAlignment
                                                          .center,
                                                      crossAxisAlignment: pw
                                                          .CrossAxisAlignment
                                                          .center,
                                                      children: [
                                                        pw.Expanded(
                                                            flex: 2,
                                                            child: pw.Container(
                                                                height: 25,
                                                                decoration: pw.BoxDecoration(
                                                                    border: pw
                                                                            .Border
                                                                        .all()),
                                                                child: pw.Center(
                                                                    child: pw.Text(
                                                                        "${widget.objProvisional!.building![i].no}",
                                                                        style: pw.TextStyle(
                                                                            fontSize:
                                                                                10))))),
                                                        pw.Expanded(
                                                            flex: 5,
                                                            child: pw.Container(
                                                                height: 25,
                                                                decoration: pw.BoxDecoration(
                                                                    border: pw
                                                                            .Border
                                                                        .all()),
                                                                child: pw.Center(
                                                                    child: pw.Text(
                                                                        "Building",
                                                                        style: pw.TextStyle(
                                                                            fontSize:
                                                                                10))))),
                                                        pw.Expanded(
                                                            flex: 3,
                                                            child: pw.Container(
                                                                height: 25,
                                                                decoration: pw.BoxDecoration(
                                                                    border: pw.Border
                                                                        .all()),
                                                                child: pw.Center(
                                                                    child: pw.Text(
                                                                        numformat.format(double.parse(widget
                                                                            .objProvisional!
                                                                            .building![i]
                                                                            .sizesqm
                                                                            .toString())),
                                                                        style: pw.TextStyle(fontSize: 10))))),
                                                        pw.Expanded(
                                                            flex: 3,
                                                            child: pw.Container(
                                                                height: 25,
                                                                decoration: pw.BoxDecoration(
                                                                    border: pw.Border
                                                                        .all()),
                                                                child: pw.Center(
                                                                    child: pw.Text(
                                                                        numformat.format(double.parse(widget
                                                                            .objProvisional!
                                                                            .building![i]
                                                                            .minsqm
                                                                            .toString())),
                                                                        style: pw.TextStyle(fontSize: 10))))),
                                                        pw.Expanded(
                                                            flex: 4,
                                                            child: pw.Container(
                                                                height: 25,
                                                                decoration: pw.BoxDecoration(
                                                                    border: pw.Border
                                                                        .all()),
                                                                child: pw.Center(
                                                                    child: pw.Text(
                                                                        numformat.format(double.parse(widget
                                                                            .objProvisional!
                                                                            .building![i]
                                                                            .totalmin
                                                                            .toString())),
                                                                        style: pw.TextStyle(fontSize: 10))))),
                                                        pw.Expanded(
                                                            flex: 4,
                                                            child: pw.Container(
                                                                height: 25,
                                                                decoration: pw.BoxDecoration(
                                                                    border: pw.Border
                                                                        .all()),
                                                                child: pw.Center(
                                                                    child: pw.Text(
                                                                        numformat.format(double.parse(widget
                                                                            .objProvisional!
                                                                            .building![i]
                                                                            .maxsqm
                                                                            .toString())),
                                                                        style: pw.TextStyle(fontSize: 10))))),
                                                        pw.Expanded(
                                                            flex: 4,
                                                            child: pw.Container(
                                                                height: 25,
                                                                decoration: pw.BoxDecoration(
                                                                    border: pw.Border
                                                                        .all()),
                                                                child: pw.Center(
                                                                    child: pw.Text(
                                                                        numformat.format(double.parse(widget
                                                                            .objProvisional!
                                                                            .building![i]
                                                                            .totalmax
                                                                            .toString())),
                                                                        style: pw.TextStyle(fontSize: 10)))))
                                                      ]),
                                              pw.Row(
                                                  mainAxisAlignment: pw
                                                      .MainAxisAlignment.center,
                                                  crossAxisAlignment: pw
                                                      .CrossAxisAlignment
                                                      .center,
                                                  children: [
                                                    pw.Expanded(
                                                        flex: 7,
                                                        child: pw.Container(
                                                            height: 25,
                                                            decoration: pw
                                                                .BoxDecoration(
                                                                    border: pw
                                                                            .Border
                                                                        .all()),
                                                            child: pw.Center(
                                                                child: pw.Text(
                                                                    "Total",
                                                                    style: pw.TextStyle(
                                                                        fontSize:
                                                                            10))))),
                                                    pw.Expanded(
                                                        flex: 3,
                                                        child: pw.Container(
                                                            height: 25,
                                                            decoration:
                                                                pw.BoxDecoration(
                                                                    border: pw.Border
                                                                        .all()),
                                                            child: pw.Center(
                                                                child: pw.Text(
                                                                    numformat.format(double.parse(widget
                                                                        .objProvisional!
                                                                        .totalbuildingsizesqm
                                                                        .toString())),
                                                                    style: pw.TextStyle(fontSize: 10))))),
                                                    pw.Expanded(
                                                        flex: 7,
                                                        child: pw.Container(
                                                            height: 25,
                                                            decoration:
                                                                pw.BoxDecoration(
                                                                    border: pw.Border
                                                                        .all()),
                                                            child: pw.Center(
                                                                child: pw.Text(
                                                                    numformat.format(double.parse(widget
                                                                        .objProvisional!
                                                                        .totalbuildingvaluemin
                                                                        .toString())),
                                                                    style: pw.TextStyle(fontSize: 10))))),
                                                    pw.Expanded(
                                                        flex: 8,
                                                        child: pw.Container(
                                                            height: 25,
                                                            decoration:
                                                                pw.BoxDecoration(
                                                                    border: pw.Border
                                                                        .all()),
                                                            child: pw.Center(
                                                                child: pw.Text(
                                                                    numformat.format(double.parse(widget
                                                                        .objProvisional!
                                                                        .totalbuildingvaluemax
                                                                        .toString())),
                                                                    style: pw.TextStyle(fontSize: 10)))))
                                                  ]),
                                              pw.Row(
                                                  mainAxisAlignment: pw
                                                      .MainAxisAlignment.center,
                                                  crossAxisAlignment: pw
                                                      .CrossAxisAlignment
                                                      .center,
                                                  children: [
                                                    pw.Expanded(
                                                        flex: 10,
                                                        child: pw.Container(
                                                            height: 25,
                                                            decoration: pw
                                                                .BoxDecoration(
                                                                    border: pw
                                                                            .Border
                                                                        .all()),
                                                            child: pw.Center(
                                                                child: pw.Text(
                                                                    "Fair Market Value",
                                                                    style: pw.TextStyle(
                                                                        fontSize:
                                                                            10))))),
                                                    pw.Expanded(
                                                        flex: 7,
                                                        child: pw.Container(
                                                            height: 25,
                                                            decoration: pw
                                                                .BoxDecoration(
                                                                    border: pw
                                                                            .Border
                                                                        .all()),
                                                            child: pw.Center(
                                                                child: pw.Text(
                                                                    " ${numformat.format(double.parse(widget.objProvisional!.totalbuildingvaluemin.toString()) + double.parse(widget.objProvisional!.totalbuildingvaluemin.toString()))}",
                                                                    style: pw.TextStyle(
                                                                        fontSize:
                                                                            10))))),
                                                    pw.Expanded(
                                                        flex: 8,
                                                        child: pw.Container(
                                                            height: 25,
                                                            decoration: pw.BoxDecoration(
                                                                border: pw.Border
                                                                    .all()),
                                                            child: pw.Center(
                                                                child: pw.Text(
                                                                    numformat.format(double.parse(widget.objProvisional!.totalbuildingvaluemax.toString()) +
                                                                        double.parse(widget
                                                                            .objProvisional!
                                                                            .totalbuildingvaluemax
                                                                            .toString())),
                                                                    style: pw.TextStyle(fontSize: 10)))))
                                                  ])
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ] else if (widget.objCover!.header ==
                                    "Property LAND VALUATION REPORT") ...[
                                  pw.SizedBox(height: 10),
                                  pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.center,
                                      children: [
                                        pw.Expanded(
                                            flex: 2,
                                            child: pw.Container(
                                                height: 25,
                                                decoration: pw.BoxDecoration(
                                                    border: pw.Border.all()),
                                                child: pw.Center(
                                                    child: pw.Text("No",
                                                        style: pw.TextStyle(
                                                            fontSize: 10))))),
                                        pw.Expanded(
                                            flex: 5,
                                            child: pw.Container(
                                                height: 25,
                                                decoration: pw.BoxDecoration(
                                                    border: pw.Border.all()),
                                                child: pw.Center(
                                                    child: pw.Text(
                                                        "Subject Property",
                                                        style: pw.TextStyle(
                                                            fontSize: 10))))),
                                        pw.Expanded(
                                            flex: 3,
                                            child: pw.Container(
                                                height: 25,
                                                decoration: pw.BoxDecoration(
                                                    border: pw.Border.all()),
                                                child: pw.Center(
                                                    child: pw.Text("Size Sqm",
                                                        style: pw.TextStyle(
                                                            fontSize: 10))))),
                                        pw.Expanded(
                                            flex: 3,
                                            child: pw.Container(
                                                height: 25,
                                                decoration: pw.BoxDecoration(
                                                    border: pw.Border.all()),
                                                child: pw.Center(
                                                    child: pw.Text(
                                                        "\$/sqm(Min)",
                                                        style: pw.TextStyle(
                                                            fontSize: 10))))),
                                        pw.Expanded(
                                            flex: 4,
                                            child: pw.Container(
                                                height: 25,
                                                decoration: pw.BoxDecoration(
                                                    border: pw.Border.all()),
                                                child: pw.Center(
                                                    child: pw.Text("Total(\$)",
                                                        style: pw.TextStyle(
                                                            fontSize: 10))))),
                                        pw.Expanded(
                                            flex: 4,
                                            child: pw.Container(
                                                height: 25,
                                                decoration: pw.BoxDecoration(
                                                    border: pw.Border.all()),
                                                child: pw.Center(
                                                    child: pw.Text(
                                                        "\$/sqm(Max)",
                                                        style: pw.TextStyle(
                                                            fontSize: 10))))),
                                        pw.Expanded(
                                            flex: 4,
                                            child: pw.Container(
                                                height: 25,
                                                decoration: pw.BoxDecoration(
                                                    border: pw.Border.all()),
                                                child: pw.Center(
                                                    child: pw.Text("Total(\$)",
                                                        style: pw.TextStyle(
                                                            fontSize: 10)))))
                                      ]),
                                  if (widget.objProvisional!.land!.length >= 1)
                                    for (int i = 0;
                                        i < widget.objProvisional!.land!.length;
                                        i++)
                                      pw.Row(
                                          mainAxisAlignment:
                                              pw.MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.center,
                                          children: [
                                            pw.Expanded(
                                                flex: 2,
                                                child: pw.Container(
                                                    height: 25,
                                                    decoration:
                                                        pw.BoxDecoration(
                                                            border: pw.Border
                                                                .all()),
                                                    child: pw.Center(
                                                        child: pw.Text(
                                                            "${widget.objProvisional!.land![i].no}",
                                                            style: pw.TextStyle(
                                                                fontSize:
                                                                    10))))),
                                            pw.Expanded(
                                                flex: 5,
                                                child: pw.Container(
                                                    height: 25,
                                                    decoration:
                                                        pw.BoxDecoration(
                                                            border: pw.Border
                                                                .all()),
                                                    child: pw.Center(
                                                        child: pw.Text("Land",
                                                            style: pw.TextStyle(
                                                                fontSize:
                                                                    10))))),
                                            pw.Expanded(
                                                flex: 3,
                                                child: pw.Container(
                                                    height: 25,
                                                    decoration: pw.BoxDecoration(
                                                        border:
                                                            pw.Border.all()),
                                                    child: pw.Center(
                                                        child: pw.Text(
                                                            numformat.format(
                                                                double.parse(widget
                                                                    .objProvisional!
                                                                    .land![i]
                                                                    .size_sqm
                                                                    .toString())),
                                                            style: pw.TextStyle(
                                                                fontSize:
                                                                    10))))),
                                            pw.Expanded(
                                                flex: 3,
                                                child: pw.Container(
                                                    height: 25,
                                                    decoration: pw.BoxDecoration(
                                                        border:
                                                            pw.Border.all()),
                                                    child: pw.Center(
                                                        child: pw.Text(
                                                            numformat.format(
                                                                double.parse(widget
                                                                    .objProvisional!
                                                                    .land![i]
                                                                    .minsqm
                                                                    .toString())),
                                                            style: pw.TextStyle(
                                                                fontSize:
                                                                    10))))),
                                            pw.Expanded(
                                                flex: 4,
                                                child: pw.Container(
                                                    height: 25,
                                                    decoration: pw.BoxDecoration(
                                                        border:
                                                            pw.Border.all()),
                                                    child: pw.Center(
                                                        child: pw.Text(
                                                            numformat.format(
                                                                double.parse(widget
                                                                    .objProvisional!
                                                                    .land![i]
                                                                    .totalmin
                                                                    .toString())),
                                                            style: pw.TextStyle(
                                                                fontSize:
                                                                    10))))),
                                            pw.Expanded(
                                                flex: 4,
                                                child: pw.Container(
                                                    height: 25,
                                                    decoration: pw.BoxDecoration(
                                                        border:
                                                            pw.Border.all()),
                                                    child: pw.Center(
                                                        child: pw.Text(
                                                            numformat.format(
                                                                double.parse(widget
                                                                    .objProvisional!
                                                                    .land![i]
                                                                    .maxsqm
                                                                    .toString())),
                                                            style: pw.TextStyle(
                                                                fontSize:
                                                                    10))))),
                                            pw.Expanded(
                                                flex: 4,
                                                child: pw.Container(
                                                    height: 25,
                                                    decoration: pw.BoxDecoration(
                                                        border:
                                                            pw.Border.all()),
                                                    child: pw.Center(
                                                        child: pw.Text(
                                                            numformat.format(
                                                                double.parse(widget
                                                                    .objProvisional!
                                                                    .land![i]
                                                                    .totalmax
                                                                    .toString())),
                                                            style: pw.TextStyle(
                                                                fontSize:
                                                                    10)))))
                                          ]),
                                  pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.center,
                                      children: [
                                        pw.Expanded(
                                            flex: 7,
                                            child: pw.Container(
                                                height: 25,
                                                decoration: pw.BoxDecoration(
                                                    border: pw.Border.all()),
                                                child: pw.Center(
                                                    child: pw.Text("Total",
                                                        style: pw.TextStyle(
                                                            fontSize: 10))))),
                                        pw.Expanded(
                                            flex: 3,
                                            child: pw.Container(
                                                height: 25,
                                                decoration: pw.BoxDecoration(
                                                    border: pw.Border.all()),
                                                child: pw.Center(
                                                    child: pw.Text(
                                                        numformat.format(
                                                            double.parse(widget
                                                                .objProvisional!
                                                                .totallandsizesqm
                                                                .toString())),
                                                        style: pw.TextStyle(
                                                            fontSize: 10))))),
                                        pw.Expanded(
                                            flex: 7,
                                            child: pw.Container(
                                                height: 25,
                                                decoration: pw.BoxDecoration(
                                                    border: pw.Border.all()),
                                                child: pw.Center(
                                                    child: pw.Text(
                                                        numformat.format(
                                                            double.parse(widget
                                                                .objProvisional!
                                                                .totallandvaluemin
                                                                .toString())),
                                                        style: pw.TextStyle(
                                                            fontSize: 10))))),
                                        pw.Expanded(
                                            flex: 8,
                                            child: pw.Container(
                                                height: 25,
                                                decoration: pw.BoxDecoration(
                                                    border: pw.Border.all()),
                                                child: pw.Center(
                                                    child: pw.Text(
                                                        numformat.format(
                                                            double.parse(widget
                                                                .objProvisional!
                                                                .totallandvaluemax
                                                                .toString())),
                                                        style: pw.TextStyle(
                                                            fontSize: 10)))))
                                      ]),
                                  // pw.Row(
                                  //     mainAxisAlignment:
                                  //         pw.MainAxisAlignment.center,
                                  //     crossAxisAlignment:
                                  //         pw.CrossAxisAlignment.center,
                                  //     children: [
                                  //       pw.Expanded(
                                  //           flex: 10,
                                  //           child: pw.Container(
                                  //               height: 25,
                                  //               decoration: pw.BoxDecoration(
                                  //                   border: pw.Border.all()),
                                  //               child: pw.Center(
                                  //                   child: pw.Text(
                                  //                       "Fair Market Value",
                                  //                       style: pw.TextStyle(
                                  //                           fontSize: 10))))),
                                  //       pw.Expanded(
                                  //           flex: 7,
                                  //           child: pw.Container(
                                  //               height: 25,
                                  //               decoration: pw.BoxDecoration(
                                  //                   border: pw.Border.all()),
                                  //               child: pw.Center(
                                  //                   child: pw.Text(
                                  //                       " ${numformat.format(double.parse(widget.objProvisional!.totallandvaluemin.toString()) + double.parse(widget.objProvisional!.totallandvaluemin.toString()))}",
                                  //                       style: pw.TextStyle(
                                  //                           fontSize: 10))))),
                                  //       pw.Expanded(
                                  //           flex: 8,
                                  //           child: pw.Container(
                                  //               height: 25,
                                  //               decoration: pw.BoxDecoration(
                                  //                   border: pw.Border.all()),
                                  //               child: pw.Center(
                                  //                   child: pw.Text(
                                  //                       numformat.format(double.parse(widget.objProvisional!.totallandvaluemax.toString()) +
                                  //                           double.parse(widget
                                  //                               .objProvisional!
                                  //                               .totallandvaluemax
                                  //                               .toString())),
                                  //                       style: pw.TextStyle(
                                  //                           fontSize: 10)))))
                                  //     ])
                                  pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.center,
                                    children: [
                                      pw.Expanded(
                                        flex: 10,
                                        child: pw.Container(
                                          height: 25,
                                          decoration: pw.BoxDecoration(
                                            border: pw.Border.all(),
                                          ),
                                          child: pw.Center(
                                            child: pw.Text(
                                              "Fair Market Value",
                                              style: pw.TextStyle(fontSize: 10),
                                            ),
                                          ),
                                        ),
                                      ),
                                      pw.Expanded(
                                        flex: 7,
                                        child: pw.Container(
                                          height: 25,
                                          decoration: pw.BoxDecoration(
                                            border: pw.Border.all(),
                                          ),
                                          child: pw.Center(
                                            child: pw.Text(
                                              numformat.format(
                                                double.parse(widget
                                                        .objProvisional!
                                                        .totallandvaluemin
                                                        .toString()) +
                                                    double.parse(widget
                                                        .objProvisional!
                                                        .totallandvaluemin
                                                        .toString()),
                                              ),
                                              style: pw.TextStyle(fontSize: 10),
                                            ),
                                          ),
                                        ),
                                      ),
                                      pw.Expanded(
                                        flex: 8,
                                        child: pw.Container(
                                          height: 25,
                                          decoration: pw.BoxDecoration(
                                            border: pw.Border.all(),
                                          ),
                                          child: pw.Center(
                                            child: pw.Text(
                                              numformat.format(
                                                double.parse(widget
                                                        .objProvisional!
                                                        .totallandvaluemax
                                                        .toString()) +
                                                    double.parse(widget
                                                        .objProvisional!
                                                        .totallandvaluemax
                                                        .toString()),
                                              ),
                                              style: pw.TextStyle(fontSize: 10),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ] else if (widget.objCover!.header ==
                                    "Property OFFICE SPACE VALUATION REPORT") ...[
                                  pw.SizedBox(height: 10),
                                  pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.center,
                                    children: [
                                      pw.Expanded(
                                        flex: 3,
                                        child: pw.Container(
                                          alignment: pw.Alignment.center,
                                          height: 25,
                                          decoration: pw.BoxDecoration(
                                            border: pw.Border.all(),
                                          ),
                                          child: pw.Center(
                                            child: pw.Text("Subject Property",
                                                style: pw.TextStyle(
                                                  fontSize: 10,
                                                ),
                                                textAlign: pw.TextAlign.center),
                                          ),
                                        ),
                                      ),
                                      pw.Expanded(
                                        flex: 4,
                                        child: pw.Container(
                                          alignment: pw.Alignment.center,
                                          height: 25,
                                          decoration: pw.BoxDecoration(
                                            border: pw.Border.all(),
                                          ),
                                          child: pw.Center(
                                            child: pw.Text("Floor/Unit No.",
                                                style: pw.TextStyle(
                                                  fontSize: 10,
                                                ),
                                                textAlign: pw.TextAlign.center),
                                          ),
                                        ),
                                      ),
                                      pw.Expanded(
                                        flex: 3,
                                        child: pw.Container(
                                          height: 25,
                                          decoration: pw.BoxDecoration(
                                            border: pw.Border.all(),
                                          ),
                                          child: pw.Center(
                                            child: pw.Text("No.of Bedroom",
                                                style:
                                                    pw.TextStyle(fontSize: 10),
                                                textAlign: pw.TextAlign.center),
                                          ),
                                        ),
                                      ),
                                      pw.Expanded(
                                        flex: 4,
                                        child: pw.Container(
                                          height: 25,
                                          decoration: pw.BoxDecoration(
                                            border: pw.Border.all(),
                                          ),
                                          child: pw.Center(
                                            child: pw.Text("Gross Area (Sqm)",
                                                style:
                                                    pw.TextStyle(fontSize: 10),
                                                textAlign: pw.TextAlign.center),
                                          ),
                                        ),
                                      ),
                                      pw.Expanded(
                                        flex: 3,
                                        child: pw.Container(
                                          height: 25,
                                          decoration: pw.BoxDecoration(
                                            border: pw.Border.all(),
                                          ),
                                          child: pw.Center(
                                            child: pw.Text("\$/sqm(Min)",
                                                style:
                                                    pw.TextStyle(fontSize: 10),
                                                textAlign: pw.TextAlign.center),
                                          ),
                                        ),
                                      ),
                                      pw.Expanded(
                                        flex: 3,
                                        child: pw.Container(
                                          height: 25,
                                          decoration: pw.BoxDecoration(
                                            border: pw.Border.all(),
                                          ),
                                          child: pw.Center(
                                            child: pw.Text("Total(\$)",
                                                style:
                                                    pw.TextStyle(fontSize: 10),
                                                textAlign: pw.TextAlign.center),
                                          ),
                                        ),
                                      ),
                                      pw.Expanded(
                                        flex: 3,
                                        child: pw.Container(
                                          height: 25,
                                          decoration: pw.BoxDecoration(
                                            border: pw.Border.all(),
                                          ),
                                          child: pw.Center(
                                            child: pw.Text("\$/sqm(Max)",
                                                style:
                                                    pw.TextStyle(fontSize: 10),
                                                textAlign: pw.TextAlign.center),
                                          ),
                                        ),
                                      ),
                                      pw.Expanded(
                                        flex: 3,
                                        child: pw.Container(
                                          height: 25,
                                          decoration: pw.BoxDecoration(
                                            border: pw.Border.all(),
                                          ),
                                          child: pw.Center(
                                            child: pw.Text("Total(\$)",
                                                style:
                                                    pw.TextStyle(fontSize: 10),
                                                textAlign: pw.TextAlign.center),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  pw.Container(
                                    width: double.infinity,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(),
                                    ),
                                    child: pw.Row(
                                      children: [
                                        pw.Expanded(
                                          flex: 20,
                                          child: pw.Column(
                                            crossAxisAlignment:
                                                pw.CrossAxisAlignment.center,
                                            children: [
                                              if (widget.objProvisional!
                                                      .building!.length >=
                                                  1)
                                                for (int i = 0;
                                                    i <
                                                        widget.objProvisional!
                                                            .building!.length;
                                                    i++)
                                                  pw.Row(
                                                    mainAxisAlignment: pw
                                                        .MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      pw.Expanded(
                                                        flex: 3,
                                                        child: pw.Container(
                                                          height: 25,
                                                          decoration:
                                                              pw.BoxDecoration(
                                                            border:
                                                                pw.Border.all(),
                                                          ),
                                                          child: pw.Center(
                                                            child: pw.Text(
                                                                "Office Space",
                                                                style: pw
                                                                    .TextStyle(
                                                                        fontSize:
                                                                            10),
                                                                textAlign: pw
                                                                    .TextAlign
                                                                    .center),
                                                          ),
                                                        ),
                                                      ),
                                                      pw.Expanded(
                                                        flex: 4,
                                                        child: pw.Container(
                                                          height: 25,
                                                          decoration:
                                                              pw.BoxDecoration(
                                                            border:
                                                                pw.Border.all(),
                                                          ),
                                                          child: pw.Center(
                                                            child: pw.Text(
                                                                "${(widget.objProvisional!.building![i].floorno)}",
                                                                style: pw
                                                                    .TextStyle(
                                                                        fontSize:
                                                                            10),
                                                                textAlign: pw
                                                                    .TextAlign
                                                                    .center),
                                                          ),
                                                        ),
                                                      ),
                                                      pw.Expanded(
                                                        flex: 3,
                                                        child: pw.Container(
                                                          height: 25,
                                                          decoration:
                                                              pw.BoxDecoration(
                                                            border:
                                                                pw.Border.all(),
                                                          ),
                                                          child: pw.Center(
                                                            child: pw.Text(
                                                                "${(widget.objProvisional!.building![i].bedroomno)}",
                                                                style: pw
                                                                    .TextStyle(
                                                                        fontSize:
                                                                            10),
                                                                textAlign: pw
                                                                    .TextAlign
                                                                    .center),
                                                          ),
                                                        ),
                                                      ),
                                                      pw.Expanded(
                                                        flex: 4,
                                                        child: pw.Container(
                                                          height: 25,
                                                          decoration:
                                                              pw.BoxDecoration(
                                                            border:
                                                                pw.Border.all(),
                                                          ),
                                                          child: pw.Center(
                                                            child: pw.Text(
                                                                numformat.format(
                                                                    double.parse(widget
                                                                        .objProvisional!
                                                                        .building![
                                                                            i]
                                                                        .sizesqm
                                                                        .toString())),
                                                                style: pw
                                                                    .TextStyle(
                                                                        fontSize:
                                                                            10),
                                                                textAlign: pw
                                                                    .TextAlign
                                                                    .center),
                                                          ),
                                                        ),
                                                      ),
                                                      pw.Expanded(
                                                        flex: 3,
                                                        child: pw.Container(
                                                          height: 25,
                                                          decoration:
                                                              pw.BoxDecoration(
                                                            border:
                                                                pw.Border.all(),
                                                          ),
                                                          child: pw.Center(
                                                            child: pw.Text(
                                                                numformat.format(
                                                                    double.parse(widget
                                                                        .objProvisional!
                                                                        .building![
                                                                            i]
                                                                        .minsqm
                                                                        .toString())),
                                                                style: pw
                                                                    .TextStyle(
                                                                        fontSize:
                                                                            10),
                                                                textAlign: pw
                                                                    .TextAlign
                                                                    .center),
                                                          ),
                                                        ),
                                                      ),
                                                      pw.Expanded(
                                                        flex: 3,
                                                        child: pw.Container(
                                                          height: 25,
                                                          decoration:
                                                              pw.BoxDecoration(
                                                            border:
                                                                pw.Border.all(),
                                                          ),
                                                          child: pw.Center(
                                                            child: pw.Text(
                                                                numformat.format(double.parse(widget
                                                                    .objProvisional!
                                                                    .building![
                                                                        i]
                                                                    .totalmin
                                                                    .toString())),
                                                                style: pw
                                                                    .TextStyle(
                                                                        fontSize:
                                                                            10),
                                                                textAlign: pw
                                                                    .TextAlign
                                                                    .center),
                                                          ),
                                                        ),
                                                      ),
                                                      pw.Expanded(
                                                        flex: 3,
                                                        child: pw.Container(
                                                          height: 25,
                                                          decoration:
                                                              pw.BoxDecoration(
                                                            border:
                                                                pw.Border.all(),
                                                          ),
                                                          child: pw.Center(
                                                            child: pw.Text(
                                                                numformat.format(
                                                                    double.parse(widget
                                                                        .objProvisional!
                                                                        .building![
                                                                            i]
                                                                        .maxsqm
                                                                        .toString())),
                                                                style: pw
                                                                    .TextStyle(
                                                                        fontSize:
                                                                            10),
                                                                textAlign: pw
                                                                    .TextAlign
                                                                    .center),
                                                          ),
                                                        ),
                                                      ),
                                                      pw.Expanded(
                                                        flex: 3,
                                                        child: pw.Container(
                                                          height: 25,
                                                          decoration:
                                                              pw.BoxDecoration(
                                                            border:
                                                                pw.Border.all(),
                                                          ),
                                                          child: pw.Center(
                                                            child: pw.Text(
                                                                numformat.format(double.parse(widget
                                                                    .objProvisional!
                                                                    .building![
                                                                        i]
                                                                    .totalmax
                                                                    .toString())),
                                                                style: pw
                                                                    .TextStyle(
                                                                        fontSize:
                                                                            10),
                                                                textAlign: pw
                                                                    .TextAlign
                                                                    .center),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                              pw.Row(
                                                mainAxisAlignment:
                                                    pw.MainAxisAlignment.center,
                                                children: [
                                                  pw.Expanded(
                                                    flex: 10,
                                                    child: pw.Container(
                                                      height: 25,
                                                      decoration:
                                                          pw.BoxDecoration(
                                                        border: pw.Border.all(),
                                                      ),
                                                      child: pw.Center(
                                                        child: pw.Text("Total",
                                                            style: pw.TextStyle(
                                                                fontSize: 10),
                                                            textAlign: pw
                                                                .TextAlign
                                                                .center),
                                                      ),
                                                    ),
                                                  ),
                                                  pw.Expanded(
                                                    flex: 4,
                                                    child: pw.Container(
                                                      height: 25,
                                                      decoration:
                                                          pw.BoxDecoration(
                                                        border: pw.Border.all(),
                                                      ),
                                                      child: pw.Center(
                                                        child: pw.Text(
                                                            numformat.format(
                                                                double.parse(widget
                                                                    .objProvisional!
                                                                    .totalbuildingsizesqm
                                                                    .toString())),
                                                            style: pw.TextStyle(
                                                                fontSize: 10),
                                                            textAlign: pw
                                                                .TextAlign
                                                                .center),
                                                      ),
                                                    ),
                                                  ),
                                                  pw.Expanded(
                                                    flex: 6,
                                                    child: pw.Container(
                                                      height: 25,
                                                      decoration:
                                                          pw.BoxDecoration(
                                                        border: pw.Border.all(),
                                                      ),
                                                      child: pw.Center(
                                                        child: pw.Text(
                                                            numformat.format(
                                                                double.parse(widget
                                                                    .objProvisional!
                                                                    .totalbuildingvaluemin
                                                                    .toString())),
                                                            style: pw.TextStyle(
                                                                fontSize: 10),
                                                            textAlign: pw
                                                                .TextAlign
                                                                .center),
                                                      ),
                                                    ),
                                                  ),
                                                  pw.Expanded(
                                                    flex: 6,
                                                    child: pw.Container(
                                                      height: 25,
                                                      decoration:
                                                          pw.BoxDecoration(
                                                        border: pw.Border.all(),
                                                      ),
                                                      child: pw.Center(
                                                        child: pw.Text(
                                                            numformat.format(
                                                                double.parse(widget
                                                                    .objProvisional!
                                                                    .totalbuildingvaluemax
                                                                    .toString())),
                                                            style: pw.TextStyle(
                                                                fontSize: 10),
                                                            textAlign: pw
                                                                .TextAlign
                                                                .center),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              pw.Row(
                                                mainAxisAlignment:
                                                    pw.MainAxisAlignment.center,
                                                children: [
                                                  pw.Expanded(
                                                    flex: 14,
                                                    child: pw.Container(
                                                      height: 25,
                                                      decoration:
                                                          pw.BoxDecoration(
                                                        border: pw.Border.all(),
                                                      ),
                                                      child: pw.Center(
                                                        child: pw.Text(
                                                            "Fair Market Value",
                                                            style: pw.TextStyle(
                                                                fontSize: 10),
                                                            textAlign: pw
                                                                .TextAlign
                                                                .center),
                                                      ),
                                                    ),
                                                  ),
                                                  pw.Expanded(
                                                    flex: 6,
                                                    child: pw.Container(
                                                      height: 25,
                                                      decoration:
                                                          pw.BoxDecoration(
                                                        border: pw.Border.all(),
                                                      ),
                                                      child: pw.Center(
                                                        child: pw.Text(
                                                            "${double.parse(widget.objProvisional!.totalbuildingvaluemin.toString())}",
                                                            style: pw.TextStyle(
                                                                fontSize: 10),
                                                            textAlign: pw
                                                                .TextAlign
                                                                .center),
                                                      ),
                                                    ),
                                                  ),
                                                  pw.Expanded(
                                                    flex: 6,
                                                    child: pw.Container(
                                                      height: 25,
                                                      decoration:
                                                          pw.BoxDecoration(
                                                        border: pw.Border.all(),
                                                      ),
                                                      child: pw.Center(
                                                        child: pw.Text(
                                                            "${double.parse(widget.objProvisional!.totalbuildingvaluemax.toString())}",
                                                            style: pw.TextStyle(
                                                                fontSize: 10),
                                                            textAlign: pw
                                                                .TextAlign
                                                                .center),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ] else if (widget.objCover!.header ==
                                    "Property CONDO REPORT") ...[
                                  pw.SizedBox(height: 10),
                                  pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.center,
                                    children: [
                                      pw.Expanded(
                                        flex: 3,
                                        child: pw.Container(
                                          alignment: pw.Alignment.center,
                                          height: 25,
                                          decoration: pw.BoxDecoration(
                                            border: pw.Border.all(),
                                          ),
                                          child: pw.Center(
                                            child: pw.Text("Subject Property",
                                                style: pw.TextStyle(
                                                  fontSize: 10,
                                                ),
                                                textAlign: pw.TextAlign.center),
                                          ),
                                        ),
                                      ),
                                      pw.Expanded(
                                        flex: 4,
                                        child: pw.Container(
                                          alignment: pw.Alignment.center,
                                          height: 25,
                                          decoration: pw.BoxDecoration(
                                            border: pw.Border.all(),
                                          ),
                                          child: pw.Center(
                                            child: pw.Text("Floor/Unit No.",
                                                style: pw.TextStyle(
                                                  fontSize: 10,
                                                ),
                                                textAlign: pw.TextAlign.center),
                                          ),
                                        ),
                                      ),
                                      pw.Expanded(
                                        flex: 3,
                                        child: pw.Container(
                                          height: 25,
                                          decoration: pw.BoxDecoration(
                                            border: pw.Border.all(),
                                          ),
                                          child: pw.Center(
                                            child: pw.Text("No.of Bedroom",
                                                style:
                                                    pw.TextStyle(fontSize: 10),
                                                textAlign: pw.TextAlign.center),
                                          ),
                                        ),
                                      ),
                                      pw.Expanded(
                                        flex: 4,
                                        child: pw.Container(
                                          height: 25,
                                          decoration: pw.BoxDecoration(
                                            border: pw.Border.all(),
                                          ),
                                          child: pw.Center(
                                            child: pw.Text("Gross Area (Sqm)",
                                                style:
                                                    pw.TextStyle(fontSize: 10),
                                                textAlign: pw.TextAlign.center),
                                          ),
                                        ),
                                      ),
                                      pw.Expanded(
                                        flex: 3,
                                        child: pw.Container(
                                          height: 25,
                                          decoration: pw.BoxDecoration(
                                            border: pw.Border.all(),
                                          ),
                                          child: pw.Center(
                                            child: pw.Text("\$/sqm(Min)",
                                                style:
                                                    pw.TextStyle(fontSize: 10),
                                                textAlign: pw.TextAlign.center),
                                          ),
                                        ),
                                      ),
                                      pw.Expanded(
                                        flex: 3,
                                        child: pw.Container(
                                          height: 25,
                                          decoration: pw.BoxDecoration(
                                            border: pw.Border.all(),
                                          ),
                                          child: pw.Center(
                                            child: pw.Text("Total(\$)",
                                                style:
                                                    pw.TextStyle(fontSize: 10),
                                                textAlign: pw.TextAlign.center),
                                          ),
                                        ),
                                      ),
                                      pw.Expanded(
                                        flex: 3,
                                        child: pw.Container(
                                          height: 25,
                                          decoration: pw.BoxDecoration(
                                            border: pw.Border.all(),
                                          ),
                                          child: pw.Center(
                                            child: pw.Text("\$/sqm(Max)",
                                                style:
                                                    pw.TextStyle(fontSize: 10),
                                                textAlign: pw.TextAlign.center),
                                          ),
                                        ),
                                      ),
                                      pw.Expanded(
                                        flex: 3,
                                        child: pw.Container(
                                          height: 25,
                                          decoration: pw.BoxDecoration(
                                            border: pw.Border.all(),
                                          ),
                                          child: pw.Center(
                                            child: pw.Text("Total(\$)",
                                                style:
                                                    pw.TextStyle(fontSize: 10),
                                                textAlign: pw.TextAlign.center),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  pw.Container(
                                    width: double.infinity,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(),
                                    ),
                                    child: pw.Row(
                                      children: [
                                        pw.Expanded(
                                          flex: 20,
                                          child: pw.Column(
                                            crossAxisAlignment:
                                                pw.CrossAxisAlignment.center,
                                            children: [
                                              if (widget.objProvisional!
                                                      .building!.length >=
                                                  1)
                                                for (int i = 0;
                                                    i <
                                                        widget.objProvisional!
                                                            .building!.length;
                                                    i++)
                                                  pw.Row(
                                                    mainAxisAlignment: pw
                                                        .MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      pw.Expanded(
                                                        flex: 3,
                                                        child: pw.Container(
                                                          height: 25,
                                                          decoration:
                                                              pw.BoxDecoration(
                                                            border:
                                                                pw.Border.all(),
                                                          ),
                                                          child: pw.Center(
                                                            child: pw.Text(
                                                                "Unit Condo",
                                                                style: pw
                                                                    .TextStyle(
                                                                        fontSize:
                                                                            10),
                                                                textAlign: pw
                                                                    .TextAlign
                                                                    .center),
                                                          ),
                                                        ),
                                                      ),
                                                      pw.Expanded(
                                                        flex: 4,
                                                        child: pw.Container(
                                                          height: 25,
                                                          decoration:
                                                              pw.BoxDecoration(
                                                            border:
                                                                pw.Border.all(),
                                                          ),
                                                          child: pw.Center(
                                                            child: pw.Text(
                                                                "${widget.objProvisional!.building![i].floorno}",
                                                                style: pw
                                                                    .TextStyle(
                                                                        fontSize:
                                                                            10),
                                                                textAlign: pw
                                                                    .TextAlign
                                                                    .center),
                                                          ),
                                                        ),
                                                      ),
                                                      pw.Expanded(
                                                        flex: 3,
                                                        child: pw.Container(
                                                          height: 25,
                                                          decoration:
                                                              pw.BoxDecoration(
                                                            border:
                                                                pw.Border.all(),
                                                          ),
                                                          child: pw.Center(
                                                            child: pw.Text(
                                                                "${widget.objProvisional!.building![i].bedroomno}",
                                                                style: pw
                                                                    .TextStyle(
                                                                        fontSize:
                                                                            10),
                                                                textAlign: pw
                                                                    .TextAlign
                                                                    .center),
                                                          ),
                                                        ),
                                                      ),
                                                      pw.Expanded(
                                                        flex: 4,
                                                        child: pw.Container(
                                                          height: 25,
                                                          decoration:
                                                              pw.BoxDecoration(
                                                            border:
                                                                pw.Border.all(),
                                                          ),
                                                          child: pw.Center(
                                                            child: pw.Text(
                                                                numformat.format(
                                                                    double.parse(widget
                                                                        .objProvisional!
                                                                        .building![
                                                                            i]
                                                                        .sizesqm
                                                                        .toString())),
                                                                style: pw
                                                                    .TextStyle(
                                                                        fontSize:
                                                                            10),
                                                                textAlign: pw
                                                                    .TextAlign
                                                                    .center),
                                                          ),
                                                        ),
                                                      ),
                                                      pw.Expanded(
                                                        flex: 3,
                                                        child: pw.Container(
                                                          height: 25,
                                                          decoration:
                                                              pw.BoxDecoration(
                                                            border:
                                                                pw.Border.all(),
                                                          ),
                                                          child: pw.Center(
                                                            child: pw.Text(
                                                                numformat.format(
                                                                    double.parse(widget
                                                                        .objProvisional!
                                                                        .building![
                                                                            i]
                                                                        .minsqm
                                                                        .toString())),
                                                                style: pw
                                                                    .TextStyle(
                                                                        fontSize:
                                                                            10),
                                                                textAlign: pw
                                                                    .TextAlign
                                                                    .center),
                                                          ),
                                                        ),
                                                      ),
                                                      pw.Expanded(
                                                        flex: 3,
                                                        child: pw.Container(
                                                          height: 25,
                                                          decoration:
                                                              pw.BoxDecoration(
                                                            border:
                                                                pw.Border.all(),
                                                          ),
                                                          child: pw.Center(
                                                            child: pw.Text(
                                                                numformat.format(double.parse(widget
                                                                    .objProvisional!
                                                                    .building![
                                                                        i]
                                                                    .totalmin
                                                                    .toString())),
                                                                style: pw
                                                                    .TextStyle(
                                                                        fontSize:
                                                                            10),
                                                                textAlign: pw
                                                                    .TextAlign
                                                                    .center),
                                                          ),
                                                        ),
                                                      ),
                                                      pw.Expanded(
                                                        flex: 3,
                                                        child: pw.Container(
                                                          height: 25,
                                                          decoration:
                                                              pw.BoxDecoration(
                                                            border:
                                                                pw.Border.all(),
                                                          ),
                                                          child: pw.Center(
                                                            child: pw.Text(
                                                                numformat.format(
                                                                    double.parse(widget
                                                                        .objProvisional!
                                                                        .building![
                                                                            i]
                                                                        .maxsqm
                                                                        .toString())),
                                                                style: pw
                                                                    .TextStyle(
                                                                        fontSize:
                                                                            10),
                                                                textAlign: pw
                                                                    .TextAlign
                                                                    .center),
                                                          ),
                                                        ),
                                                      ),
                                                      pw.Expanded(
                                                        flex: 3,
                                                        child: pw.Container(
                                                          height: 25,
                                                          decoration:
                                                              pw.BoxDecoration(
                                                            border:
                                                                pw.Border.all(),
                                                          ),
                                                          child: pw.Center(
                                                            child: pw.Text(
                                                                numformat.format(double.parse(widget
                                                                    .objProvisional!
                                                                    .building![
                                                                        i]
                                                                    .totalmax
                                                                    .toString())),
                                                                style: pw
                                                                    .TextStyle(
                                                                        fontSize:
                                                                            10),
                                                                textAlign: pw
                                                                    .TextAlign
                                                                    .center),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                              pw.Row(
                                                mainAxisAlignment:
                                                    pw.MainAxisAlignment.center,
                                                children: [
                                                  pw.Expanded(
                                                    flex: 10,
                                                    child: pw.Container(
                                                      height: 25,
                                                      decoration:
                                                          pw.BoxDecoration(
                                                        border: pw.Border.all(),
                                                      ),
                                                      child: pw.Center(
                                                        child: pw.Text("Total",
                                                            style: pw.TextStyle(
                                                                fontSize: 10),
                                                            textAlign: pw
                                                                .TextAlign
                                                                .center),
                                                      ),
                                                    ),
                                                  ),
                                                  pw.Expanded(
                                                    flex: 4,
                                                    child: pw.Container(
                                                      height: 25,
                                                      decoration:
                                                          pw.BoxDecoration(
                                                        border: pw.Border.all(),
                                                      ),
                                                      child: pw.Center(
                                                        child: pw.Text(
                                                            numformat.format(
                                                                double.parse(widget
                                                                    .objProvisional!
                                                                    .totalbuildingsizesqm
                                                                    .toString())),
                                                            style: pw.TextStyle(
                                                                fontSize: 10),
                                                            textAlign: pw
                                                                .TextAlign
                                                                .center),
                                                      ),
                                                    ),
                                                  ),
                                                  pw.Expanded(
                                                    flex: 6,
                                                    child: pw.Container(
                                                      height: 25,
                                                      decoration:
                                                          pw.BoxDecoration(
                                                        border: pw.Border.all(),
                                                      ),
                                                      child: pw.Center(
                                                        child: pw.Text(
                                                            numformat.format(
                                                                double.parse(widget
                                                                    .objProvisional!
                                                                    .totalbuildingvaluemin
                                                                    .toString())),
                                                            style: pw.TextStyle(
                                                                fontSize: 10),
                                                            textAlign: pw
                                                                .TextAlign
                                                                .center),
                                                      ),
                                                    ),
                                                  ),
                                                  pw.Expanded(
                                                    flex: 6,
                                                    child: pw.Container(
                                                      height: 25,
                                                      decoration:
                                                          pw.BoxDecoration(
                                                        border: pw.Border.all(),
                                                      ),
                                                      child: pw.Center(
                                                        child: pw.Text(
                                                            numformat.format(
                                                                double.parse(widget
                                                                    .objProvisional!
                                                                    .totalbuildingvaluemax
                                                                    .toString())),
                                                            style: pw.TextStyle(
                                                                fontSize: 10),
                                                            textAlign: pw
                                                                .TextAlign
                                                                .center),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              pw.Row(
                                                mainAxisAlignment:
                                                    pw.MainAxisAlignment.center,
                                                children: [
                                                  pw.Expanded(
                                                    flex: 14,
                                                    child: pw.Container(
                                                      height: 25,
                                                      decoration:
                                                          pw.BoxDecoration(
                                                        border: pw.Border.all(),
                                                      ),
                                                      child: pw.Center(
                                                        child: pw.Text(
                                                            "Fair Market Value",
                                                            style: pw.TextStyle(
                                                                fontSize: 10),
                                                            textAlign: pw
                                                                .TextAlign
                                                                .center),
                                                      ),
                                                    ),
                                                  ),
                                                  pw.Expanded(
                                                    flex: 6,
                                                    child: pw.Container(
                                                      height: 25,
                                                      decoration:
                                                          pw.BoxDecoration(
                                                        border: pw.Border.all(),
                                                      ),
                                                      child: pw.Center(
                                                        child: pw.Text(
                                                            numformat.format(
                                                                double.parse(widget
                                                                    .objProvisional!
                                                                    .totalbuildingvaluemin
                                                                    .toString())),
                                                            style: pw.TextStyle(
                                                                fontSize: 10),
                                                            textAlign: pw
                                                                .TextAlign
                                                                .center),
                                                      ),
                                                    ),
                                                  ),
                                                  pw.Expanded(
                                                    flex: 6,
                                                    child: pw.Container(
                                                      height: 25,
                                                      decoration:
                                                          pw.BoxDecoration(
                                                        border: pw.Border.all(),
                                                      ),
                                                      child: pw.Center(
                                                        child: pw.Text(
                                                            numformat.format(
                                                                double.parse(widget
                                                                    .objProvisional!
                                                                    .totalbuildingvaluemax
                                                                    .toString())),
                                                            style: pw.TextStyle(
                                                                fontSize: 10),
                                                            textAlign: pw
                                                                .TextAlign
                                                                .center),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                                pw.SizedBox(height: 10),
                                if (widget.objCover!.header !=
                                    "Property LAND VALUATION REPORT") ...[
                                  pw.RichText(
                                    text: pw.TextSpan(
                                      text: 'Fire Insurance',
                                      style: header2(true), // Base style
                                    ),
                                  ),
                                  pw.RichText(
                                    text: pw.TextSpan(
                                      text:
                                          'Based on the methodical collection of data for our inspection to the Subject Building, the current estimated value for Fire Insurance is as follow:',
                                      style: body(), // Base style
                                    ),
                                  ),
                                  pw.SizedBox(height: 20),
                                  pw.Row(children: [
                                    pw.RichText(
                                      text: pw.TextSpan(
                                        text: 'Fire Insurance Value : ',
                                        style: header2(true), // Base style
                                      ),
                                    ),
                                    pw.RichText(
                                      text: pw.TextSpan(
                                        text:
                                            '\$${numformat.format(double.parse(widget.objProvisional!.fire_insurance.toString()))}',
                                        style: header2(false), // Base style
                                      ),
                                    ),
                                  ]),
                                  pw.RichText(
                                    text: pw.TextSpan(
                                      text: fireinWord,
                                      style: header2(false), // Base style
                                    ),
                                  ),
                                ],
                                pw.SizedBox(height: 20),
                                pw.RichText(
                                  text: pw.TextSpan(
                                    text: 'Force Sale Value',
                                    style: header2(true), // Base style
                                  ),
                                ),
                                pw.RichText(
                                  text: pw.TextSpan(
                                    text:
                                        'In attempt to get a current force sale value where clients sell off foreclosed the subject property quickly, the estimated value for Force Sale is as follow:',
                                    style: body(), // Base style
                                  ),
                                ),
                                pw.SizedBox(height: 20),
                                pw.Row(
                                  children: [
                                    pw.RichText(
                                      text: pw.TextSpan(
                                        text: 'Force Sale Value : ',
                                        style: header2(true), // Base style
                                      ),
                                    ),
                                    pw.RichText(
                                      text: pw.TextSpan(
                                        children: [
                                          if (widget.objCover!.header !=
                                              "Property LAND VALUATION REPORT") ...[
                                            pw.TextSpan(
                                              text:
                                                  '\$ ${numformat.format(double.parse(widget.objProvisional!.totalbuildingvaluemin.toString()) - (double.parse(widget.objProvisional!.totalbuildingvaluemin.toString()) * (double.parse(widget.objProvisional!.force_sale.toString()) / 100)))}',
                                              style:
                                                  header2(false), // Base style
                                            ),
                                            pw.TextSpan(
                                              text: ' to ',
                                              style: header2(
                                                  true), // Base style for "to"
                                            ),
                                            pw.TextSpan(
                                              text:
                                                  '\$ ${numformat.format(double.parse(widget.objProvisional!.totalbuildingvaluemax.toString()) - (double.parse(widget.objProvisional!.totalbuildingvaluemax.toString()) * (double.parse(widget.objProvisional!.force_sale.toString()) / 100)))}',
                                              style:
                                                  header2(false), // Base style
                                            ),
                                          ] else ...[
                                            pw.TextSpan(
                                              text:
                                                  '\$ ${numformat.format(double.parse(widget.objProvisional!.totallandvaluemin.toString()) - (double.parse(widget.objProvisional!.totallandvaluemin.toString()) * (double.parse(widget.objProvisional!.force_sale.toString()) / 100)))}',
                                              style:
                                                  header2(false), // Base style
                                            ),
                                            pw.TextSpan(
                                              text: ' to ',
                                              style: header2(
                                                  true), // Base style for "to"
                                            ),
                                            pw.TextSpan(
                                              text:
                                                  '\$ ${numformat.format(double.parse(widget.objProvisional!.totallandvaluemax.toString()) - (double.parse(widget.objProvisional!.totallandvaluemax.toString()) * (double.parse(widget.objProvisional!.force_sale.toString()) / 100)))}',
                                              style:
                                                  header2(false), // Base style
                                            ),
                                          ]
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                pw.SizedBox(height: 25),
                                pw.Row(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.RichText(
                                      text: pw.TextSpan(
                                        text: 'Please Note: ',
                                        style: header2(true), // Base style
                                      ),
                                    ),
                                    pw.Expanded(
                                      child: pw.RichText(
                                        text: pw.TextSpan(
                                          text:
                                              'This is a provisional valuation made without recourse to other parties or to Other valuation data help by Cambodia Angkor Real Estate Co. Ltd.',
                                          style: body(), // Base style
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ) // Add margin here
                            )),
                  ),
                )),
              ],
            ),
          );
        },
      ),
    );

    var parts = widget.objFinalIndication!.verified_by.toString().split('24k');
    var controll =
        widget.objFinalIndication!.controlled_by.toString().split('24k');
    // //Page Eighteen
    pdf.addPage(pw.Page(
        pageTheme: pageTheme,
        build: (final context) {
          return pw.FullPage(
              ignoreMargins: true,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Container(
                    margin: const pw.EdgeInsets.only(
                        top: 25, right: 25), // Add margin here
                    child: pw.Text(
                      "©BY CAMBODIA ANGKOR REAL ESTATE CO., LTD",
                      style: pw.TextStyle(fontSize: 9, font: font),
                    ),
                  ),
                  pw.Expanded(
                      child: pw.Container(
                    margin: const pw.EdgeInsets.only(
                        top: 5, left: 40, right: 25, bottom: 25),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(
                        color: PdfColors.black,
                        width: 2, // Adjust border width as needed
                      ),
                    ),
                    child: pw.Center(
                      child: pw.Padding(
                          padding: const pw.EdgeInsets.only(
                              top: 10, left: 15, right: 15),
                          child: pw.Padding(
                              padding: pw.EdgeInsets.only(left: 20, bottom: 50),
                              child: pw.Column(
                                children: [
                                  pw.Text(
                                      'Final Indication of Subject Property Market Value',
                                      style: header1(),
                                      textAlign: pw.TextAlign.center),
                                  pw.SizedBox(height: 20),
                                  pw.RichText(
                                    text: pw.TextSpan(
                                      text: '        ',
                                      style: body(), // Base style
                                      children: [
                                        pw.TextSpan(
                                          text:
                                              'Cambodia Angkor Real Estate Co.,Ltd ',
                                          style: b_body(),
                                        ),
                                        pw.TextSpan(
                                          text:
                                              'having considered the local and national market prices of similar property, hereby makes the following evaluation of the ',
                                          style: body(),
                                        ),
                                        if (widget.objCover!.header ==
                                            "Property [LAND AND BUILDING] VALUATION REPORT") ...[
                                          pw.TextSpan(
                                              text: ' [Land and Building] ',
                                              style: b_body()),
                                        ] else if (widget.objCover!.header ==
                                            "Property LAND VALUATION REPORT") ...[
                                          pw.TextSpan(
                                              text: ' [Land] ',
                                              style: b_body()),
                                        ] else if (widget.objCover!.header ==
                                            "Property OFFICE SPACE VALUATION REPORT") ...[
                                          pw.TextSpan(
                                              text: ' [Office Space] ',
                                              style: b_body()),
                                        ] else ...[
                                          pw.TextSpan(
                                              text: ' [Condo] ',
                                              style: b_body()),
                                        ],
                                        pw.TextSpan(
                                          text:
                                              ' that is the subject of this report.  ',
                                          style: body(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  pw.SizedBox(height: 10),
                                  // Test
                                  pw.RichText(
                                    text: pw.TextSpan(
                                      text: '        ',
                                      style: body(), // Base style
                                      children: [
                                        pw.TextSpan(
                                            text:
                                                'Cambodia Angkor Real Estate Co.,Ltd ',
                                            style: b_body()),
                                        pw.TextSpan(
                                          text:
                                              '\thaving undertaken all reasonable measures to ensure the accuracy of the information contained in this ',
                                          style: body(),
                                        ),
                                        if (widget.objCover!.header ==
                                            "Property [LAND AND BUILDING] VALUATION REPORT") ...[
                                          pw.TextSpan(
                                            text: ' [Land and Building] ',
                                            style: b_body(),
                                          ),
                                        ] else if (widget.objCover!.header ==
                                            "Property LAND VALUATION REPORT") ...[
                                          pw.TextSpan(
                                            text: ' [Land] ',
                                            style: b_body(),
                                          ),
                                        ] else if (widget.objCover!.header ==
                                            "Property OFFICE SPACE VALUATION REPORT") ...[
                                          pw.TextSpan(
                                            text: ' [Office Space] ',
                                            style: b_body(),
                                          ),
                                        ] else ...[
                                          pw.TextSpan(
                                            text: ' [Condo] ',
                                            style: b_body(),
                                          ),
                                        ],
                                        pw.TextSpan(
                                          text: 'owned by  ',
                                          style: body(),
                                        ),
                                        pw.TextSpan(
                                          text:
                                              '${widget.objCover!.ownername} ',
                                          style: b_body(),
                                        ),
                                        pw.TextSpan(
                                          text: 'with Title Deed No: ',
                                          style: body(),
                                        ),
                                        pw.TextSpan(
                                          text:
                                              '${widget.objCover!.deeptitle} ',
                                          style: b_body(),
                                        ),
                                        pw.TextSpan(
                                          text:
                                              'located in residential and commercial area, certifies that the ',
                                          style: body(),
                                        ),
                                        pw.TextSpan(
                                          text: 'Property Valuation ',
                                          style: b_body(),
                                        ),
                                        pw.TextSpan(
                                          text:
                                              'is true and accurate as of the date of this report.',
                                          style: body(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (widget.objCover!.header ==
                                      "Property [LAND AND BUILDING] VALUATION REPORT") ...[
                                    pw.SizedBox(height: 10),
                                    pw.Row(
                                        mainAxisAlignment:
                                            pw.MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            pw.CrossAxisAlignment.center,
                                        children: [
                                          pw.Expanded(
                                              flex: 2,
                                              child: pw.Container(
                                                  height: 25,
                                                  decoration: pw.BoxDecoration(
                                                      border: pw.Border.all()),
                                                  child: pw.Center(
                                                      child: pw.Text("No",
                                                          style: pw.TextStyle(
                                                              fontSize: 10))))),
                                          pw.Expanded(
                                              flex: 5,
                                              child: pw.Container(
                                                  height: 25,
                                                  decoration: pw.BoxDecoration(
                                                      border: pw.Border.all()),
                                                  child: pw.Center(
                                                      child: pw.Text(
                                                          "Subject Property",
                                                          style: pw.TextStyle(
                                                              fontSize: 10))))),
                                          pw.Expanded(
                                              flex: 3,
                                              child: pw.Container(
                                                  height: 25,
                                                  decoration: pw.BoxDecoration(
                                                      border: pw.Border.all()),
                                                  child: pw.Center(
                                                      child: pw.Text("Size Sqm",
                                                          style: pw.TextStyle(
                                                              fontSize: 10))))),
                                          pw.Expanded(
                                              flex: 3,
                                              child: pw.Container(
                                                  height: 25,
                                                  decoration: pw.BoxDecoration(
                                                      border: pw.Border.all()),
                                                  child: pw.Center(
                                                      child: pw.Text(
                                                          "Size Sqft",
                                                          style: pw.TextStyle(
                                                              fontSize: 10))))),
                                          pw.Expanded(
                                              flex: 6,
                                              child: pw.Container(
                                                  height: 25,
                                                  decoration: pw.BoxDecoration(
                                                      border: pw.Border.all()),
                                                  child: pw.Center(
                                                      child: pw.Text(
                                                          "Property Value USD/Sqm",
                                                          style: pw.TextStyle(
                                                              fontSize: 10))))),
                                          pw.Expanded(
                                              flex: 6,
                                              child: pw.Container(
                                                  height: 25,
                                                  decoration: pw.BoxDecoration(
                                                      border: pw.Border.all()),
                                                  child: pw.Center(
                                                      child: pw.Text(
                                                          "Property Value",
                                                          style: pw.TextStyle(
                                                              fontSize: 10))))),
                                        ]),
                                    pw.Container(
                                      width: double.infinity,
                                      decoration: pw.BoxDecoration(
                                        border: pw.Border.all(),
                                      ),
                                      child: pw.Row(
                                        children: [
                                          pw.Expanded(
                                            flex: 20,
                                            child: pw.Column(
                                              crossAxisAlignment:
                                                  pw.CrossAxisAlignment.center,
                                              children: [
                                                pw.Row(
                                                    mainAxisAlignment: pw
                                                        .MainAxisAlignment
                                                        .start,
                                                    crossAxisAlignment: pw
                                                        .CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      pw.Expanded(
                                                          flex: 20,
                                                          child: pw.Container(
                                                              height: 25,
                                                              decoration: pw
                                                                  .BoxDecoration(
                                                                      border: pw
                                                                              .Border
                                                                          .all()),
                                                              child: pw.Center(
                                                                  child: pw.Text(
                                                                      "A.Land")))),
                                                    ]),
                                                if (widget.objFinalIndication!
                                                        .land!.length >=
                                                    1)
                                                  for (int i = 0;
                                                      i <
                                                          widget
                                                              .objFinalIndication!
                                                              .land!
                                                              .length;
                                                      i++)
                                                    pw.Row(
                                                        mainAxisAlignment: pw
                                                            .MainAxisAlignment
                                                            .center,
                                                        crossAxisAlignment: pw
                                                            .CrossAxisAlignment
                                                            .center,
                                                        children: [
                                                          pw.Expanded(
                                                              flex: 2,
                                                              child: pw.Container(
                                                                  height: 25,
                                                                  decoration: pw.BoxDecoration(
                                                                      border: pw
                                                                              .Border
                                                                          .all()),
                                                                  child: pw.Center(
                                                                      child: pw.Text(
                                                                          "${widget.objFinalIndication!.land![i].no}",
                                                                          style:
                                                                              pw.TextStyle(fontSize: 10))))),
                                                          pw.Expanded(
                                                              flex: 5,
                                                              child: pw.Container(
                                                                  height: 25,
                                                                  decoration: pw.BoxDecoration(
                                                                      border: pw
                                                                              .Border
                                                                          .all()),
                                                                  child: pw.Center(
                                                                      child: pw.Text(
                                                                          "Land",
                                                                          style:
                                                                              pw.TextStyle(fontSize: 10))))),
                                                          pw.Expanded(
                                                              flex: 3,
                                                              child: pw.Container(
                                                                  height: 25,
                                                                  decoration: pw.BoxDecoration(
                                                                      border: pw
                                                                              .Border
                                                                          .all()),
                                                                  child: pw.Center(
                                                                      child: pw.Text(
                                                                          "${numformat.format(double.parse(widget.objFinalIndication!.land![i].sizesqm.toString()))}",
                                                                          style:
                                                                              pw.TextStyle(fontSize: 10))))),
                                                          pw.Expanded(
                                                              flex: 3,
                                                              child: pw.Container(
                                                                  height: 25,
                                                                  decoration: pw.BoxDecoration(
                                                                      border: pw
                                                                              .Border
                                                                          .all()),
                                                                  child: pw.Center(
                                                                      child: pw.Text(
                                                                          "${numformat.format(double.parse(widget.objFinalIndication!.land![i].sizesqft.toString()))}",
                                                                          style:
                                                                              pw.TextStyle(fontSize: 10))))),
                                                          pw.Expanded(
                                                              flex: 6,
                                                              child: pw.Container(
                                                                  height: 25,
                                                                  decoration: pw.BoxDecoration(
                                                                      border: pw
                                                                              .Border
                                                                          .all()),
                                                                  child: pw.Center(
                                                                      child: pw.Text(
                                                                          "${numformat.format(double.parse(widget.objFinalIndication!.land![i].valuesqm.toString()))}",
                                                                          style:
                                                                              pw.TextStyle(fontSize: 10))))),
                                                          pw.Expanded(
                                                              flex: 6,
                                                              child: pw.Container(
                                                                  height: 25,
                                                                  decoration: pw.BoxDecoration(
                                                                      border: pw
                                                                              .Border
                                                                          .all()),
                                                                  child: pw.Center(
                                                                      child: pw.Text(
                                                                          "${numformat.format(double.parse(widget.objFinalIndication!.land![i].propertyvalue.toString()))}",
                                                                          style:
                                                                              pw.TextStyle(fontSize: 10))))),
                                                        ]),
                                                pw.Row(
                                                    mainAxisAlignment: pw
                                                        .MainAxisAlignment
                                                        .center,
                                                    crossAxisAlignment: pw
                                                        .CrossAxisAlignment
                                                        .center,
                                                    children: [
                                                      pw.Expanded(
                                                          flex: 7,
                                                          child: pw.Container(
                                                              height: 25,
                                                              decoration: pw
                                                                  .BoxDecoration(
                                                                      border: pw
                                                                              .Border
                                                                          .all()),
                                                              child: pw.Center(
                                                                  child: pw.Text(
                                                                      "Total",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              10))))),
                                                      pw.Expanded(
                                                          flex: 3,
                                                          child: pw.Container(
                                                              height: 25,
                                                              decoration: pw
                                                                  .BoxDecoration(
                                                                      border: pw
                                                                              .Border
                                                                          .all()),
                                                              child: pw.Center(
                                                                  child: pw.Text(
                                                                      "${numformat.format(double.parse(widget.objFinalIndication!.totallandsizesqm.toString()))}",
                                                                      style: pw.TextStyle(
                                                                          color: PdfColors
                                                                              .red,
                                                                          fontSize:
                                                                              10))))),
                                                      pw.Expanded(
                                                          flex: 3,
                                                          child: pw.Container(
                                                              height: 25,
                                                              decoration: pw
                                                                  .BoxDecoration(
                                                                      border: pw
                                                                              .Border
                                                                          .all()),
                                                              child: pw.Center(
                                                                  child: pw.Text(
                                                                      "${numformat.format(double.parse(widget.objFinalIndication!.land![0].sizesqft.toString()))}",
                                                                      style: pw.TextStyle(
                                                                          color: PdfColors
                                                                              .red,
                                                                          fontSize:
                                                                              10))))),
                                                      pw.Expanded(
                                                          flex: 12,
                                                          child: pw.Container(
                                                              height: 25,
                                                              decoration: pw
                                                                  .BoxDecoration(
                                                                      border: pw
                                                                              .Border
                                                                          .all()),
                                                              child: pw.Center(
                                                                  child: pw.Text(
                                                                      "${numformat.format(double.parse(widget.objFinalIndication!.totallandvalue.toString()))}",
                                                                      style: pw.TextStyle(
                                                                          color: PdfColors
                                                                              .red,
                                                                          fontSize:
                                                                              10)))))
                                                    ]),
                                                pw.Row(
                                                    mainAxisAlignment: pw
                                                        .MainAxisAlignment
                                                        .start,
                                                    crossAxisAlignment: pw
                                                        .CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      pw.Expanded(
                                                          flex: 20,
                                                          child: pw.Container(
                                                              height: 25,
                                                              decoration: pw
                                                                  .BoxDecoration(
                                                                      border: pw
                                                                              .Border
                                                                          .all()),
                                                              child: pw.Center(
                                                                  child: pw.Text(
                                                                      "B.Building")))),
                                                    ]),
                                                if (widget.objFinalIndication!
                                                        .building!.length >=
                                                    1)
                                                  for (int i = 0;
                                                      i <
                                                          widget
                                                              .objFinalIndication!
                                                              .building!
                                                              .length;
                                                      i++)
                                                    pw.Row(
                                                        mainAxisAlignment: pw
                                                            .MainAxisAlignment
                                                            .center,
                                                        crossAxisAlignment: pw
                                                            .CrossAxisAlignment
                                                            .center,
                                                        children: [
                                                          pw.Expanded(
                                                              flex: 2,
                                                              child: pw.Container(
                                                                  height: 25,
                                                                  decoration: pw.BoxDecoration(
                                                                      border: pw
                                                                              .Border
                                                                          .all()),
                                                                  child: pw.Center(
                                                                      child: pw.Text(
                                                                          "${widget.objFinalIndication!.building![i].no}",
                                                                          style:
                                                                              pw.TextStyle(fontSize: 10))))),
                                                          pw.Expanded(
                                                              flex: 5,
                                                              child: pw.Container(
                                                                  height: 25,
                                                                  decoration: pw.BoxDecoration(
                                                                      border: pw
                                                                              .Border
                                                                          .all()),
                                                                  child: pw.Center(
                                                                      child: pw.Text(
                                                                          "Building",
                                                                          style:
                                                                              pw.TextStyle(fontSize: 10))))),
                                                          pw.Expanded(
                                                              flex: 3,
                                                              child: pw.Container(
                                                                  height: 25,
                                                                  decoration: pw.BoxDecoration(
                                                                      border: pw
                                                                              .Border
                                                                          .all()),
                                                                  child: pw.Center(
                                                                      child: pw.Text(
                                                                          "${numformat.format(double.parse(widget.objFinalIndication!.building![i].sizesqm.toString()))}",
                                                                          style:
                                                                              pw.TextStyle(fontSize: 10))))),
                                                          pw.Expanded(
                                                              flex: 3,
                                                              child: pw.Container(
                                                                  height: 25,
                                                                  decoration: pw.BoxDecoration(
                                                                      border: pw
                                                                              .Border
                                                                          .all()),
                                                                  child: pw.Center(
                                                                      child: pw.Text(
                                                                          "${numformat.format(double.parse(widget.objFinalIndication!.building![i].sizesqft.toString()))}",
                                                                          style:
                                                                              pw.TextStyle(fontSize: 10))))),
                                                          pw.Expanded(
                                                              flex: 6,
                                                              child: pw.Container(
                                                                  height: 25,
                                                                  decoration: pw.BoxDecoration(
                                                                      border: pw
                                                                              .Border
                                                                          .all()),
                                                                  child: pw.Center(
                                                                      child: pw.Text(
                                                                          "${numformat.format(double.parse(widget.objFinalIndication!.building![i].valuesqm.toString()))}",
                                                                          style:
                                                                              pw.TextStyle(fontSize: 10))))),
                                                          pw.Expanded(
                                                              flex: 6,
                                                              child: pw.Container(
                                                                  height: 25,
                                                                  decoration: pw.BoxDecoration(
                                                                      border: pw
                                                                              .Border
                                                                          .all()),
                                                                  child: pw.Center(
                                                                      child: pw.Text(
                                                                          "${numformat.format(double.parse(widget.objFinalIndication!.building![i].propertyvalue.toString()))}",
                                                                          style:
                                                                              pw.TextStyle(fontSize: 10))))),
                                                        ]),
                                                pw.Row(
                                                    mainAxisAlignment: pw
                                                        .MainAxisAlignment
                                                        .center,
                                                    crossAxisAlignment: pw
                                                        .CrossAxisAlignment
                                                        .center,
                                                    children: [
                                                      pw.Expanded(
                                                          flex: 7,
                                                          child: pw.Container(
                                                              height: 25,
                                                              decoration: pw
                                                                  .BoxDecoration(
                                                                      border: pw
                                                                              .Border
                                                                          .all()),
                                                              child: pw.Center(
                                                                  child: pw.Text(
                                                                      "Total",
                                                                      style: pw.TextStyle(
                                                                          fontSize:
                                                                              10))))),
                                                      pw.Expanded(
                                                          flex: 3,
                                                          child: pw.Container(
                                                              height: 25,
                                                              decoration: pw
                                                                  .BoxDecoration(
                                                                      border: pw
                                                                              .Border
                                                                          .all()),
                                                              child: pw.Center(
                                                                  child: pw.Text(
                                                                      "${numformat.format(double.parse(widget.objFinalIndication!.totalbuildingsizesqm.toString()))}",
                                                                      style: pw.TextStyle(
                                                                          color: PdfColors
                                                                              .red,
                                                                          fontSize:
                                                                              10))))),
                                                      pw.Expanded(
                                                          flex: 3,
                                                          child: pw.Container(
                                                              height: 25,
                                                              decoration: pw
                                                                  .BoxDecoration(
                                                                      border: pw
                                                                              .Border
                                                                          .all()),
                                                              child: pw.Center(
                                                                  child: pw.Text(
                                                                      "${numformat.format(double.parse(widget.objFinalIndication!.building![0].sizesqft.toString()))}",
                                                                      style: pw.TextStyle(
                                                                          color: PdfColors
                                                                              .red,
                                                                          fontSize:
                                                                              10))))),
                                                      pw.Expanded(
                                                          flex: 12,
                                                          child: pw.Container(
                                                              height: 25,
                                                              decoration: pw
                                                                  .BoxDecoration(
                                                                      border: pw
                                                                              .Border
                                                                          .all()),
                                                              child: pw.Center(
                                                                  child: pw.Text(
                                                                      "${numformat.format(double.parse(widget.objFinalIndication!.totalbuildingvalue.toString()))}",
                                                                      style: pw.TextStyle(
                                                                          color: PdfColors
                                                                              .red,
                                                                          fontSize:
                                                                              10)))))
                                                    ]),
                                                pw.Row(
                                                  mainAxisAlignment: pw
                                                      .MainAxisAlignment.center,
                                                  crossAxisAlignment: pw
                                                      .CrossAxisAlignment
                                                      .center,
                                                  children: [
                                                    pw.Expanded(
                                                      flex: 7,
                                                      child: pw.Container(
                                                        height: 50,
                                                        decoration:
                                                            pw.BoxDecoration(
                                                          border:
                                                              pw.Border.all(),
                                                        ),
                                                        child: pw.Center(
                                                          child: pw.Text(
                                                            "Fair Market Value",
                                                            style: pw.TextStyle(
                                                                fontSize: 10),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    pw.Expanded(
                                                      flex: 18,
                                                      child: pw.Container(
                                                        height: 50,
                                                        child: pw.Column(
                                                          mainAxisAlignment: pw
                                                              .MainAxisAlignment
                                                              .start,
                                                          children: [
                                                            pw.Expanded(
                                                              flex: 18,
                                                              child:
                                                                  pw.Container(
                                                                height: 25,
                                                                decoration: pw
                                                                    .BoxDecoration(
                                                                  border:
                                                                      pw.Border
                                                                          .all(),
                                                                ),
                                                                child:
                                                                    pw.Center(
                                                                  child:
                                                                      pw.Text(
                                                                    "\$ ${numformat.format(double.parse(widget.objFinalIndication!.totallandvalue.toString()) + double.parse(widget.objFinalIndication!.totalbuildingvalue.toString()))}",
                                                                    style: pw.TextStyle(
                                                                        color: PdfColors
                                                                            .red,
                                                                        fontSize:
                                                                            10,
                                                                        decoration: pw
                                                                            .TextDecoration
                                                                            .underline),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            pw.Expanded(
                                                              flex: 18,
                                                              child:
                                                                  pw.Container(
                                                                height: 25,
                                                                decoration: pw
                                                                    .BoxDecoration(
                                                                  border:
                                                                      pw.Border
                                                                          .all(),
                                                                ),
                                                                child:
                                                                    pw.Center(
                                                                  child:
                                                                      pw.Text(
                                                                    moneyInWords,
                                                                    style: pw
                                                                        .TextStyle(
                                                                      color: PdfColors
                                                                          .red,
                                                                      fontSize:
                                                                          10,
                                                                      decoration: pw
                                                                          .TextDecoration
                                                                          .underline,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ] else if (widget.objCover!.header ==
                                      "Property LAND VALUATION REPORT") ...[
                                    pw.SizedBox(height: 10),
                                    pw.Row(
                                        mainAxisAlignment:
                                            pw.MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            pw.CrossAxisAlignment.center,
                                        children: [
                                          pw.Expanded(
                                              flex: 2,
                                              child: pw.Container(
                                                  height: 25,
                                                  decoration: pw.BoxDecoration(
                                                      border: pw.Border.all()),
                                                  child: pw.Center(
                                                      child: pw.Text("No",
                                                          style: pw.TextStyle(
                                                              fontSize: 10))))),
                                          pw.Expanded(
                                              flex: 5,
                                              child: pw.Container(
                                                  height: 25,
                                                  decoration: pw.BoxDecoration(
                                                      border: pw.Border.all()),
                                                  child: pw.Center(
                                                      child: pw.Text(
                                                          "Subject Property",
                                                          style: pw.TextStyle(
                                                              fontSize: 10))))),
                                          pw.Expanded(
                                              flex: 3,
                                              child: pw.Container(
                                                  height: 25,
                                                  decoration: pw.BoxDecoration(
                                                      border: pw.Border.all()),
                                                  child: pw.Center(
                                                      child: pw.Text("Size Sqm",
                                                          style: pw.TextStyle(
                                                              fontSize: 10))))),
                                          pw.Expanded(
                                              flex: 3,
                                              child: pw.Container(
                                                  height: 25,
                                                  decoration: pw.BoxDecoration(
                                                      border: pw.Border.all()),
                                                  child: pw.Center(
                                                      child: pw.Text(
                                                          "Size Sqft",
                                                          style: pw.TextStyle(
                                                              fontSize: 10))))),
                                          pw.Expanded(
                                              flex: 6,
                                              child: pw.Container(
                                                  height: 25,
                                                  decoration: pw.BoxDecoration(
                                                      border: pw.Border.all()),
                                                  child: pw.Center(
                                                      child: pw.Text(
                                                          "Property Value USD/Sqm",
                                                          style: pw.TextStyle(
                                                              fontSize: 10))))),
                                          pw.Expanded(
                                              flex: 6,
                                              child: pw.Container(
                                                  height: 25,
                                                  decoration: pw.BoxDecoration(
                                                      border: pw.Border.all()),
                                                  child: pw.Center(
                                                      child: pw.Text(
                                                          "Property Value",
                                                          style: pw.TextStyle(
                                                              fontSize: 10))))),
                                        ]),
                                    if (widget
                                            .objFinalIndication!.land!.length >=
                                        1)
                                      for (int i = 0;
                                          i <
                                              widget.objFinalIndication!.land!
                                                  .length;
                                          i++)
                                        pw.Row(
                                            mainAxisAlignment:
                                                pw.MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                pw.CrossAxisAlignment.center,
                                            children: [
                                              pw.Expanded(
                                                  flex: 2,
                                                  child: pw.Container(
                                                      height: 25,
                                                      decoration:
                                                          pw.BoxDecoration(
                                                              border: pw.Border
                                                                  .all()),
                                                      child: pw.Center(
                                                          child: pw.Text(
                                                              "${widget.objFinalIndication!.land![i].no}",
                                                              style: pw.TextStyle(
                                                                  fontSize:
                                                                      10))))),
                                              pw.Expanded(
                                                  flex: 5,
                                                  child: pw.Container(
                                                      height: 25,
                                                      decoration:
                                                          pw.BoxDecoration(
                                                              border: pw.Border
                                                                  .all()),
                                                      child: pw.Center(
                                                          child: pw.Text("Land",
                                                              style: pw.TextStyle(
                                                                  fontSize:
                                                                      10))))),
                                              pw.Expanded(
                                                  flex: 3,
                                                  child: pw.Container(
                                                      height: 25,
                                                      decoration:
                                                          pw.BoxDecoration(
                                                              border: pw.Border
                                                                  .all()),
                                                      child: pw.Center(
                                                          child: pw.Text(
                                                              "${numformat.format(double.parse(widget.objFinalIndication!.land![i].sizesqm.toString()))}",
                                                              style: pw.TextStyle(
                                                                  fontSize:
                                                                      10))))),
                                              pw.Expanded(
                                                  flex: 3,
                                                  child: pw.Container(
                                                      height: 25,
                                                      decoration:
                                                          pw.BoxDecoration(
                                                              border: pw.Border
                                                                  .all()),
                                                      child: pw.Center(
                                                          child: pw.Text(
                                                              "${numformat.format(double.parse(widget.objFinalIndication!.land![i].sizesqft.toString()))}",
                                                              style: pw.TextStyle(
                                                                  fontSize:
                                                                      10))))),
                                              pw.Expanded(
                                                  flex: 6,
                                                  child: pw.Container(
                                                      height: 25,
                                                      decoration:
                                                          pw.BoxDecoration(
                                                              border: pw.Border
                                                                  .all()),
                                                      child: pw.Center(
                                                          child: pw.Text(
                                                              "${numformat.format(double.parse(widget.objFinalIndication!.land![i].valuesqm.toString()))}",
                                                              style: pw.TextStyle(
                                                                  fontSize:
                                                                      10))))),
                                              pw.Expanded(
                                                  flex: 6,
                                                  child: pw.Container(
                                                      height: 25,
                                                      decoration:
                                                          pw.BoxDecoration(
                                                              border: pw.Border
                                                                  .all()),
                                                      child: pw.Center(
                                                          child: pw.Text(
                                                              "${numformat.format(double.parse(widget.objFinalIndication!.land![i].propertyvalue.toString()))}",
                                                              style: pw.TextStyle(
                                                                  fontSize:
                                                                      10))))),
                                            ]),
                                    pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.center,
                                      children: [
                                        pw.Expanded(
                                          flex: 7,
                                          child: pw.Container(
                                            height: 50,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(),
                                            ),
                                            child: pw.Center(
                                              child: pw.Text(
                                                "Fair Market Value",
                                                style:
                                                    pw.TextStyle(fontSize: 10),
                                              ),
                                            ),
                                          ),
                                        ),
                                        pw.Expanded(
                                          flex: 18,
                                          child: pw.Container(
                                            height: 50,
                                            child: pw.Column(
                                              mainAxisAlignment:
                                                  pw.MainAxisAlignment.start,
                                              children: [
                                                pw.Expanded(
                                                  flex: 18,
                                                  child: pw.Container(
                                                    height: 25,
                                                    decoration:
                                                        pw.BoxDecoration(
                                                      border: pw.Border.all(),
                                                    ),
                                                    child: pw.Center(
                                                      child: pw.Text(
                                                        "\$ ${numformat.format(double.parse(widget.objFinalIndication!.totallandvalue.toString()))}",
                                                        style: pw.TextStyle(
                                                            color:
                                                                PdfColors.red,
                                                            fontSize: 10,
                                                            decoration: pw
                                                                .TextDecoration
                                                                .underline),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                pw.Expanded(
                                                  flex: 18,
                                                  child: pw.Container(
                                                    height: 25,
                                                    decoration:
                                                        pw.BoxDecoration(
                                                      border: pw.Border.all(),
                                                    ),
                                                    child: pw.Center(
                                                      child: pw.Text(
                                                        landinWord,
                                                        style: pw.TextStyle(
                                                          color: PdfColors.red,
                                                          fontSize: 10,
                                                          decoration: pw
                                                              .TextDecoration
                                                              .underline,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ] else if (widget.objCover!.header ==
                                      "Property OFFICE SPACE VALUATION REPORT") ...[
                                    pw.SizedBox(height: 10),
                                    pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.center,
                                      children: [
                                        pw.Expanded(
                                          flex: 4,
                                          child: pw.Container(
                                            alignment: pw.Alignment.center,
                                            height: 25,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(),
                                            ),
                                            child: pw.Center(
                                              child: pw.Text("Subject Property",
                                                  style: pw.TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                  textAlign:
                                                      pw.TextAlign.center),
                                            ),
                                          ),
                                        ),
                                        pw.Expanded(
                                          flex: 3,
                                          child: pw.Container(
                                            alignment: pw.Alignment.center,
                                            height: 25,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(),
                                            ),
                                            child: pw.Center(
                                              child: pw.Text("Floor/Unit No.",
                                                  style: pw.TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                  textAlign:
                                                      pw.TextAlign.center),
                                            ),
                                          ),
                                        ),
                                        pw.Expanded(
                                          flex: 3,
                                          child: pw.Container(
                                            height: 25,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(),
                                            ),
                                            child: pw.Center(
                                              child: pw.Text("No.of Bedroom",
                                                  style: pw.TextStyle(
                                                      fontSize: 10),
                                                  textAlign:
                                                      pw.TextAlign.center),
                                            ),
                                          ),
                                        ),
                                        pw.Expanded(
                                          flex: 3,
                                          child: pw.Container(
                                            height: 25,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(),
                                            ),
                                            child: pw.Center(
                                              child: pw.Text("Gross Area (Sqm)",
                                                  style: pw.TextStyle(
                                                      fontSize: 10),
                                                  textAlign:
                                                      pw.TextAlign.center),
                                            ),
                                          ),
                                        ),
                                        pw.Expanded(
                                          flex: 3,
                                          child: pw.Container(
                                            height: 25,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(),
                                            ),
                                            child: pw.Center(
                                              child: pw.Text("Size Sqft",
                                                  style: pw.TextStyle(
                                                      fontSize: 10),
                                                  textAlign:
                                                      pw.TextAlign.center),
                                            ),
                                          ),
                                        ),
                                        pw.Expanded(
                                          flex: 5,
                                          child: pw.Container(
                                            height: 25,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(),
                                            ),
                                            child: pw.Center(
                                              child: pw.Text(
                                                  "Property Value USD/Sqm",
                                                  style: pw.TextStyle(
                                                      fontSize: 10),
                                                  textAlign:
                                                      pw.TextAlign.center),
                                            ),
                                          ),
                                        ),
                                        pw.Expanded(
                                          flex: 5,
                                          child: pw.Container(
                                            height: 25,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(),
                                            ),
                                            child: pw.Center(
                                              child: pw.Text("Property Value",
                                                  style: pw.TextStyle(
                                                      fontSize: 10),
                                                  textAlign:
                                                      pw.TextAlign.center),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    pw.Container(
                                      width: double.infinity,
                                      decoration: pw.BoxDecoration(
                                        border: pw.Border.all(),
                                      ),
                                      child: pw.Row(
                                        children: [
                                          pw.Expanded(
                                            flex: 20,
                                            child: pw.Column(
                                              crossAxisAlignment:
                                                  pw.CrossAxisAlignment.center,
                                              children: [
                                                if (widget.objFinalIndication!
                                                        .building!.length >=
                                                    1)
                                                  for (int i = 0;
                                                      i <
                                                          widget
                                                              .objFinalIndication!
                                                              .building!
                                                              .length;
                                                      i++)
                                                    pw.Row(
                                                      mainAxisAlignment: pw
                                                          .MainAxisAlignment
                                                          .center,
                                                      children: [
                                                        pw.Expanded(
                                                          flex: 4,
                                                          child: pw.Container(
                                                            height: 25,
                                                            decoration: pw
                                                                .BoxDecoration(
                                                              border: pw.Border
                                                                  .all(),
                                                            ),
                                                            child: pw.Center(
                                                              child: pw.Text(
                                                                  "Office Space",
                                                                  style: pw.TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                  textAlign: pw
                                                                      .TextAlign
                                                                      .center),
                                                            ),
                                                          ),
                                                        ),
                                                        pw.Expanded(
                                                          flex: 3,
                                                          child: pw.Container(
                                                            height: 25,
                                                            decoration: pw
                                                                .BoxDecoration(
                                                              border: pw.Border
                                                                  .all(),
                                                            ),
                                                            child: pw.Center(
                                                              child: pw.Text(
                                                                  "${(widget.objFinalIndication!.building![i].floorno)}",
                                                                  style: pw.TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                  textAlign: pw
                                                                      .TextAlign
                                                                      .center),
                                                            ),
                                                          ),
                                                        ),
                                                        pw.Expanded(
                                                          flex: 3,
                                                          child: pw.Container(
                                                            height: 25,
                                                            decoration: pw
                                                                .BoxDecoration(
                                                              border: pw.Border
                                                                  .all(),
                                                            ),
                                                            child: pw.Center(
                                                              child: pw.Text(
                                                                  "${(widget.objFinalIndication!.building![i].bedroomno)}",
                                                                  style: pw.TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                  textAlign: pw
                                                                      .TextAlign
                                                                      .center),
                                                            ),
                                                          ),
                                                        ),
                                                        pw.Expanded(
                                                          flex: 3,
                                                          child: pw.Container(
                                                            height: 25,
                                                            decoration: pw
                                                                .BoxDecoration(
                                                              border: pw.Border
                                                                  .all(),
                                                            ),
                                                            child: pw.Center(
                                                              child: pw.Text(
                                                                  "${numformat.format(double.parse(widget.objFinalIndication!.building![i].sizesqm.toString()))}",
                                                                  style: pw.TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                  textAlign: pw
                                                                      .TextAlign
                                                                      .center),
                                                            ),
                                                          ),
                                                        ),
                                                        pw.Expanded(
                                                          flex: 3,
                                                          child: pw.Container(
                                                            height: 25,
                                                            decoration: pw
                                                                .BoxDecoration(
                                                              border: pw.Border
                                                                  .all(),
                                                            ),
                                                            child: pw.Center(
                                                              child: pw.Text(
                                                                  "${numformat.format(double.parse(widget.objFinalIndication!.building![i].sizesqft.toString()))}",
                                                                  style: pw.TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                  textAlign: pw
                                                                      .TextAlign
                                                                      .center),
                                                            ),
                                                          ),
                                                        ),
                                                        pw.Expanded(
                                                          flex: 5,
                                                          child: pw.Container(
                                                            height: 25,
                                                            decoration: pw
                                                                .BoxDecoration(
                                                              border: pw.Border
                                                                  .all(),
                                                            ),
                                                            child: pw.Center(
                                                              child: pw.Text(
                                                                  "${numformat.format(double.parse(widget.objFinalIndication!.building![i].valuesqm.toString()))}",
                                                                  style: pw.TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                  textAlign: pw
                                                                      .TextAlign
                                                                      .center),
                                                            ),
                                                          ),
                                                        ),
                                                        pw.Expanded(
                                                          flex: 5,
                                                          child: pw.Container(
                                                            height: 25,
                                                            decoration: pw
                                                                .BoxDecoration(
                                                              border: pw.Border
                                                                  .all(),
                                                            ),
                                                            child: pw.Center(
                                                              child: pw.Text(
                                                                  "${numformat.format(double.parse(widget.objFinalIndication!.building![i].propertyvalue.toString()))}",
                                                                  style: pw.TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                  textAlign: pw
                                                                      .TextAlign
                                                                      .center),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                pw.Row(
                                                  mainAxisAlignment: pw
                                                      .MainAxisAlignment.center,
                                                  children: [
                                                    pw.Expanded(
                                                      flex: 10,
                                                      child: pw.Container(
                                                        height: 25,
                                                        decoration:
                                                            pw.BoxDecoration(
                                                          border:
                                                              pw.Border.all(),
                                                        ),
                                                        child: pw.Center(
                                                          child: pw.Text(
                                                              "Total",
                                                              style:
                                                                  pw.TextStyle(
                                                                      fontSize:
                                                                          10),
                                                              textAlign: pw
                                                                  .TextAlign
                                                                  .center),
                                                        ),
                                                      ),
                                                    ),
                                                    pw.Expanded(
                                                      flex: 3,
                                                      child: pw.Container(
                                                        height: 25,
                                                        decoration:
                                                            pw.BoxDecoration(
                                                          border:
                                                              pw.Border.all(),
                                                        ),
                                                        child: pw.Center(
                                                          child: pw.Text(
                                                              "${numformat.format(double.parse(widget.objFinalIndication!.totalbuildingsizesqm.toString()))}",
                                                              style:
                                                                  pw.TextStyle(
                                                                      fontSize:
                                                                          10),
                                                              textAlign: pw
                                                                  .TextAlign
                                                                  .center),
                                                        ),
                                                      ),
                                                    ),
                                                    pw.Expanded(
                                                      flex: 3,
                                                      child: pw.Container(
                                                        height: 25,
                                                        decoration:
                                                            pw.BoxDecoration(
                                                          border:
                                                              pw.Border.all(),
                                                        ),
                                                        child: pw.Center(
                                                          child: pw.Text(
                                                              "${widget.objFinalIndication!.building![0].sizesqft.toString()}",
                                                              style:
                                                                  pw.TextStyle(
                                                                      fontSize:
                                                                          10),
                                                              textAlign: pw
                                                                  .TextAlign
                                                                  .center),
                                                        ),
                                                      ),
                                                    ),
                                                    pw.Expanded(
                                                      flex: 10,
                                                      child: pw.Container(
                                                        height: 25,
                                                        decoration:
                                                            pw.BoxDecoration(
                                                          border:
                                                              pw.Border.all(),
                                                        ),
                                                        child: pw.Center(
                                                          child: pw.Text(
                                                              "${numformat.format(double.parse(widget.objFinalIndication!.totalbuildingvalue.toString()))}",
                                                              style:
                                                                  pw.TextStyle(
                                                                      fontSize:
                                                                          10),
                                                              textAlign: pw
                                                                  .TextAlign
                                                                  .center),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                pw.Row(
                                                  mainAxisAlignment: pw
                                                      .MainAxisAlignment.center,
                                                  crossAxisAlignment: pw
                                                      .CrossAxisAlignment
                                                      .center,
                                                  children: [
                                                    pw.Expanded(
                                                      flex: 10,
                                                      child: pw.Container(
                                                        height: 50,
                                                        decoration:
                                                            pw.BoxDecoration(
                                                          border:
                                                              pw.Border.all(),
                                                        ),
                                                        child: pw.Center(
                                                          child: pw.Text(
                                                            "Fair Market Value",
                                                            style: pw.TextStyle(
                                                                fontSize: 10),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    pw.Expanded(
                                                      flex: 16,
                                                      child: pw.Container(
                                                        height: 50,
                                                        child: pw.Column(
                                                          mainAxisAlignment: pw
                                                              .MainAxisAlignment
                                                              .start,
                                                          children: [
                                                            pw.Expanded(
                                                              flex: 16,
                                                              child:
                                                                  pw.Container(
                                                                height: 25,
                                                                decoration: pw
                                                                    .BoxDecoration(
                                                                  border:
                                                                      pw.Border
                                                                          .all(),
                                                                ),
                                                                child:
                                                                    pw.Center(
                                                                  child:
                                                                      pw.Text(
                                                                    "\$ ${numformat.format(double.parse(widget.objFinalIndication!.totalbuildingvalue.toString()))}",
                                                                    style: pw.TextStyle(
                                                                        color: PdfColors
                                                                            .red,
                                                                        fontSize:
                                                                            10,
                                                                        decoration: pw
                                                                            .TextDecoration
                                                                            .underline),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            pw.Expanded(
                                                              flex: 16,
                                                              child:
                                                                  pw.Container(
                                                                height: 25,
                                                                decoration: pw
                                                                    .BoxDecoration(
                                                                  border:
                                                                      pw.Border
                                                                          .all(),
                                                                ),
                                                                child:
                                                                    pw.Center(
                                                                  child: pw.Text(
                                                                      officespaceinword,
                                                                      style: pw
                                                                          .TextStyle(
                                                                        color: PdfColors
                                                                            .red,
                                                                        fontSize:
                                                                            10,
                                                                        decoration: pw
                                                                            .TextDecoration
                                                                            .underline,
                                                                      ),
                                                                      textAlign: pw
                                                                          .TextAlign
                                                                          .center),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ] else if (widget.objCover!.header ==
                                      "Property CONDO REPORT") ...[
                                    pw.SizedBox(height: 10),
                                    pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.center,
                                      children: [
                                        pw.Expanded(
                                          flex: 4,
                                          child: pw.Container(
                                            alignment: pw.Alignment.center,
                                            height: 25,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(),
                                            ),
                                            child: pw.Center(
                                              child: pw.Text("Subject Property",
                                                  style: pw.TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                  textAlign:
                                                      pw.TextAlign.center),
                                            ),
                                          ),
                                        ),
                                        pw.Expanded(
                                          flex: 3,
                                          child: pw.Container(
                                            alignment: pw.Alignment.center,
                                            height: 25,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(),
                                            ),
                                            child: pw.Center(
                                              child: pw.Text("Floor/Unit No.",
                                                  style: pw.TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                  textAlign:
                                                      pw.TextAlign.center),
                                            ),
                                          ),
                                        ),
                                        pw.Expanded(
                                          flex: 3,
                                          child: pw.Container(
                                            height: 25,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(),
                                            ),
                                            child: pw.Center(
                                              child: pw.Text("No.of Bedroom",
                                                  style: pw.TextStyle(
                                                      fontSize: 10),
                                                  textAlign:
                                                      pw.TextAlign.center),
                                            ),
                                          ),
                                        ),
                                        pw.Expanded(
                                          flex: 3,
                                          child: pw.Container(
                                            height: 25,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(),
                                            ),
                                            child: pw.Center(
                                              child: pw.Text("Gross Area (Sqm)",
                                                  style: pw.TextStyle(
                                                      fontSize: 10),
                                                  textAlign:
                                                      pw.TextAlign.center),
                                            ),
                                          ),
                                        ),
                                        pw.Expanded(
                                          flex: 3,
                                          child: pw.Container(
                                            height: 25,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(),
                                            ),
                                            child: pw.Center(
                                              child: pw.Text("Size Sqft",
                                                  style: pw.TextStyle(
                                                      fontSize: 10),
                                                  textAlign:
                                                      pw.TextAlign.center),
                                            ),
                                          ),
                                        ),
                                        pw.Expanded(
                                          flex: 5,
                                          child: pw.Container(
                                            height: 25,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(),
                                            ),
                                            child: pw.Center(
                                              child: pw.Text(
                                                  "Property Value USD/Sqm",
                                                  style: pw.TextStyle(
                                                      fontSize: 10),
                                                  textAlign:
                                                      pw.TextAlign.center),
                                            ),
                                          ),
                                        ),
                                        pw.Expanded(
                                          flex: 5,
                                          child: pw.Container(
                                            height: 25,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(),
                                            ),
                                            child: pw.Center(
                                              child: pw.Text("Property Value",
                                                  style: pw.TextStyle(
                                                      fontSize: 10),
                                                  textAlign:
                                                      pw.TextAlign.center),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    pw.Container(
                                      width: double.infinity,
                                      decoration: pw.BoxDecoration(
                                        border: pw.Border.all(),
                                      ),
                                      child: pw.Row(
                                        children: [
                                          pw.Expanded(
                                            flex: 20,
                                            child: pw.Column(
                                              crossAxisAlignment:
                                                  pw.CrossAxisAlignment.center,
                                              children: [
                                                if (widget.objFinalIndication!
                                                        .building!.length >=
                                                    1)
                                                  for (int i = 0;
                                                      i <
                                                          widget
                                                              .objFinalIndication!
                                                              .building!
                                                              .length;
                                                      i++)
                                                    pw.Row(
                                                      mainAxisAlignment: pw
                                                          .MainAxisAlignment
                                                          .center,
                                                      children: [
                                                        pw.Expanded(
                                                          flex: 4,
                                                          child: pw.Container(
                                                            height: 25,
                                                            decoration: pw
                                                                .BoxDecoration(
                                                              border: pw.Border
                                                                  .all(),
                                                            ),
                                                            child: pw.Center(
                                                              child: pw.Text(
                                                                  "Condo",
                                                                  style: pw.TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                  textAlign: pw
                                                                      .TextAlign
                                                                      .center),
                                                            ),
                                                          ),
                                                        ),
                                                        pw.Expanded(
                                                          flex: 3,
                                                          child: pw.Container(
                                                            height: 25,
                                                            decoration: pw
                                                                .BoxDecoration(
                                                              border: pw.Border
                                                                  .all(),
                                                            ),
                                                            child: pw.Center(
                                                              child: pw.Text(
                                                                  "${(widget.objFinalIndication!.building![i].floorno)}",
                                                                  style: pw.TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                  textAlign: pw
                                                                      .TextAlign
                                                                      .center),
                                                            ),
                                                          ),
                                                        ),
                                                        pw.Expanded(
                                                          flex: 3,
                                                          child: pw.Container(
                                                            height: 25,
                                                            decoration: pw
                                                                .BoxDecoration(
                                                              border: pw.Border
                                                                  .all(),
                                                            ),
                                                            child: pw.Center(
                                                              child: pw.Text(
                                                                  "${(widget.objFinalIndication!.building![i].bedroomno)}",
                                                                  style: pw.TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                  textAlign: pw
                                                                      .TextAlign
                                                                      .center),
                                                            ),
                                                          ),
                                                        ),
                                                        pw.Expanded(
                                                          flex: 3,
                                                          child: pw.Container(
                                                            height: 25,
                                                            decoration: pw
                                                                .BoxDecoration(
                                                              border: pw.Border
                                                                  .all(),
                                                            ),
                                                            child: pw.Center(
                                                              child: pw.Text(
                                                                  "${numformat.format(double.parse(widget.objFinalIndication!.building![i].sizesqm.toString()))}",
                                                                  style: pw.TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                  textAlign: pw
                                                                      .TextAlign
                                                                      .center),
                                                            ),
                                                          ),
                                                        ),
                                                        pw.Expanded(
                                                          flex: 3,
                                                          child: pw.Container(
                                                            height: 25,
                                                            decoration: pw
                                                                .BoxDecoration(
                                                              border: pw.Border
                                                                  .all(),
                                                            ),
                                                            child: pw.Center(
                                                              child: pw.Text(
                                                                  "${numformat.format(double.parse(widget.objFinalIndication!.building![i].sizesqft.toString()))}",
                                                                  style: pw.TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                  textAlign: pw
                                                                      .TextAlign
                                                                      .center),
                                                            ),
                                                          ),
                                                        ),
                                                        pw.Expanded(
                                                          flex: 5,
                                                          child: pw.Container(
                                                            height: 25,
                                                            decoration: pw
                                                                .BoxDecoration(
                                                              border: pw.Border
                                                                  .all(),
                                                            ),
                                                            child: pw.Center(
                                                              child: pw.Text(
                                                                  "${numformat.format(double.parse(widget.objFinalIndication!.building![i].valuesqm.toString()))}",
                                                                  style: pw.TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                  textAlign: pw
                                                                      .TextAlign
                                                                      .center),
                                                            ),
                                                          ),
                                                        ),
                                                        pw.Expanded(
                                                          flex: 5,
                                                          child: pw.Container(
                                                            height: 25,
                                                            decoration: pw
                                                                .BoxDecoration(
                                                              border: pw.Border
                                                                  .all(),
                                                            ),
                                                            child: pw.Center(
                                                              child: pw.Text(
                                                                  "${numformat.format(double.parse(widget.objFinalIndication!.building![i].propertyvalue.toString()))}",
                                                                  style: pw.TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                  textAlign: pw
                                                                      .TextAlign
                                                                      .center),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                pw.Row(
                                                  mainAxisAlignment: pw
                                                      .MainAxisAlignment.center,
                                                  children: [
                                                    pw.Expanded(
                                                      flex: 10,
                                                      child: pw.Container(
                                                        height: 25,
                                                        decoration:
                                                            pw.BoxDecoration(
                                                          border:
                                                              pw.Border.all(),
                                                        ),
                                                        child: pw.Center(
                                                          child: pw.Text(
                                                              "Total",
                                                              style:
                                                                  pw.TextStyle(
                                                                      fontSize:
                                                                          10),
                                                              textAlign: pw
                                                                  .TextAlign
                                                                  .center),
                                                        ),
                                                      ),
                                                    ),
                                                    pw.Expanded(
                                                      flex: 3,
                                                      child: pw.Container(
                                                        height: 25,
                                                        decoration:
                                                            pw.BoxDecoration(
                                                          border:
                                                              pw.Border.all(),
                                                        ),
                                                        child: pw.Center(
                                                          child: pw.Text(
                                                              "${numformat.format(double.parse(widget.objFinalIndication!.totalbuildingsizesqm.toString()))}",
                                                              style:
                                                                  pw.TextStyle(
                                                                      fontSize:
                                                                          10),
                                                              textAlign: pw
                                                                  .TextAlign
                                                                  .center),
                                                        ),
                                                      ),
                                                    ),
                                                    pw.Expanded(
                                                      flex: 3,
                                                      child: pw.Container(
                                                        height: 25,
                                                        decoration:
                                                            pw.BoxDecoration(
                                                          border:
                                                              pw.Border.all(),
                                                        ),
                                                        child: pw.Center(
                                                          child: pw.Text(
                                                              "${widget.objFinalIndication!.building![0].sizesqft.toString()}",
                                                              style:
                                                                  pw.TextStyle(
                                                                      fontSize:
                                                                          10),
                                                              textAlign: pw
                                                                  .TextAlign
                                                                  .center),
                                                        ),
                                                      ),
                                                    ),
                                                    pw.Expanded(
                                                      flex: 10,
                                                      child: pw.Container(
                                                        height: 25,
                                                        decoration:
                                                            pw.BoxDecoration(
                                                          border:
                                                              pw.Border.all(),
                                                        ),
                                                        child: pw.Center(
                                                          child: pw.Text(
                                                              "${numformat.format(double.parse(widget.objFinalIndication!.totalbuildingvalue.toString()))}",
                                                              style:
                                                                  pw.TextStyle(
                                                                      fontSize:
                                                                          10),
                                                              textAlign: pw
                                                                  .TextAlign
                                                                  .center),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                pw.Row(
                                                  mainAxisAlignment: pw
                                                      .MainAxisAlignment.center,
                                                  crossAxisAlignment: pw
                                                      .CrossAxisAlignment
                                                      .center,
                                                  children: [
                                                    pw.Expanded(
                                                      flex: 10,
                                                      child: pw.Container(
                                                        height: 50,
                                                        decoration:
                                                            pw.BoxDecoration(
                                                          border:
                                                              pw.Border.all(),
                                                        ),
                                                        child: pw.Center(
                                                          child: pw.Text(
                                                            "Fair Market Value",
                                                            style: pw.TextStyle(
                                                                fontSize: 10),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    pw.Expanded(
                                                      flex: 16,
                                                      child: pw.Container(
                                                        height: 50,
                                                        child: pw.Column(
                                                          mainAxisAlignment: pw
                                                              .MainAxisAlignment
                                                              .start,
                                                          children: [
                                                            pw.Expanded(
                                                              flex: 16,
                                                              child:
                                                                  pw.Container(
                                                                height: 25,
                                                                decoration: pw
                                                                    .BoxDecoration(
                                                                  border:
                                                                      pw.Border
                                                                          .all(),
                                                                ),
                                                                child:
                                                                    pw.Center(
                                                                  child:
                                                                      pw.Text(
                                                                    "\$ ${numformat.format(double.parse(widget.objFinalIndication!.totalbuildingvalue.toString()))}",
                                                                    style: pw.TextStyle(
                                                                        color: PdfColors
                                                                            .red,
                                                                        fontSize:
                                                                            10,
                                                                        decoration: pw
                                                                            .TextDecoration
                                                                            .underline),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            pw.Expanded(
                                                              flex: 16,
                                                              child:
                                                                  pw.Container(
                                                                height: 25,
                                                                decoration: pw
                                                                    .BoxDecoration(
                                                                  border:
                                                                      pw.Border
                                                                          .all(),
                                                                ),
                                                                child:
                                                                    pw.Center(
                                                                  child: pw.Text(
                                                                      condoinword,
                                                                      style: pw
                                                                          .TextStyle(
                                                                        color: PdfColors
                                                                            .red,
                                                                        fontSize:
                                                                            10,
                                                                        decoration: pw
                                                                            .TextDecoration
                                                                            .underline,
                                                                      ),
                                                                      textAlign: pw
                                                                          .TextAlign
                                                                          .center),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                  // Controlled Table
                                  pw.SizedBox(height: 5),
                                  pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.center,
                                      children: [
                                        pw.Expanded(
                                          flex: 5,
                                          child: pw.Container(
                                            alignment: pw.Alignment.center,
                                            height: 25,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(),
                                            ),
                                            child: pw.Center(
                                              child: pw.Text("Controlled By",
                                                  style: pw.TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                  textAlign:
                                                      pw.TextAlign.center),
                                            ),
                                          ),
                                        ),
                                        pw.Expanded(
                                          flex: 5,
                                          child: pw.Container(
                                            alignment: pw.Alignment.center,
                                            height: 25,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(),
                                            ),
                                            child: pw.Center(
                                              child: pw.Text("Verified By",
                                                  style: pw.TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                  textAlign:
                                                      pw.TextAlign.center),
                                            ),
                                          ),
                                        ),
                                      ]),
                                  pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.center,
                                      children: [
                                        pw.Expanded(
                                          flex: 5,
                                          child: pw.Container(
                                            alignment: pw.Alignment.center,
                                            height: 43,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(),
                                            ),
                                            child: pw.Column(
                                              mainAxisAlignment:
                                                  pw.MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  pw.CrossAxisAlignment.center,
                                              children: [
                                                pw.Text('${controll[0]}',
                                                    style: pw.TextStyle(
                                                      fontSize: 10,
                                                    ),
                                                    textAlign:
                                                        pw.TextAlign.center),
                                                pw.SizedBox(height: 3),
                                                pw.Text("${controll[1]}",
                                                    style: pw.TextStyle(
                                                      fontSize: 10,
                                                    ),
                                                    textAlign:
                                                        pw.TextAlign.center),
                                                pw.SizedBox(height: 3),
                                                pw.Text("${controll[2]}",
                                                    style: pw.TextStyle(
                                                      fontSize: 10,
                                                    ),
                                                    textAlign:
                                                        pw.TextAlign.center),
                                              ],
                                            ),
                                          ),
                                        ),
                                        pw.Expanded(
                                          flex: 5,
                                          child: pw.Container(
                                            alignment: pw.Alignment.center,
                                            height: 43,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(),
                                            ),
                                            child: pw.Column(
                                              mainAxisAlignment:
                                                  pw.MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  pw.CrossAxisAlignment.center,
                                              children: [
                                                pw.Text("${parts[0]}",
                                                    style: pw.TextStyle(
                                                      fontSize: 10,
                                                    ),
                                                    textAlign:
                                                        pw.TextAlign.center),
                                                pw.SizedBox(height: 3),
                                                pw.Text("${parts[1]}",
                                                    style: pw.TextStyle(
                                                      fontSize: 10,
                                                    ),
                                                    textAlign:
                                                        pw.TextAlign.center),
                                                pw.SizedBox(height: 3),
                                                pw.Text("${parts[2]}",
                                                    style: pw.TextStyle(
                                                      fontSize: 10,
                                                    ),
                                                    textAlign:
                                                        pw.TextAlign.center),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ]),
                                  pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.center,
                                      children: [
                                        pw.Expanded(
                                          flex: 5,
                                          child: pw.Container(
                                            alignment: pw.Alignment.center,
                                            height: 70,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(),
                                            ),
                                            child: pw.Center(
                                              child: pw.Text("",
                                                  style: pw.TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                  textAlign:
                                                      pw.TextAlign.center),
                                            ),
                                          ),
                                        ),
                                        pw.Expanded(
                                          flex: 5,
                                          child: pw.Container(
                                            alignment: pw.Alignment.center,
                                            height: 70,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(),
                                            ),
                                            child: pw.Center(
                                              child: pw.Text("",
                                                  style: pw.TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                  textAlign:
                                                      pw.TextAlign.center),
                                            ),
                                          ),
                                        ),
                                      ]),
                                  pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.center,
                                      children: [
                                        pw.Expanded(
                                          flex: 10,
                                          child: pw.Container(
                                            alignment: pw.Alignment.center,
                                            height: 30,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(),
                                            ),
                                            child: pw.Center(
                                              child: pw.Text(
                                                  "Company Seal of Cambodia Angkor Real Estate Co., Ltd",
                                                  style: pw.TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                  textAlign:
                                                      pw.TextAlign.center),
                                            ),
                                          ),
                                        ),
                                      ]),
                                  pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.center,
                                      children: [
                                        pw.Expanded(
                                          flex: 9,
                                          child: pw.Container(
                                            alignment: pw.Alignment.center,
                                            height: 30,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(),
                                            ),
                                            child: pw.Center(
                                              child: pw.Text(
                                                  "Chief Executive Officer License No. V-07-013-04",
                                                  style: pw.TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                  textAlign:
                                                      pw.TextAlign.center),
                                            ),
                                          ),
                                        ),
                                      ]),
                                  pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.center,
                                      children: [
                                        pw.Expanded(
                                          flex: 10,
                                          child: pw.Container(
                                            alignment: pw.Alignment.center,
                                            height: 90,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(),
                                            ),
                                            child: pw.Center(
                                              child: pw.Text("",
                                                  style: pw.TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                  textAlign:
                                                      pw.TextAlign.center),
                                            ),
                                          ),
                                        ),
                                      ]),
                                  pw.Padding(
                                      padding: pw.EdgeInsets.only(right: 10),
                                      child: pw.Row(
                                          mainAxisAlignment:
                                              pw.MainAxisAlignment.spaceBetween,
                                          children: [
                                            pw.Row(children: [
                                              pw.Text('Issue Date: ',
                                                  style: header2(true)),
                                              pw.Text(
                                                  '${widget.objFinalIndication!.issus_date}',
                                                  style: header2(false))
                                            ]),
                                            pw.Row(children: [
                                              pw.Text('Expiry Date: ',
                                                  style: header2(true)),
                                              pw.Text(
                                                  '${widget.objFinalIndication!.expiry_date}',
                                                  style: header2(false))
                                            ])
                                          ])),
                                ],
                              ) // Add margin here
                              )),
                    ),
                  )),
                ],
              ));
        }));

//     // //Page Nineteen
    pdf.addPage(
      pw.Page(
        pageTheme: pageTheme,
        build: (final context) {
          return pw.FullPage(
            ignoreMargins: true,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Container(
                  margin: const pw.EdgeInsets.only(
                      top: 25, right: 25), // Add margin here
                  child: pw.Text(
                    "©BY CAMBODIA ANGKOR REAL ESTATE CO., LTD",
                    style: pw.TextStyle(fontSize: 9, font: font),
                  ),
                ),
                pw.Expanded(
                  child: pw.Container(
                    margin: const pw.EdgeInsets.only(
                        top: 5, left: 40, right: 25, bottom: 25),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(
                        color: PdfColors.black,
                        width: 2, // Adjust border width as needed
                      ),
                    ),
                    child: pw.Container(
                        padding: pw.EdgeInsets.only(left: 40, right: 20),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          // mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  top: 25, left: -20), // Add margin here
                              child: pw.Text(
                                "Cambodia Angkor Real Estate Co.,Ltd.\nLimiting Terms, Conditions and Liability",
                                style: header1(),
                                textAlign: pw.TextAlign.start,
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            pw.Text("General", style: header3()),
                            pw.RichText(
                              text: pw.TextSpan(
                                text:
                                    'This Valuation of the Subject Property has been made following an extensive process of research and consultation.  All reasonable measures have been taken to ensure the accuracy of the final Valuation.  The Valuation has been prepared in good faith by Cambodia Real Estate Co., Ltd. and represents a true and accurate valuation of the Subject Property at the time this Property Valuation was certified.  ',
                                style: body1(), // Base style
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            pw.Text("pdfumentation", style: header3()),
                            pw.RichText(
                              text: pw.TextSpan(
                                text:
                                    'Cambodia Angkor Real Estate Co., Ltd. has examined a copy of the Title Deed relating to the Subject Property.  The copy of the Title Deed was provided by the client.',
                                style: body1(), // Base style
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            pw.Text("Consultation", style: header3()),
                            pw.RichText(
                              text: pw.TextSpan(
                                text:
                                    'The Valuation Report and Certificate were completed following consultation with members of the local community.  Where the Title Deed is registered with the Cadastral Land Registry Office it is not necessary to consult Room or Commune representatives.',
                                style: body1(), // Base style
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            pw.Text("Inspection and Survey Information",
                                style: header3()),
                            pw.RichText(
                              text: pw.TextSpan(
                                text:
                                    'The Site Inspection Survey Information relating to the Subject Property (attached) was prepared solely by officers of Cambodia Real Estate Co., Ltd. and was based on the inspection and recording procedures used by Cambodia Angkor Real Estate Co., Ltd. The Inspecting Officer’s Report and Survey Information does not purport to be a technical or geographical survey of the Subject Property.',
                                style: body1(), // Base style
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            pw.Text("Liability", style: header3()),
                            pw.RichText(
                              text: pw.TextSpan(
                                  text:
                                      'Cambodia Angkor Real Estate Co., Ltd. has taken all reasonable measures to ensure the accuracy of this Valuation.  However, all pdfumentation and ancillary information included in this Valuation is intended for reference only.  Some information has been gathered from government departments, outside agencies or private individuals. Therefore, ',
                                  style: body1(),
                                  children: [
                                    pw.TextSpan(
                                        text:
                                            "Cambodia Angkor Real Estate Co., Ltd. accepts no liability for the accuracy of this information.",
                                        style: b_body())
                                  ] // Base style
                                  ),
                            ),
                            pw.SizedBox(height: 20),
                            pw.RichText(
                              text: pw.TextSpan(
                                text:
                                    'The appraiser will not give testimony or appear in the court because he/she made an appraisal of the property in question, unless specific arrangement to do so have been made beforehand, or as otherwise required by law.',
                                style: body1(), // Base style
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

    //Page Tweenty
    pdf.addPage(
      pw.Page(
        pageTheme: pageTheme,
        build: (final context) {
          return pw.FullPage(
            ignoreMargins: true,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Container(
                  margin: const pw.EdgeInsets.only(
                      top: 25, right: 25), // Add margin here
                  child: pw.Text(
                    "©BY CAMBODIA ANGKOR REAL ESTATE CO., LTD",
                    style: pw.TextStyle(fontSize: 9, font: font),
                  ),
                ),
                pw.Expanded(
                  child: pw.Container(
                    margin: const pw.EdgeInsets.only(
                        top: 5, left: 40, right: 25, bottom: 25),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(
                        color: PdfColors.black,
                        width: 2, // Adjust border width as needed
                      ),
                    ),
                    child: pw.Container(
                        padding: pw.EdgeInsets.only(left: 40, right: 20),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          // mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            pw.SizedBox(height: 15),
                            pw.Text("Hazardous", style: header3()),
                            pw.RichText(
                              text: pw.TextSpan(
                                text:
                                    'We have not carried investigation of any hidden or unapparent conditions of the property like hazardous materials has been used in the construction of the building or adverse environmental conditions (including the presence of hazardous wastes, toxic substances, etc.) that would make the property more or less valuable and has assumed that there are no such conditions and makes no guarantees or warranties, expressed or implied, regarding the condition of the property.',
                                style: body1(), // Base style
                              ),
                            ),
                            pw.SizedBox(height: 15),
                            pw.Text("Measuring the Property", style: header3()),
                            pw.RichText(
                              text: pw.TextSpan(
                                text:
                                    'All measurements that we take are based on measuring practice of Cambodia Angkor Real Estate and in accordance with Cadastral Land Registry Office. If for whatever reason dimensions or areas are calculated from other sources, then we will state this in the report.',
                                style: body1(), // Base style
                              ),
                            ),
                            pw.SizedBox(height: 15),
                            pw.Text("Confidentiality/Publication/Copyright",
                                style: header3()),
                            pw.RichText(
                              text: pw.TextSpan(
                                text:
                                    'This Property Valuation has been prepared for a client of Cambodia Angkor Real Estate Co., Ltd. for the sole use of the client and the client’s nominated representative(s).  The Valuation is, otherwise, completely confidential.  The client may refer to Cambodia Angkor Real Estate Co., Ltd. in future dealings with government departments, official agencies, private individuals and the media where such dealings relate to the Subject Property. However, the client cannot reproduce, sell, publish or distribute the Valuation Report without the prior written consent of Cambodia Angkor Real Estate Co., Ltd.   ',
                                style: body1(), // Base style
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

    //Page Tweenty One
    pdf.addPage(pw.Page(
      pageTheme: pageTheme,
      build: (final context) {
        return pw.FullPage(
          ignoreMargins: true,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            children: [
              pw.Container(
                margin: const pw.EdgeInsets.only(
                    top: 25, right: 25), // Add margin here
                child: pw.Text(
                  "©BY CAMBODIA ANGKOR REAL ESTATE CO., LTD",
                  style: pw.TextStyle(fontSize: 9, font: font),
                ),
              ),
              pw.Expanded(
                flex: 5,
                child: pw.Container(
                  margin: const pw.EdgeInsets.only(
                      top: 5, left: 40, right: 25, bottom: 25),
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(
                      color: PdfColors.black,
                      width: 2, // Adjust border width as needed
                    ),
                  ),
                  child: pw.Center(
                      child: pw.Padding(
                          padding: const pw.EdgeInsets.only(
                              top: 10, left: 20, right: 20),
                          child: pw.Column(
                            // mainAxisAlignment: pw.MainAxisAlignment.start,
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            children: [
                              pw.Expanded(
                                flex: 2,
                                child: pw.Container(
                                  margin: const pw.EdgeInsets.only(
                                    top: 3,
                                  ),
                                  decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                        color: PdfColors.black,
                                        width: 2,
                                      ),
                                      image: pw.DecorationImage(
                                          image: pw.MemoryImage(bankImage),
                                          fit: pw.BoxFit.contain)),
                                ),
                              ),
                              pw.SizedBox(height: 10),
                              pw.Text(
                                  'CVEA & Professional Indemnity Insurance Certificate',
                                  style: header1(),
                                  textAlign: pw.TextAlign.center),
                              pw.SizedBox(height: 10),
                              pw.Expanded(
                                flex: 2,
                                child: pw.Container(
                                    margin: const pw.EdgeInsets.only(
                                        top: 3, bottom: 25),
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                        color: PdfColors.black,
                                        width: 2,
                                      ),
                                    ),
                                    child: pw.GridView(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 4,
                                        mainAxisSpacing: 4,
                                        children: [
                                          pw.Container(
                                            decoration: pw.BoxDecoration(
                                                border: pw.Border.all(
                                                  color: PdfColors.black,
                                                  width: 2,
                                                ),
                                                image: pw.DecorationImage(
                                                    image: pw.MemoryImage(
                                                        certi1Image))),
                                          ),
                                          pw.Container(
                                            decoration: pw.BoxDecoration(
                                                border: pw.Border.all(
                                                  color: PdfColors.black,
                                                  width: 2,
                                                ),
                                                image: pw.DecorationImage(
                                                    image: pw.MemoryImage(
                                                        certi2Image),
                                                    fit: pw.BoxFit.contain)),
                                          ),
                                        ])),
                              ),
                            ],
                          ) // Add margin here
                          )),
                ),
              ),
            ],
          ),
        );
      },
    ));

    pdf.addPage(pw.Page(
      pageTheme: pageTheme,
      build: (final context) {
        return pw.FullPage(
          ignoreMargins: true,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            children: [
              pw.Container(
                margin: const pw.EdgeInsets.only(
                    top: 25, right: 25), // Add margin here
                child: pw.Text(
                  "©BY CAMBODIA ANGKOR REAL ESTATE CO., LTD",
                  style: pw.TextStyle(fontSize: 9, font: font),
                ),
              ),
              pw.Expanded(
                flex: 5,
                child: pw.Container(
                  margin: const pw.EdgeInsets.only(
                      top: 5, left: 40, right: 25, bottom: 25),
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(
                      color: PdfColors.black,
                      width: 2, // Adjust border width as needed
                    ),
                  ),
                  child: pw.Center(
                      child: pw.Padding(
                          padding: const pw.EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          child: pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.start,
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                  'Licenses and Certificate Property Valuation Year 2021-2024',
                                  style: header2(true),
                                  textAlign: pw.TextAlign.center),
                              pw.SizedBox(height: 10),
                              pw.Expanded(
                                flex: 2,
                                child: pw.Container(
                                    margin: const pw.EdgeInsets.only(
                                        top: 3, bottom: 25),
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                        color: PdfColors.black,
                                        width: 2,
                                      ),
                                    ),
                                    child: pw.GridView(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 4,
                                        mainAxisSpacing: 4,
                                        children: [
                                          pw.Container(
                                            decoration: pw.BoxDecoration(
                                                border: pw.Border.all(
                                                  color: PdfColors.black,
                                                  width: 2,
                                                ),
                                                image: pw.DecorationImage(
                                                    image: pw.MemoryImage(
                                                        DenImage))),
                                          ),
                                          pw.Container(
                                            decoration: pw.BoxDecoration(
                                                border: pw.Border.all(
                                                  color: PdfColors.black,
                                                  width: 2,
                                                ),
                                                image: pw.DecorationImage(
                                                    image: pw.MemoryImage(
                                                        DoungImage))),
                                          ),
                                          pw.Container(
                                            decoration: pw.BoxDecoration(
                                                border: pw.Border.all(
                                                  color: PdfColors.black,
                                                  width: 2,
                                                ),
                                                image: pw.DecorationImage(
                                                    image: pw.MemoryImage(
                                                        nullImage))),
                                          ),
                                          pw.Container(
                                            decoration: pw.BoxDecoration(
                                                border: pw.Border.all(
                                                  color: PdfColors.black,
                                                  width: 2,
                                                ),
                                                image: pw.DecorationImage(
                                                    image: pw.MemoryImage(
                                                        null1Image))),
                                          ),
                                        ])),
                              ),
                            ],
                          ) // Add margin here
                          )),
                ),
              ),
            ],
          ),
        );
      },
    ));

    final pdfBytes = pdf.save();

    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdfBytes);
    return pdf.save();
  }

  Future<pw.PageTheme> _myPageTheme(PdfPageFormat format) async {
    final logoImage = pw.MemoryImage(
      (await rootBundle.load('assets/images/logo.jpg')).buffer.asUint8List(),
    );
    return pw.PageTheme(
      // margin: const pw.EdgeInsets.symmetric(
      //     horizontal: 1 * PdfPageFormat.cm, vertical: 0.5 * PdfPageFormat.cm),
      textDirection: pw.TextDirection.ltr,
      orientation: pw.PageOrientation.portrait,
      buildBackground: (final context) => pw.FullPage(
          ignoreMargins: false,
          child: pw.Watermark(
              angle: 0,
              child: pw.Opacity(
                opacity: 0.02,
                child: pw.Image(logoImage, fit: pw.BoxFit.contain),
              ))),
      
    );
  }

  Future<void> saveAsFile(
    final BuildContext context,
    final LayoutCallback build,
    final PdfPageFormat pageFormat,
  ) async {
    final bytes = await build(pageFormat);

    final appDocDir = await getApplicationDocumentsDirectory();
    final appDocPath = appDocDir.path;
    final file = File('$appDocPath/document.pdf');
    print('save as file ${file.path}...');
    await file.writeAsBytes(bytes);
    await OpenFile.open(file.path);
  }

  void showPrintedToast(final BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Document printed successfully')));
  }

  void showSharedToast(final BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Document shared successfully')));
  }
}
