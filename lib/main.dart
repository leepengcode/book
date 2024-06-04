import 'package:book/Form/form.dart';
import 'package:book/pdf/pdfPage.dart';
import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/pdf': (context) => const PdfPage(),
        '/form': (context) => FormScreen(),
      },
      home: FormScreen(),
    );
  }
}
