import 'dart:io' as io;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

typedef OnChangeCallback = void Function(dynamic value);

class IdcardPicker extends StatefulWidget {
  final OnChangeCallback? getFile;
  const IdcardPicker({Key? key, this.getFile}) : super(key: key);

  @override
  State<IdcardPicker> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<IdcardPicker> {
  File? image;
  String? imageUrl;

  Future pickImage() async {
    try {
      XFile? pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;
      setState(() {
        imageUrl = pickedImage.path;
        image = File(pickedImage.path);
        widget.getFile!(image!);
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image != null)
              Image.network(
                imageUrl!,
                width: 500,
                height: 300,
                fit: BoxFit.cover,
              )
          ],
        ),
        Positioned(
            child: GestureDetector(
          onTap: () {
            pickImage();
          },
          child: Container(
              width: 500,
              height: 300,
              decoration: BoxDecoration(border: Border.all()),
              child: image == null && imageUrl == null
                  ? Icon(
                      Icons.image,
                      size: 50,
                    )
                  : SizedBox()),
        ))
      ],
    );
  }
}
