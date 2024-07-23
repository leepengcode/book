import 'dart:io';

import 'package:book/Componnents/IdCard.dart';
import 'package:book/Componnents/style.dart';
import 'package:book/Model/IDCardModel.dart';
import 'package:flutter/material.dart';

class uploadIDCard extends StatefulWidget {
  final ValueChanged<IDCard?>? getForm;
  uploadIDCard({
    super.key,
    this.getForm,
  });

  @override
  State<uploadIDCard> createState() => _uploadIDCardState();
}

class _uploadIDCardState extends State<uploadIDCard> {
  List<File> io = [];
  IDCard objIDCard = IDCard();
  bool ck = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 22, horizontal: 22),
        width: 1500,
        decoration: BoxDecoration(
            color: Colors.blueGrey.shade100,
            borderRadius: BorderRadius.circular(10)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        "Front Of ID Card",
                        style: THeader(),
                      ),
                      Text(
                        " *",
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      )
                    ],
                  ),
                  IdcardPicker(
                    getFile: (value) {
                      if (value != null) {
                        print("upload card1 ${value.toString()}\n");
                        setState(() {
                          io.add(value);
                          objIDCard.frontidcard1 = value;
                        });
                      }
                    },
                  ),
                ],
              ),
              SizedBox(
                width: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        "Back Of ID Card",
                        style: THeader(),
                      ),
                      Text(
                        " *",
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      )
                    ],
                  ),
                  IdcardPicker(
                    getFile: (value) {
                      if (value != null) {
                        print("upload card2 ${value.toString()}\n");
                        setState(() {
                          io.add(value);
                          objIDCard.backidcard1 = value;
                          widget.getForm!(objIDCard);
                        });
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
          // SizedBox(
          //   height: 30,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         Row(
          //           children: [
          //             Text(
          //               "Front Of ID Card",
          //               style: THeader(),
          //             ),
          //             Text(
          //               " *",
          //               style: TextStyle(color: Colors.red, fontSize: 15),
          //             )
          //           ],
          //         ),
          //         IdcardPicker(
          //           getFile: (value) {
          //             if (io.length == 2) {
          //               setState(() {
          //                 if (value != null) {
          //                   print("upload card3 ${value.toString()}\n");
          //                   io.add(value);
          //                 }
          //               });
          //             }
          //           },
          //         ),
          //       ],
          //     ),
          //     SizedBox(
          //       width: 100,
          //     ),
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         Row(
          //           children: [
          //             Text(
          //               "Back Of ID Card",
          //               style: THeader(),
          //             ),
          //             Text(
          //               " *",
          //               style: TextStyle(color: Colors.red, fontSize: 15),
          //             )
          //           ],
          //         ),
          //         IdcardPicker(
          //           getFile: (value) {
          //             if (io.length == 3) {
          //               setState(() {
          //                 if (value != null) {
          //                   print("upload card4 ${value.toString()}\n");
          //                   io.add(value);
          //                 }
          //               });
          //             }
          //           },
          //         ),
          //       ],
          //     ),
          //   ],
          // )
        ]));
  }
}
