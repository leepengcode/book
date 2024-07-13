import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter PDF Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final font = PdfGoogleFonts.notoSansAdlamRegular();
  final h_font = PdfGoogleFonts.notoSansAdlamBold();
  final b_font = PdfGoogleFonts.notoSansAdlamBold();
  pw.TextStyle header6() {
    return pw.TextStyle(
        fontSize: 8, color: PdfColors.blue900, fontWeight: pw.FontWeight.bold);
  }

  pw.TextStyle header1() {
    return pw.TextStyle(
      fontSize: 15,
      color: PdfColor.fromInt(0x2473b8),
    );
  }

  pw.TextStyle header4() {
    return pw.TextStyle(
        fontSize: 12, color: PdfColors.black, fontWeight: pw.FontWeight.bold);
  }

  pw.TextStyle body1() {
    return pw.TextStyle(
      fontSize: 12,
      color: PdfColors.black,
    );
  }

  pw.TextStyle header2(bool c) {
    return pw.TextStyle(
        fontSize: 13,
        color: (c) ? PdfColor.fromInt(0x2473b8) : PdfColor.fromInt(0xc4242c),
        fontWeight: pw.FontWeight.bold);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter PDF Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final pdf = pw.Document();

            pdf.addPage(
              pw.Page(
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
                            style: pw.TextStyle(fontSize: 9),
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
                                padding:
                                    pw.EdgeInsets.only(left: 10, right: 10),
                                child: pw.Column(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  // mainAxisAlignment: pw.MainAxisAlignment.start,
                                  children: [
                                    pw.SizedBox(
                                      height: 50,
                                    ),
                                    pw.Row(children: [
                                      pw.Expanded(
                                          flex: 2,
                                          child: pw.Container(
                                              height: 30,
                                              decoration: pw.BoxDecoration(
                                                  border: pw.Border.all()),
                                              child: pw.Center(
                                                  child: pw.Text("Parcel")))),
                                      pw.Expanded(
                                          flex: 4,
                                          child: pw.Container(
                                              height: 30,
                                              decoration: pw.BoxDecoration(
                                                  border: pw.Border.all()),
                                              child: pw.Center(
                                                  child: pw.Text(
                                                      "Type Of Propery")))),
                                      pw.Expanded(
                                          flex: 3,
                                          child: pw.Container(
                                              height: 30,
                                              decoration: pw.BoxDecoration(
                                                  border: pw.Border.all()),
                                              child: pw.Center(
                                                  child:
                                                      pw.Text("Sixe (sqm)")))),
                                      pw.Expanded(
                                          flex: 7,
                                          child: pw.Container(
                                              height: 30,
                                              decoration: pw.BoxDecoration(
                                                  border: pw.Border.all()),
                                              child: pw.Center(
                                                  child: pw.Text(
                                                      "Subject Value in USD / sqm")))),
                                      pw.Expanded(
                                          flex: 3,
                                          child: pw.Container(
                                              height: 30,
                                              decoration: pw.BoxDecoration(
                                                  border: pw.Border.all()),
                                              child: pw.Center(
                                                  child:
                                                      pw.Text("Price / USD")))),
                                      pw.Expanded(
                                          flex: 3,
                                          child: pw.Container(
                                              height: 30,
                                              decoration: pw.BoxDecoration(
                                                  border: pw.Border.all()),
                                              child: pw.Center(
                                                  child:
                                                      pw.Text("Total Price"))))
                                    ]),
                                    pw.Container(
                                      width: double.infinity,
                                      decoration: pw.BoxDecoration(
                                        border: pw.Border.all(),
                                      ),
                                      child: pw.Row(
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
                                                child: pw.Text("1"),
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
                                                        "Type Of Property"),
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
                                                                      "Type Of Propery")))),
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
                                                                      "Sixe (sqm)")))),
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
                                                                      "Subject Value in USD / sqm")))),
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
                                                                      "Price / USD")))),
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
                                                                      "Total Price"))))
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
                                                                      "Type Of Propery")))),
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
                                                                      "Sixe (sqm)")))),
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
                                                                      "Subject Value in USD / sqm")))),
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
                                                                      "Price / USD")))),
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
                                                                      "Total Price"))))
                                                    ]),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    pw.Container(
                                      width: double.infinity,
                                      decoration: pw.BoxDecoration(
                                        border: pw.Border.all(),
                                      ),
                                      child: pw.Row(
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
                                                child: pw.Text("1"),
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
                                                        "Type Of Property"),
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
                                                                      "Type Of Propery")))),
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
                                                                      "Sixe (sqm)")))),
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
                                                                      "Subject Value in USD / sqm")))),
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
                                                                      "Price / USD")))),
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
                                                                      "Total Price"))))
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
                                                                      "Type Of Propery")))),
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
                                                                      "Sixe (sqm)")))),
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
                                                                      "Subject Value in USD / sqm")))),
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
                                                                      "Price / USD")))),
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
                                                                      "Total Price"))))
                                                    ]),
                                              ],
                                            ),
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

            final bytes = await pdf.save();
            await Printing.layoutPdf(
                onLayout: (PdfPageFormat format) async => bytes);
          },
          child: Text('Generate PDF'),
        ),
      ),
    );
  }
}
