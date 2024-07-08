import 'dart:io' as io;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:universal_io/io.dart';

// typedef OnChangeCallback = void Function(File value);

// class FrontImgPicker extends StatefulWidget {
//   final OnChangeCallback getFile;
//   FrontImgPicker({Key? key, required this.getFile}) : super(key: key);

//   @override
//   State<FrontImgPicker> createState() => _ButtonWidgetState();
// }

// class _ButtonWidgetState extends State<FrontImgPicker> {
//   File? image;
//   String? imageUrl;

//   Future pickImage() async {
//     try {
//       XFile? pickedImage =
//           await ImagePicker().pickImage(source: ImageSource.gallery);
//       if (pickedImage == null) return;
//       setState(() {
//         imageUrl = pickedImage.path;
//         image = File(pickedImage.path);
//         widget.getFile(image!);
//       });
//     } on PlatformException catch (e) {
//       print('Failed to pick image: $e');
//     }
//   }

//   int i = 0;
//   @override
//   Widget build(BuildContext context) {
//     Future.delayed(Duration(seconds: 1), () {
//       setState(() {
//         if (imageUrl != null && i == 0) {
//           widget.getFile(image!);
//           i++;
//           print("done upload\n\n");
//         }
//       });
//     });

//     return Stack(
//       children: [
//         Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (imageUrl != null) ...[
//               Image.network(
//                 imageUrl!,
//                 width: 500,
//                 height: 300,
//                 fit: BoxFit.cover,
//               )
//             ]
//           ],
//         ),
//         Positioned(
//             child: GestureDetector(
//           onTap: () {
//             pickImage();
//           },
//           child: Container(
//               width: 500,
//               height: 300,
//               decoration: BoxDecoration(border: Border.all()),
//               child: image == null && imageUrl == null
//                   ? Icon(
//                       Icons.image,
//                       size: 50,
//                     )
//                   : SizedBox()),
//         ))
//       ],
//     );
//   }
// }

typedef OnChangeCallback = void Function(dynamic value);

class FrontImgPicker extends StatefulWidget {
  final OnChangeCallback getFile;

  FrontImgPicker({Key? key, required this.getFile}) : super(key: key);

  @override
  State<FrontImgPicker> createState() => _FrontImgPickerState();
}

class _FrontImgPickerState extends State<FrontImgPicker> {
  File? image;
  String? imageUrl;

  Future pickImage() async {
    try {
      XFile? pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;
      setState(() {
        imageUrl = pickedImage.path;
        print("object $imageUrl\n");
        image = File(pickedImage.path);
        widget.getFile(imageUrl); // Call getFile callback immediately
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
            if (imageUrl != null) ...[
              Image.network(
                imageUrl!,
                width: 500,
                height: 300,
                fit: BoxFit.cover,
              )
            ]
          ],
        ),
        Positioned(
          child: GestureDetector(
            onTap: pickImage,
            child: Container(
              width: 500,
              height: 300,
              decoration: BoxDecoration(border: Border.all()),
              child: image == null && imageUrl == null
                  ? Icon(
                      Icons.image,
                      size: 50,
                    )
                  : SizedBox(),
            ),
          ),
        )
      ],
    );
  }
}
