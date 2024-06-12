import 'dart:io' as io;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class IdcardPicker extends StatefulWidget {
  const IdcardPicker({Key? key}) : super(key: key);

  @override
  State<IdcardPicker> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<IdcardPicker> {
  io.File? image;
  String? imageUrl;

  Future pickImage() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;

      if (kIsWeb) {
        setState(() => this.imageUrl = pickedImage.path);
      } else {
        final imageTemp = io.File(pickedImage.path);
        setState(() => this.image = imageTemp);
      }
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
              Image.file(
                image!,
                width: 500,
                height: 300,
                fit: BoxFit.cover,
              )
            else if (imageUrl != null)
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
