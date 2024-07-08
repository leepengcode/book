import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

typedef OnChangeCallback = void Function(dynamic value);

class MultiPropertyImgPicker extends StatefulWidget {
  final OnChangeCallback? getFile;
  const MultiPropertyImgPicker({super.key, this.getFile});

  @override
  State<MultiPropertyImgPicker> createState() => _MultiPropertyImgPickerState();
}

class _MultiPropertyImgPickerState extends State<MultiPropertyImgPicker> {
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  Future selectImages() async {
    try {
      final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
      if (selectedImages != null && selectedImages.isNotEmpty) {
        setState(() {
          imageFileList!.addAll(selectedImages);
        });
      }
      print("Image List Length: ${imageFileList!.length}");
    } catch (e) {
      print("Error picking images: $e");
    }
  }

  void removeImage(int index) {
    setState(() {
      imageFileList!.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 1), () {
      setState(() {
        if (imageFileList != null) {
          widget.getFile!(imageFileList!);
        }
      });
    });
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: selectImages,
            child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Icon(
                  Icons.image,
                  size: 50,
                )),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: imageFileList!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (BuildContext context, int index) {
                if (kIsWeb) {
                  return Stack(
                    children: [
                      Container(
                        height: 320,
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            border: Border.all(), color: Colors.grey),
                        child: Image.network(
                          imageFileList![index].path,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                          top: 10,
                          right: 10,
                          child: IconButton(
                              onPressed: () {
                                removeImage(index);
                              },
                              icon: Icon(
                                Icons.highlight_remove_rounded,
                                color: Colors.red,
                              )))
                    ],
                  );
                } else {
                  return Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(border: Border.all()),
                    child: Image.file(
                      File(imageFileList![index].path),
                      fit: BoxFit.cover,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
