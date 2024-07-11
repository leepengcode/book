import 'dart:io' as io;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

typedef OnChangeCallback = void Function(dynamic value);

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({Key? key, this.getFile}) : super(key: key);
  final OnChangeCallback? getFile;
  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
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
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 1), () {
      setState(() {
        if (image != null) {
          widget.getFile!(image!);
        }
      });
    });
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
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Center(
                child: (image == null)
                    ? const Icon(
                        Icons.image,
                        size: 50,
                      )
                    : SizedBox(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
