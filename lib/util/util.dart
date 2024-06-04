import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<Uint8List> generatePdf(final PdfPageFormat format) async {
  final doc = pw.Document(
    title: "FULL REPORT BOOK",
  );

  final logoImage = pw.MemoryImage(
    (await rootBundle.load('assets/images/logo.jpg')).buffer.asUint8List(),
  );

  final coverImage = pw.MemoryImage(
      (await rootBundle.load('assets/images/cover1.jpg')).buffer.asUint8List());

  final angkorImage1 = pw.MemoryImage(
      (await rootBundle.load('assets/images/angkor.jpg')).buffer.asUint8List());

  final idImage = pw.MemoryImage(
      (await rootBundle.load('assets/images/idcard.jpg')).buffer.asUint8List());

  final ownerImage = pw.MemoryImage(
      (await rootBundle.load('assets/images/owner.jpg')).buffer.asUint8List());

  final ByteData angkor = await rootBundle.load('assets/images/angkor.jpg');
  final Uint8List angkorImage = angkor.buffer.asUint8List();

  final ByteData p = await rootBundle.load('assets/images/pimage.jpg');
  final Uint8List pImage = p.buffer.asUint8List();

  final ByteData bytes = await rootBundle.load('assets/images/layout1.jpg');
  final Uint8List layoutImage = bytes.buffer.asUint8List();

  final ByteData map = await rootBundle.load('assets/images/map.jpg');
  final Uint8List mapImage = map.buffer.asUint8List();

  final ByteData map1 = await rootBundle.load('assets/images/map1.jpg');
  final Uint8List map1Image = map1.buffer.asUint8List();

  final ByteData smap = await rootBundle.load('assets/images/smap.jpg');
  final Uint8List smapImage = smap.buffer.asUint8List();

  final ByteData sketch = await rootBundle.load('assets/images/sketch.png');
  final Uint8List sketchImage = sketch.buffer.asUint8List();

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

  // Uint8List? layoutImage;

  final pageTheme = await _myPageTheme(format);
  final font = await PdfGoogleFonts.notoSansAdlamRegular();
  final h_font = await PdfGoogleFonts.notoSansAdlamBold();
  final b_font = await PdfGoogleFonts.notoSansAdlamBold();

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
        font: h_font,
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
  // doc.addPage(pw.Page(
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
  doc.addPage(
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
                    top: 30, right: 25), // Add margin here
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
                          top: 25,
                        ), // Add margin here
                        child: pw.Text(
                          "PROPERTY [LAND AND BUILDING] VALUATION \n REPORT TO",
                          style: header1(),
                          textAlign: pw.TextAlign.center,
                        ),
                      ),
                      pw.Text("\nLIIPENG SEA BANK PLC \n(Phnom Penh Branch)",
                          style: header1(), textAlign: pw.TextAlign.center),
                      pw.Padding(
                        padding: const pw.EdgeInsets.only(
                            top: 15, bottom: 15), // Add margin here
                        child: pw.Text("FOR", style: header1()),
                      ),
                      pw.Container(
                        child: pw.RichText(
                          text: pw.TextSpan(
                            text: '[',
                            style: header2(true), // Base style
                            children: [
                              pw.TextSpan(
                                text: 'MR. ',
                                style: header2(false),
                              ),
                              pw.TextSpan(
                                text: 'VANNA BONE',
                                style: header2(true),
                              ),
                              pw.TextSpan(
                                text: ' & ',
                                style: header2(true),
                              ),
                              pw.TextSpan(
                                text: 'MRS. ',
                                style: header2(false),
                              ),
                              pw.TextSpan(
                                text: 'VANNA DONE]',
                                style: header2(true),
                              ),
                            ],
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
                                text: ' ABC-123-123',
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
                          child: pw.Image(angkorImage1,
                              fit: pw.BoxFit.cover, height: 280)),
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
                                      ' R&B CITY, C3-123, Concrete Road, Prek Ta Nu Village, Sangkat Chak Angrae Lue, Khan Mean Chey, Phnom Penh.',
                                  style: header2(true),
                                ),
                              ],
                            ),
                            textAlign: pw.TextAlign.center), // Add margin here
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.only(), // Add margin here
                        child: pw.RichText(
                          text: pw.TextSpan(
                            text: '\nREPORTED, PHNOM PENH,',
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
                                text: '10th FEBRUARY, 2024',
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
                          text: 'CAMBODIA ANGKOR REAL ESTATE CO.,LTD.',
                          style: header2(false), // Base style
                        ),
                      ),
                      pw.Padding(
                        padding:
                            const pw.EdgeInsets.only(top: 5), // Add margin here
                        child: pw.RichText(
                          text: pw.TextSpan(
                            text: 'Copy Right by: C-A-R-E',
                            style: header2(true), // Base style
                          ),
                        ),
                      ),
                      pw.RichText(
                        text: pw.TextSpan(
                          text: '\nNº : PP-4-24-02-00V2',
                          style: header2(true), // Base style
                        ),
                      ),
                      pw.SizedBox(height: 20),
                      pw.Text("I", style: header2(false))
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
  doc.addPage(
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
                    top: 30, right: 25), // Add margin here
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
                          top: 25,
                        ), // Add margin here
                        child: pw.Text(
                          "Contents",
                          style: header1(),
                          textAlign: pw.TextAlign.center,
                        ),
                      ),
                      pw.Text("General Information)",
                          style: header1(), textAlign: pw.TextAlign.center),
                      pw.Container(
                        padding: pw.EdgeInsets.only(left: 15, right: 15),
                        child: pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text("\nSubject",
                                  style: header1(),
                                  textAlign: pw.TextAlign.center),
                              pw.Text("\nPage",
                                  style: header1(),
                                  textAlign: pw.TextAlign.center),
                            ]),
                      ),
                      pw.Text(
                          "\nIntroduction ............................................................................................................................................ -1 -",
                          style: body(),
                          textAlign: pw.TextAlign.center),
                      pw.Text(
                        "\nPROPERTY [LAND AND BUILDING] VALUATION REPORT ",
                        style: header2(true),
                        textAlign: pw.TextAlign.center,
                      ),
                      pw.Text(
                          "\nProperty [Land and Building] Valuation Report ............................................................................... -2 -",
                          style: body(),
                          textAlign: pw.TextAlign.center),
                      pw.Text(
                          "\nOwner's Indentification Card ............................................................................................................... -5 -",
                          style: body(),
                          textAlign: pw.TextAlign.center),
                      pw.Text(
                          "\nCopy Title Deed ...................................................................................................................................... -6 -",
                          style: body(),
                          textAlign: pw.TextAlign.center),
                      pw.Text(
                          "\nLand and Building Layout .................................................................................................................. -10 -",
                          style: body(),
                          textAlign: pw.TextAlign.center),
                      pw.Text(
                          "\nCambodia Map & Location Map In Phnom Penh ............................................................................ -11 -",
                          style: body(),
                          textAlign: pw.TextAlign.center),
                      pw.Text(
                          "\nAerial Photograph Of Phnom Penh Loacation ................................................................................. -12 -",
                          style: body(),
                          textAlign: pw.TextAlign.center),
                      pw.Text(
                          "\nDetails Of Photos Taken At The Site Inspection ............................................................................... -13 -",
                          style: body(),
                          textAlign: pw.TextAlign.center),
                      pw.Text(
                          "\nInspaction Officer's Report ................................................................................................................. -18 -",
                          style: body(),
                          textAlign: pw.TextAlign.center),
                      pw.Text(
                          "\nProposed Developments Affecting The Value Of The Subject Land .............................................. -19 -",
                          style: body(),
                          textAlign: pw.TextAlign.center),
                      pw.Text(
                          "\nValue Of Comparable Nearby Property ............................................................................................ -20 -",
                          style: body(),
                          textAlign: pw.TextAlign.center),
                      pw.Text(
                          "\nProvisional Valuation Made By The Inspecting Officer(S) ............................................................. -22 -",
                          style: body(),
                          textAlign: pw.TextAlign.center),
                      pw.Text(
                        "\nFinal Valuation",
                        style: header2(true),
                        textAlign: pw.TextAlign.center,
                      ),
                      pw.Text(
                          "\nFinal Indication Of Subject Property Market Value ....................................................................... -23 -",
                          style: body(),
                          textAlign: pw.TextAlign.center),
                      pw.Text(
                        "\nAppendix",
                        style: header2(true),
                        textAlign: pw.TextAlign.center,
                      ),
                      pw.Text(
                          "\nC.A.R.E Limiting Terms, Condition & Liability .............................................................................. -24 -",
                          style: body(),
                          textAlign: pw.TextAlign.center),
                      pw.Text(
                          "\nOur Valued Partners and CVEA & Professional Indemnity Insurance Certificate ..................... -26 - ",
                          style: body(),
                          textAlign: pw.TextAlign.center),
                      pw.Text(
                          "\nLicenses and Certificate Property Valuation ................................................................................. -27 -",
                          style: body(),
                          textAlign: pw.TextAlign.center),
                      pw.SizedBox(height: 20),
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

  //Fourth page
  doc.addPage(
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
                    top: 30, right: 25), // Add margin here
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
                          pw.Text("\nDate of Valuation", style: header2(true)),
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
  doc.addPage(
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
                    top: 30, right: 25), // Add margin here
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
                                top: 20, left: -20), // Add margin here
                            child: pw.Text(
                              "Property [Land and Building] Valuation Report",
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
                                pw.TextSpan(
                                  text: 'Property [Land and Building]',
                                  style: header2(true),
                                ),
                                pw.TextSpan(
                                  text:
                                      ' Valuation Report as a true and accurate reflection of the current market value of the Subject Property.  This Property [Land and Building] Valuation Report has been prepared to',
                                  style: body1(),
                                ),
                                pw.TextSpan(
                                  text:
                                      ' Shinhan Bank (Cambodia) Plc. (Stueng Meanchey Branch),',
                                  style: header2(true),
                                ),
                                pw.TextSpan(
                                  text: ' for ownership’s name',
                                  style: body1(),
                                ),
                                pw.TextSpan(
                                  text:
                                      ' \nMr. Ven Sam Ath & Mr. Hgov Songhour,',
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
                            child: pw.Text(
                              "General Details of Subject Property [Land and Building]",
                              style: header2(true),
                              textAlign: pw.TextAlign.center,
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                              top: 10,
                            ), // Add margin here
                            child: pw.Text(
                              "Land Location",
                              style: header2(true),
                              textAlign: pw.TextAlign.center,
                            ),
                          ),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  top: 5, left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "Plot Nº                                                    : ",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  "N/A",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  top: 5, left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "Street                                                     : ",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  "Unnamed Road",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  top: 5, left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "Village                                                    : ",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  "Praek Kul",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  top: 5, left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "Communue/Sangkat                          : ",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  "Praek Kul",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  top: 5, left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "District/City                                           : ",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  "Koh Sotin",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  top: 5, left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "Province                                                 : ",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  "Kampong Cham",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  top: 5, left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "Country                                                  : ",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  "Cambodia",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                              top: 10,
                            ), // Add margin here
                            child: pw.Text(
                              "Bordered by the following ",
                              style: header2(true),
                              textAlign: pw.TextAlign.center,
                            ),
                          ),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  top: 5, left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "North                                                       : ",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  "Private Property",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  top: 5, left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "South                                                       : ",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  "Private Property",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  top: 5, left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "East                                                          : ",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  "Private Property",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  top: 5, left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "West                                                         : ",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  "Private Property",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                              top: 10,
                            ), // Add margin here
                            child: pw.Text(
                              "Land Title Deed Number",
                              style: header2(true),
                              textAlign: pw.TextAlign.center,
                            ),
                          ),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  top: 5, left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "Land Title Deed No                                : ",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  "ABA-67733 Issued on 14th January 2019",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                              top: 10,
                            ), // Add margin here
                            child: pw.Text(
                              "Land Size by Title Deed",
                              style: header2(true),
                              textAlign: pw.TextAlign.center,
                            ),
                          ),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  top: 5, left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "Land Size                                                  :",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  " 65.00sqm",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                              top: 10,
                            ), // Add margin here
                            child: pw.Text(
                              "Land Size by Measurement",
                              style: header2(true),
                              textAlign: pw.TextAlign.center,
                            ),
                          ),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  top: 5, left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "Total Land Size                                        : ",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  "68.25sqm",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                              top: 10,
                            ), // Add margin here
                            child: pw.Text(
                              "Type of Land",
                              style: header2(true),
                              textAlign: pw.TextAlign.center,
                            ),
                          ),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  top: 5, left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "Type of land                                             : ",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  "Residential and Commercial ",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  top: 5, left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "Occupant                                                  : ",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  "[Freehold]",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
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

  //New Page
  doc.addPage(
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
                    top: 30, right: 25), // Add margin here
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
                          pw.SizedBox(height: 20),
                          pw.Text(
                            "Building Size  ",
                            style: header2(true),
                            textAlign: pw.TextAlign.center,
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(top: 5, left: 20),
                            // Add margin here
                            child: pw.Text(
                              "Flat",
                              style: header4(),
                              textAlign: pw.TextAlign.center,
                            ),
                          ),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "Building Size                                         : ",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  "50.75sqm",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  top: 15, left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "Roof Extension",
                                  style: header4(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "Building Size                                         : ",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  "17.50sqm",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  top: 15, left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "Total Building Size                              : ",
                                  style: header4(),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  "68.25sqm",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                              top: 15,
                            ), // Add margin here
                            child: pw.Text(
                              "Building Detail",
                              style: header2(true),
                              textAlign: pw.TextAlign.center,
                            ),
                          ),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "Type of Building                                    : ",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  "Flat",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "Age of Building                                      : ",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  "30 Years",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "Cost of Construction",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "By owner                                                 : ",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  "N/A",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "Metal Roof area                                     : ",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  "N/A",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "Occupied or Vacant                               : ",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  "Occupied",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "Disposability                                            : ",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  "Good",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "Quality given as a",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "Percentaget                                             : ",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  "70%",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "Type of building                                      : ",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  "[freehold]",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                              top: 10,
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
                                      width: 2, // Adjust border width as needed
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
                                                      alignment:
                                                          pw.Alignment.center)),
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
                                                      child: pw.Row(
                                                          crossAxisAlignment: pw
                                                              .CrossAxisAlignment
                                                              .center,
                                                          mainAxisAlignment: pw
                                                              .MainAxisAlignment
                                                              .center,
                                                          children: [
                                                            pw.Text("Floor :",
                                                                textAlign: pw
                                                                    .TextAlign
                                                                    .center),
                                                            pw.Text(" Concrete",
                                                                textAlign: pw
                                                                    .TextAlign
                                                                    .center),
                                                          ]))),
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
                                                      child: pw.Row(
                                                          crossAxisAlignment: pw
                                                              .CrossAxisAlignment
                                                              .center,
                                                          mainAxisAlignment: pw
                                                              .MainAxisAlignment
                                                              .center,
                                                          children: [
                                                            pw.Text("Door  :",
                                                                textAlign: pw
                                                                    .TextAlign
                                                                    .center),
                                                            pw.Text(" Wood",
                                                                textAlign: pw
                                                                    .TextAlign
                                                                    .center),
                                                          ]))),
                                              pw.Expanded(
                                                  child: pw.Container(
                                                      child: pw.Row(
                                                          crossAxisAlignment: pw
                                                              .CrossAxisAlignment
                                                              .center,
                                                          mainAxisAlignment: pw
                                                              .MainAxisAlignment
                                                              .center,
                                                          children: [
                                                    pw.Text("Window :",
                                                        textAlign: pw
                                                            .TextAlign.center),
                                                    pw.Text(" Glass, Metal ",
                                                        textAlign: pw
                                                            .TextAlign.center),
                                                  ]))),
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
                                                      child: pw.Row(
                                                          crossAxisAlignment: pw
                                                              .CrossAxisAlignment
                                                              .center,
                                                          mainAxisAlignment: pw
                                                              .MainAxisAlignment
                                                              .center,
                                                          children: [
                                                            pw.Text("Stair :",
                                                                textAlign: pw
                                                                    .TextAlign
                                                                    .center),
                                                            pw.Text(
                                                                " : Concrete, Wood ",
                                                                textAlign: pw
                                                                    .TextAlign
                                                                    .center),
                                                          ]))),
                                              pw.Expanded(
                                                  child: pw.Container(
                                                      child: pw.Row(
                                                          crossAxisAlignment: pw
                                                              .CrossAxisAlignment
                                                              .center,
                                                          mainAxisAlignment: pw
                                                              .MainAxisAlignment
                                                              .center,
                                                          children: [
                                                    pw.Text("Roof :",
                                                        textAlign: pw
                                                            .TextAlign.center),
                                                    pw.Text(" Concrete",
                                                        textAlign: pw
                                                            .TextAlign.center),
                                                  ]))),
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
                                                      child: pw.Row(
                                                          crossAxisAlignment: pw
                                                              .CrossAxisAlignment
                                                              .center,
                                                          mainAxisAlignment: pw
                                                              .MainAxisAlignment
                                                              .center,
                                                          children: [
                                                            pw.Text("Ceiling :",
                                                                textAlign: pw
                                                                    .TextAlign
                                                                    .center),
                                                            pw.Text(" Gypsums",
                                                                textAlign: pw
                                                                    .TextAlign
                                                                    .center),
                                                          ]))),
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
                                                      child: pw.Row(
                                                          crossAxisAlignment: pw
                                                              .CrossAxisAlignment
                                                              .center,
                                                          mainAxisAlignment: pw
                                                              .MainAxisAlignment
                                                              .center,
                                                          children: [
                                                            pw.Text("Wall :",
                                                                textAlign: pw
                                                                    .TextAlign
                                                                    .center),
                                                            pw.Text(" Brick",
                                                                textAlign: pw
                                                                    .TextAlign
                                                                    .center),
                                                          ])))
                                            ]))),
                                    pw.Expanded(
                                        flex: 3,
                                        child: pw.Container(
                                            child: pw.Column(children: [
                                          pw.Expanded(
                                              child: pw.Container(
                                                  width: double.infinity,
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                  child: pw.Text(
                                                      "Internal Description",
                                                      style: header4()),
                                                  alignment:
                                                      pw.Alignment.center)),
                                          pw.Expanded(
                                              child: pw.Container(
                                                  child: pw.Text(
                                                    "Floor/Story",
                                                  ),
                                                  alignment:
                                                      pw.Alignment.center)),
                                          pw.Expanded(
                                              child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                  child: pw.Text(
                                                    "Bathroom",
                                                  ),
                                                  alignment:
                                                      pw.Alignment.center)),
                                          pw.Expanded(
                                              child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                  child: pw.Text(
                                                    "Room ",
                                                  ),
                                                  alignment:
                                                      pw.Alignment.center)),
                                          pw.Expanded(
                                              child: pw.Container(
                                                  child: pw.Container(
                                                      child: pw.Text(
                                                        "Kitchen",
                                                      ),
                                                      alignment: pw
                                                          .Alignment.center))),
                                          pw.Expanded(
                                              child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                  child: pw.Container(
                                                      child: pw.Text(
                                                        "Dining/Living Room",
                                                      ),
                                                      alignment: pw
                                                          .Alignment.center))),
                                          pw.Expanded(
                                              child: pw.Container(
                                                  child: pw.Text(
                                                    "Storage Room",
                                                  ),
                                                  alignment:
                                                      pw.Alignment.center)),
                                          pw.Expanded(
                                              child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                  child: pw.Text(
                                                    "Total Accommodation",
                                                  ),
                                                  alignment:
                                                      pw.Alignment.center))
                                        ]))),
                                    pw.Expanded(
                                        flex: 2,
                                        child: pw.Container(
                                            child: pw.Column(children: [
                                          pw.Expanded(
                                              child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                  child: pw.Text("Quantity",
                                                      style: header4()),
                                                  alignment:
                                                      pw.Alignment.center)),
                                          pw.Expanded(
                                              child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                  child: pw.Text(
                                                    "01",
                                                  ),
                                                  alignment:
                                                      pw.Alignment.center)),
                                          pw.Expanded(
                                              child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                  child: pw.Text(
                                                    "01",
                                                  ),
                                                  alignment:
                                                      pw.Alignment.center)),
                                          pw.Expanded(
                                              child: pw.Container(
                                                  child: pw.Text(
                                                    "01",
                                                  ),
                                                  alignment:
                                                      pw.Alignment.center)),
                                          pw.Expanded(
                                              child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                  child: pw.Text(
                                                    "01",
                                                  ),
                                                  alignment:
                                                      pw.Alignment.center)),
                                          pw.Expanded(
                                              child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                  child: pw.Text(
                                                    "01",
                                                  ),
                                                  alignment:
                                                      pw.Alignment.center)),
                                          pw.Expanded(
                                              child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                  child: pw.Text(
                                                    "N/A",
                                                  ),
                                                  alignment:
                                                      pw.Alignment.center)),
                                          pw.Expanded(
                                              child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                  child: pw.Text(
                                                    "06",
                                                  ),
                                                  alignment:
                                                      pw.Alignment.center))
                                        ]))),
                                  ]))),
                          pw.Text(
                            "Utilities/Facilities Available",
                            style: header2(true),
                            textAlign: pw.TextAlign.center,
                          ),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "Water                                                       : ",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  "Available",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "Electricity                                                 : ",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  "Available",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "Sewerage                                                : ",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  "Available",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "Telecommunications                            : ",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  "Available",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "Security                                                    : ",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  "Good",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  left: 20), // Add margin here
                              child: pw.Row(children: [
                                pw.Text(
                                  "Garage/Parking                                      : ",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  "Available",
                                  style: body(),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ])),
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

  //Page six
  doc.addPage(
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
                    top: 30, right: 25), // Add margin here
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
                                  crossAxisSpacing: 2,
                                  mainAxisSpacing: 6,
                                  childAspectRatio: 0.59,
                                  children: [
                                    for (int i = 0; i < 4; i++)
                                      pw.Image(idImage, width: 260),
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
  doc.addPage(
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
                    top: 30, right: 25), // Add margin here
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
                              pw.Text('Copy Land Title Deed No: ABA-123-123',
                                  style: header2(true),
                                  textAlign: pw.TextAlign.start),
                              pw.SizedBox(height: 10),
                              pw.GridView(
                                  crossAxisCount: 1,
                                  // crossAxisSpacing: 2,
                                  mainAxisSpacing: 30,
                                  childAspectRatio: 0.59,
                                  children: [
                                    for (int i = 0; i < 2; i++)
                                      pw.Image(
                                        ownerImage,
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

  // Page Eight
  doc.addPage(pw.Page(
    pageTheme: pageTheme,
    build: (final context) {
      return pw.FullPage(
        ignoreMargins: true,
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            pw.Container(
              margin: const pw.EdgeInsets.only(
                  top: 30, right: 25), // Add margin here
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
                            pw.Text('Land and Building Layout',
                                style: header2(true),
                                textAlign: pw.TextAlign.start),
                            pw.Expanded(
                              child: (layoutImage != null)
                                  ? pw.Container(
                                      margin: const pw.EdgeInsets.only(
                                          top: 10,
                                          left: 25,
                                          right: 25,
                                          bottom: 50),
                                      decoration: pw.BoxDecoration(
                                        image: pw.DecorationImage(
                                            image: pw.MemoryImage(layoutImage)),
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
  doc.addPage(pw.Page(
    pageTheme: pageTheme,
    build: (final context) {
      return pw.FullPage(
        ignoreMargins: true,
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            pw.Container(
              margin: const pw.EdgeInsets.only(
                  top: 30, right: 25), // Add margin here
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
                                                image:
                                                    pw.MemoryImage(mapImage))),
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
                                                  child: pw.Text(
                                                      "Phnom Penh To All Province",
                                                      style: body1(),
                                                      textAlign:
                                                          pw.TextAlign.center)),
                                              pw.Expanded(
                                                  child: pw.Container(
                                                      decoration:
                                                          pw.BoxDecoration(
                                                border: pw.Border.all(
                                                  color: PdfColors.black,
                                                  width: 2,
                                                ),
                                              ))),
                                              pw.Expanded(
                                                  child: pw.Container(
                                                      decoration:
                                                          pw.BoxDecoration(
                                                border: pw.Border.all(
                                                  color: PdfColors.black,
                                                  width: 2,
                                                ),
                                              ))),
                                              pw.Expanded(
                                                  child: pw.Container(
                                                      decoration:
                                                          pw.BoxDecoration(
                                                border: pw.Border.all(
                                                  color: PdfColors.black,
                                                  width: 2,
                                                ),
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
                                            image: pw.MemoryImage(map1Image)))))
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

  //Page ninght
  doc.addPage(pw.Page(
    pageTheme: pageTheme,
    build: (final context) {
      return pw.FullPage(
        ignoreMargins: true,
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            pw.Container(
              margin: const pw.EdgeInsets.only(
                  top: 30, right: 25), // Add margin here
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
                            pw.Text('Aerial Photograph of Phnom Penh Location',
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
                                                image:
                                                    pw.MemoryImage(smapImage))),
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
                                                pw.MemoryImage(sketchImage)))))
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
  doc.addPage(pw.Page(
    pageTheme: pageTheme,
    build: (final context) {
      return pw.FullPage(
        ignoreMargins: true,
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            pw.Container(
              margin: const pw.EdgeInsets.only(
                  top: 30, right: 25), // Add margin here
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
                            pw.Text('Aerial Photograph of Phnom Penh Location',
                                style: header2(true),
                                textAlign: pw.TextAlign.start),
                            pw.Text('I. Photo front view of the property',
                                style: header3(),
                                textAlign: pw.TextAlign.start),
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
                                        image: pw.MemoryImage(angkorImage))),
                              ),
                            ),
                            pw.Text('II. Photos inside view of the property',
                                style: header3(),
                                textAlign: pw.TextAlign.start),
                            pw.Text('1.Photos view of the Office Space ',
                                style: header3(),
                                textAlign: pw.TextAlign.start),
                            pw.Expanded(
                              flex: 2,
                              child: pw.Container(
                                  margin: const pw.EdgeInsets.only(
                                      top: 3, bottom: 5),
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
                                        for (int i = 0; i < 4; i++)
                                          pw.Container(
                                            decoration: pw.BoxDecoration(
                                                border: pw.Border.all(
                                                  color: PdfColors.black,
                                                  width: 2,
                                                ),
                                                image: pw.DecorationImage(
                                                    image: pw.MemoryImage(
                                                        angkorImage))),
                                          ),
                                      ])),
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

  //Page Twenty
  doc.addPage(pw.Page(
    pageTheme: pageTheme,
    build: (final context) {
      return pw.FullPage(
        ignoreMargins: true,
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            pw.Container(
              margin: const pw.EdgeInsets.only(
                top: 30,
                right: 25,
              ), // Add margin here
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
                            top: 10, left: 20, right: 20, bottom: 20),
                        child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          crossAxisAlignment: pw.CrossAxisAlignment.center,
                          children: [
                            pw.Text(
                                'III. Photos view of Access Road to the Property',
                                style: header3(),
                                textAlign: pw.TextAlign.start),
                            pw.Expanded(
                              flex: 2,
                              child: pw.Container(
                                  margin: const pw.EdgeInsets.only(
                                      top: 3, bottom: 5),
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
                                        for (int i = 0; i < 2; i++)
                                          pw.Container(
                                            decoration: pw.BoxDecoration(
                                                border: pw.Border.all(
                                                  color: PdfColors.black,
                                                  width: 2,
                                                ),
                                                image: pw.DecorationImage(
                                                    image: pw.MemoryImage(
                                                        angkorImage))),
                                          ),
                                      ])),
                            ),
                            pw.Text(
                                'IV. Photos surroundings view of the Property',
                                style: header3(),
                                textAlign: pw.TextAlign.start),
                            pw.Expanded(
                              flex: 2,
                              child: pw.Container(
                                  margin: const pw.EdgeInsets.only(
                                      top: 3, bottom: 5),
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
                                        for (int i = 0; i < 2; i++)
                                          pw.Container(
                                            decoration: pw.BoxDecoration(
                                                border: pw.Border.all(
                                                  color: PdfColors.black,
                                                  width: 2,
                                                ),
                                                image: pw.DecorationImage(
                                                    image: pw.MemoryImage(
                                                        angkorImage))),
                                          ),
                                      ])),
                            ),
                            pw.Text('1.Photos view of the Office Space ',
                                style: header3(),
                                textAlign: pw.TextAlign.start),
                            pw.Expanded(
                              flex: 2,
                              child: pw.Container(
                                  margin: const pw.EdgeInsets.only(
                                      top: 3, bottom: 5),
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
                                        for (int i = 0; i < 2; i++)
                                          pw.Container(
                                            decoration: pw.BoxDecoration(
                                                border: pw.Border.all(
                                                  color: PdfColors.black,
                                                  width: 2,
                                                ),
                                                image: pw.DecorationImage(
                                                    image: pw.MemoryImage(
                                                        angkorImage))),
                                          ),
                                      ])),
                            ),
                            pw.Text('1.Photos view of the Office Space ',
                                style: header3(),
                                textAlign: pw.TextAlign.start),
                            pw.Expanded(
                              flex: 2,
                              child: pw.Container(
                                  margin: const pw.EdgeInsets.only(
                                      top: 3, bottom: 5),
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
                                        for (int i = 0; i < 2; i++)
                                          pw.Container(
                                            decoration: pw.BoxDecoration(
                                                border: pw.Border.all(
                                                  color: PdfColors.black,
                                                  width: 2,
                                                ),
                                                image: pw.DecorationImage(
                                                    image: pw.MemoryImage(
                                                        angkorImage))),
                                          ),
                                      ])),
                            ),
                            pw.Text('1.Photos view of the Office Space ',
                                style: header3(),
                                textAlign: pw.TextAlign.start),
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
  doc.addPage(
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
                    top: 30, right: 25), // Add margin here
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
                              text:
                                  'The Subject Property [Land and Building] was inspected by an appraisal team from Cambodia Angkor Real Estate Co., Ltd. on ',
                              style: body1(), // Base style
                              children: [
                                pw.TextSpan(
                                  text: '24th May 2024. ',
                                  style: header2(true),
                                ),
                                pw.TextSpan(
                                  text:
                                      'This report has been compiled directly from information gathered during the site inspection.',
                                  style: body1(),
                                ),
                              ],
                            ),
                          ),
                          pw.Text("\nCondition of property", style: header3()),
                          pw.RichText(
                            text: pw.TextSpan(
                              text:
                                  'The property is located along Street 335 about 25 meters from Beung Salang Primary School. The subject land size is 468.00sqm. It is next to a flat on the North and South boundary.',
                              style: body1(), // Base style
                            ),
                          ),
                          pw.Text("\nImmediate Environment", style: header3()),
                          pw.Text(
                              "The subject property is surrounded by residential, shops, private companies, schools, restaurants, condo and other business activities.",
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
                          pw.Expanded(
                              child: pw.Container(
                                  margin: const pw.EdgeInsets.only(
                                      top: 5, right: 20, bottom: 25),
                                  decoration: pw.BoxDecoration(
                                    border: pw.Border.all(
                                      color: PdfColors.black,
                                      width: 2, // Adjust border width as needed
                                    ),
                                  ),
                                  child: pw.Row(children: [
                                    pw.Expanded(
                                        child: pw.Container(
                                            child: pw.Column(
                                      children: [
                                        pw.Expanded(
                                          flex: 1,
                                          child: pw.Container(
                                            width: 225, // Set a fixed width
                                            height: 255, // Set a fixed height
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                color: PdfColors.black,
                                                width:
                                                    2, // Adjust border width as needed
                                              ),
                                            ),
                                            child: pw.Center(
                                              child: pw.Text("Strengths",
                                                  style: header2(false)),
                                            ),
                                          ),
                                        ),
                                        pw.Expanded(
                                            flex: 6, child: pw.Container()),
                                        pw.Expanded(
                                            flex: 1,
                                            child: pw.Container(
                                              decoration: pw.BoxDecoration(
                                                border: pw.Border.all(
                                                  color: PdfColors.black,
                                                  width:
                                                      2, // Adjust border width as needed
                                                ),
                                              ),
                                              child: pw.Center(
                                                child: pw.Text("Opportunities",
                                                    style: header2(false)),
                                              ),
                                            )),
                                        pw.Expanded(
                                            flex: 3,
                                            child: pw.Container(
                                              decoration: pw.BoxDecoration(
                                                border: pw.Border.all(
                                                  color: PdfColors.black,
                                                  width:
                                                      2, // Adjust border width as needed
                                                ),
                                              ),
                                            ))
                                      ],
                                    ))),
                                    pw.Expanded(
                                        child: pw.Container(
                                            child: pw.Column(
                                      children: [
                                        pw.Expanded(
                                            flex: 1,
                                            child: pw.Container(
                                              child: pw.Center(
                                                child: pw.Text("Weakness",
                                                    style: header2(false)),
                                              ),
                                            )),
                                        pw.Expanded(
                                            flex: 6,
                                            child: pw.Container(
                                              decoration: pw.BoxDecoration(
                                                border: pw.Border.all(
                                                  color: PdfColors.black,
                                                  width:
                                                      2, // Adjust border width as needed
                                                ),
                                              ),
                                            )),
                                        pw.Expanded(
                                            flex: 1,
                                            child: pw.Container(
                                              child: pw.Center(
                                                child: pw.Text("Threats",
                                                    style: header2(false)),
                                              ),
                                            )),
                                        pw.Expanded(
                                            flex: 3,
                                            child: pw.Container(
                                              width: 225, // Set a fixed width
                                              height: 255, // Set a
                                              decoration: pw.BoxDecoration(
                                                border: pw.Border.all(
                                                  color: PdfColors.black,
                                                  width:
                                                      2, // Adjust border width as needed
                                                ),
                                              ),
                                            ))
                                      ],
                                    ))),
                                  ])))
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
  doc.addPage(
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
                    top: 30, right: 25), // Add margin here
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
  doc.addPage(
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
                    top: 30, right: 25), // Add margin here
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
                                top: 20, left: -20), // Add margin here
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
                          pw.Text("\$400 - 250 / sqm",
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
                          pw.Expanded(
                              child: pw.Container(
                                  margin: const pw.EdgeInsets.only(
                                      top: 10, left: -15, bottom: 20),
                                  decoration: pw.BoxDecoration(
                                    border: pw.Border.all(
                                      color: PdfColors.black,
                                      width: 2, // Adjust border width as needed
                                    ),
                                  ),
                                  child: pw.Row(children: [
                                    pw.Expanded(
                                        child: pw.Container(
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                color: PdfColors.black,
                                                width:
                                                    2, // Adjust border width as needed
                                              ),
                                            ),
                                            child: pw.Column(
                                              children: [
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                              ],
                                            ))),
                                    pw.Expanded(
                                        child: pw.Container(
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                color: PdfColors.black,
                                                width:
                                                    2, // Adjust border width as needed
                                              ),
                                            ),
                                            child: pw.Column(
                                              children: [
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                              ],
                                            ))),
                                    pw.Expanded(
                                        child: pw.Container(
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                color: PdfColors.black,
                                                width:
                                                    2, // Adjust border width as needed
                                              ),
                                            ),
                                            child: pw.Column(
                                              children: [
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                              ],
                                            ))),
                                    pw.Expanded(
                                        child: pw.Container(
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                color: PdfColors.black,
                                                width:
                                                    2, // Adjust border width as needed
                                              ),
                                            ),
                                            child: pw.Column(
                                              children: [
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                              ],
                                            ))),
                                    pw.Expanded(
                                        child: pw.Container(
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                color: PdfColors.black,
                                                width:
                                                    2, // Adjust border width as needed
                                              ),
                                            ),
                                            child: pw.Column(
                                              children: [
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                              ],
                                            ))),
                                    pw.Expanded(
                                        child: pw.Container(
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                color: PdfColors.black,
                                                width:
                                                    2, // Adjust border width as needed
                                              ),
                                            ),
                                            child: pw.Column(
                                              children: [
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                              ],
                                            ))),
                                    pw.Expanded(
                                        child: pw.Container(
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                color: PdfColors.black,
                                                width:
                                                    2, // Adjust border width as needed
                                              ),
                                            ),
                                            child: pw.Column(
                                              children: [
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                                pw.Expanded(
                                                    child: pw.Container(
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                )),
                                              ],
                                            ))),
                                  ])))
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
  doc.addPage(pw.Page(
    pageTheme: pageTheme,
    build: (final context) {
      return pw.FullPage(
        ignoreMargins: true,
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            pw.Container(
              margin: const pw.EdgeInsets.only(
                  top: 30, right: 25), // Add margin here
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
                                      top: 10, left: 10, right: 10, bottom: 20),
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
                                                image: pw.MemoryImage(pImage))),
                                      ),
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

  //Page Seventeen
  doc.addPage(pw.Page(
      pageTheme: pageTheme,
      build: (final context) {
        return pw.FullPage(
            ignoreMargins: true,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Container(
                  margin: const pw.EdgeInsets.only(
                      top: 30, right: 25), // Add margin here
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
                            padding: pw.EdgeInsets.only(left: 40, bottom: 50),
                            child: pw.Column(
                              // mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Padding(
                                  padding: pw.EdgeInsets.only(left: -30),
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
                                        text: 'Mr. Sorn Sovanndara ',
                                        style: header2(true),
                                      ),
                                      pw.TextSpan(
                                        text: ' are as follows:',
                                        style: body1(),
                                      ),
                                    ],
                                  ),
                                ),
                                pw.Expanded(
                                    child: pw.Container(
                                  margin: const pw.EdgeInsets.only(
                                      top: 5, right: 20, bottom: 25),
                                  decoration: pw.BoxDecoration(
                                    border: pw.Border.all(
                                      color: PdfColors.black,
                                      width: 2, // Adjust border width as needed
                                    ),
                                  ),
                                )),
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
                                      text: '\$1,199,234.00',
                                      style: header2(false), // Base style
                                    ),
                                  ),
                                ]),
                                pw.RichText(
                                  text: pw.TextSpan(
                                    text:
                                        '(One Million One Hundred Eighty-One Thousand and Two Hundred Forty-Five US Dollars Only).',
                                    style: header2(false), // Base style
                                  ),
                                ),
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
                                pw.Row(children: [
                                  pw.RichText(
                                    text: pw.TextSpan(
                                      text: 'Fire Insurance Value : ',
                                      style: header2(true), // Base style
                                    ),
                                  ),
                                  pw.RichText(
                                    text: pw.TextSpan(
                                      text: '\$1,199,234.00',
                                      style: header2(false), // Base style
                                    ),
                                  ),
                                ]),
                                pw.SizedBox(height: 60),
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
            ));
      }));

  //Page Eighteen
  doc.addPage(pw.Page(
      pageTheme: pageTheme,
      build: (final context) {
        return pw.FullPage(
            ignoreMargins: true,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Container(
                  margin: const pw.EdgeInsets.only(
                      top: 30, right: 25), // Add margin here
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
                            padding: pw.EdgeInsets.only(left: 20, bottom: 50),
                            child: pw.Column(
                              // mainAxisAlignment: pw.MainAxisAlignment.start,
                              // crossAxisAlignment: pw.CrossAxisAlignment.start,
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
                                      pw.TextSpan(
                                        text: 'Property [Land and Building]',
                                        style: b_body(),
                                      ),
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
                                      pw.TextSpan(
                                          text: 'Property [Land and Building] ',
                                          style: b_body()),
                                      pw.TextSpan(
                                        text: 'owned by  ',
                                        style: body(),
                                      ),
                                      pw.TextSpan(
                                        text:
                                            'Mr. Hong Piset & Mrs. Nhiep Moylis ',
                                        style: b_body(),
                                      ),
                                      pw.TextSpan(
                                        text: 'with Title Deed No: ',
                                        style: body(),
                                      ),
                                      pw.TextSpan(
                                        text:
                                            '12041003-0528, 12041003-0529 & 12041003-0533 ',
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
                                pw.Expanded(
                                    child: pw.Container(
                                  margin: const pw.EdgeInsets.only(
                                      top: 5, right: 15, bottom: 25),
                                  decoration: pw.BoxDecoration(
                                    border: pw.Border.all(
                                      color: PdfColors.black,
                                      width: 2, // Adjust border width as needed
                                    ),
                                  ),
                                )),
                                pw.Expanded(
                                    child: pw.Container(
                                        margin: const pw.EdgeInsets.only(
                                            top: 5, right: 15, bottom: 25),
                                        decoration: pw.BoxDecoration(
                                          border: pw.Border.all(
                                            color: PdfColors.black,
                                            width:
                                                2, // Adjust border width as needed
                                          ),
                                        ),
                                        child: pw.Row(children: [
                                          pw.Expanded(
                                              child: pw.Container(
                                                  child: pw.Column(
                                            children: [
                                              pw.Expanded(
                                                flex: 2,
                                                child: pw.Container(
                                                  width:
                                                      255, // Set a fixed width
                                                  height:
                                                      255, // Set a fixed height
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                      color: PdfColors.black,
                                                      width:
                                                          2, // Adjust border width as needed
                                                    ),
                                                  ),
                                                  child: pw.Center(
                                                    child: pw.Text(
                                                        "Controlled by:",
                                                        style: header2(false)),
                                                  ),
                                                ),
                                              ),
                                              pw.Expanded(
                                                  flex: 4,
                                                  child: pw.Container()),
                                              pw.Expanded(
                                                  flex: 5,
                                                  child: pw.Container(
                                                    decoration:
                                                        pw.BoxDecoration(
                                                      border: pw.Border.all(
                                                        color: PdfColors.black,
                                                        width:
                                                            2, // Adjust border width as needed
                                                      ),
                                                    ),
                                                  )),
                                            ],
                                          ))),
                                          pw.Expanded(
                                              child: pw.Container(
                                                  child: pw.Column(
                                            children: [
                                              pw.Expanded(
                                                  flex: 2,
                                                  child: pw.Container(
                                                    child: pw.Center(
                                                      child: pw.Text(
                                                          "Verified By:",
                                                          style:
                                                              header2(false)),
                                                    ),
                                                  )),
                                              pw.Expanded(
                                                  flex: 4,
                                                  child: pw.Container(
                                                    decoration:
                                                        pw.BoxDecoration(
                                                      border: pw.Border.all(
                                                        color: PdfColors.black,
                                                        width:
                                                            2, // Adjust border width as needed
                                                      ),
                                                    ),
                                                  )),
                                              pw.Expanded(
                                                  flex: 5,
                                                  child: pw.Container(
                                                    width:
                                                        225, // Set a fixed width
                                                    height: 255, // Set a
                                                  )),
                                            ],
                                          ))),
                                        ]))),
                                pw.Expanded(
                                    child: pw.Container(
                                        margin: const pw.EdgeInsets.only(
                                            right: 15, bottom: 10),
                                        decoration: pw.BoxDecoration(
                                          border: pw.Border.all(
                                            color: PdfColors.black,
                                            width:
                                                2, // Adjust border width as needed
                                          ),
                                        ),
                                        child: pw.Column(
                                          children: [
                                            pw.Expanded(
                                                flex: 1,
                                                child: pw.Container(
                                                    child: pw.Text(
                                                        "Company Seal of Cambodia Angkor Real Estate Co., Ltd.",
                                                        style: header3(),
                                                        textAlign: pw.TextAlign
                                                            .center))),
                                            pw.Expanded(
                                                flex: 1,
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
                                                    child: pw.Text(
                                                        "Chief Executive Officer License No. V-07-013-04",
                                                        style: header3(),
                                                        textAlign: pw.TextAlign
                                                            .center))),
                                            pw.Expanded(
                                                flex: 4,
                                                child: pw.Container(
                                                  child: pw.Stack(
                                                    children: [
                                                      pw.Positioned(
                                                        bottom: 10,
                                                        right: 10,
                                                        child: pw.Text(
                                                            "THY DEN",
                                                            style:
                                                                header2(true)),
                                                      )
                                                    ],
                                                  ),
                                                ))
                                          ],
                                        ))),
                                pw.Padding(
                                    padding: pw.EdgeInsets.only(right: 15),
                                    child: pw.Row(
                                        mainAxisAlignment:
                                            pw.MainAxisAlignment.spaceBetween,
                                        children: [
                                          pw.Row(children: [
                                            pw.Text('Issue Date: ',
                                                style: header2(true)),
                                            pw.Text('27th May 2024',
                                                style: header2(false))
                                          ]),
                                          pw.Row(children: [
                                            pw.Text('Expiry Date: ',
                                                style: header2(true)),
                                            pw.Text('27th May 2025',
                                                style: header2(false))
                                          ])
                                        ]))
                              ],
                            ) // Add margin here
                            )),
                  ),
                )),
              ],
            ));
      }));

  //Page Nineteen
  doc.addPage(
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
                    top: 30, right: 25), // Add margin here
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
                          pw.Text("Documentation", style: header3()),
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
                                    'Cambodia Angkor Real Estate Co., Ltd. has taken all reasonable measures to ensure the accuracy of this Valuation.  However, all documentation and ancillary information included in this Valuation is intended for reference only.  Some information has been gathered from government departments, outside agencies or private individuals. Therefore, ',
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
  doc.addPage(
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
                    top: 30, right: 25), // Add margin here
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
  doc.addPage(pw.Page(
    pageTheme: pageTheme,
    build: (final context) {
      return pw.FullPage(
        ignoreMargins: true,
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            pw.Container(
              margin: const pw.EdgeInsets.only(
                  top: 30, right: 25), // Add margin here
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
                                      top: 3, bottom: 30),
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

  doc.addPage(pw.Page(
    pageTheme: pageTheme,
    build: (final context) {
      return pw.FullPage(
        ignoreMargins: true,
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            pw.Container(
              margin: const pw.EdgeInsets.only(
                  top: 30, right: 25), // Add margin here
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
                                      top: 3, bottom: 30),
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
  // //Page Tweenty Two

  return doc.save();
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

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PDF Generation Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              final pdf = await generatePdf(PdfPageFormat.a4);
              // You can save or share the PDF here
              await saveAsFile(
                  context, (format) async => pdf, PdfPageFormat.a4);
            },
            child: const Text('Generate PDF'),
          ),
        ),
      ),
    );
  }
}
