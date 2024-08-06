import 'dart:convert';
import 'dart:io';

import 'package:book/Form/LeftSideBar.dart';
import 'package:book/pdf/pdfPage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/pdf': (context) => const PdfPage(),
        '/addnew': (context) => const MyleftSideBar()
      },
      home: MyleftSideBar(),
    );
  }
}
