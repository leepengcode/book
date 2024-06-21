import 'package:book/Componnents/Sidebar.dart';
import 'package:book/util/util.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class MyleftSideBar extends StatefulWidget {
  const MyleftSideBar({super.key});

  @override
  State<MyleftSideBar> createState() => _MyleftSideBarState();
}

class _MyleftSideBarState extends State<MyleftSideBar> {
  PageController pageController = PageController();

  SideMenuController sideMenu = SideMenuController();

  @override
  void initState() {
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pw.RichText.debug = true;
    final actions = <PdfPreviewAction>[
      if (!kIsWeb)
        const PdfPreviewAction(icon: Icon(Icons.save), onPressed: saveAsFile)
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("FILL THE FORM"),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        centerTitle: true,
        elevation: 10,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () async {
                await Printing.layoutPdf(
                    onLayout: (format) => generatePdf(format, 'ko'));
                //             Navigator.pushNamed(context, '/pdf',arguments: <String, String>{
                //   'name': 'Berlin'
                // },);
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
      body: SideBar(sideMenu: sideMenu, pageController: pageController),
    );
  }
}
