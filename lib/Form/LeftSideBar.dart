// import 'package:book/Componnents/Sidebar.dart';
// import 'package:easy_sidemenu/easy_sidemenu.dart';
// import 'package:flutter/material.dart';
// import 'package:pdf/widgets.dart' as pw;

// class MyleftSideBar extends StatefulWidget {
//   const MyleftSideBar({super.key});

//   @override
//   State<MyleftSideBar> createState() => _MyleftSideBarState();
// }

// class _MyleftSideBarState extends State<MyleftSideBar> {
//   PageController pageController = PageController();

//   SideMenuController sideMenu = SideMenuController();

//   @override
//   void initState() {
//     sideMenu.addListener((index) {
//       pageController.jumpToPage(index);
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     pw.RichText.debug = true;
//     // final actions = <PdfPreviewAction>[
//     //   if (!kIsWeb)
//     //     const PdfPreviewAction(icon: Icon(Icons.save), onPressed: saveAsFile)
//     // ];
//     return SideBar(sideMenu: sideMenu, pageController: pageController);
//   }
// }
