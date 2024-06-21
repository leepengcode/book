import 'package:book/util/util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfPage extends StatefulWidget {
  const PdfPage({super.key});

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  final GlobalKey<State<StatefulWidget>> chartKey = GlobalKey();
  PrintingInfo? printingInfo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init;
  }

  Future<void> _init() async {
    final info = await Printing.info();
    setState(() {
      printingInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    pw.RichText.debug = true;
    final actions = <PdfPreviewAction>[
      if (!kIsWeb)
        const PdfPreviewAction(icon: Icon(Icons.save), onPressed: saveAsFile)
    ];
    // final name = ModalRoute.of(context)!.settings.arguments as Map;
    // print("object ${name['name']}");
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF"),
      ),
      // body:  PdfPreview(
      //     maxPageWidth: 700,
      //     onPrinted: showPrintedToast,
      //     onShared: showSharedToast,

      //     build: generatePdf),
    );
  }
}
