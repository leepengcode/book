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
    return InkWell(
      onFocusChange: (value) {
        if (value == false) {
          setState(() {
            if (io.length == 2 && ck == false) {
              objIDCard.frontidcard1 = io[0];
              objIDCard.backidcard1 = io[1];
              // objIDCard.frontidcard2 = io[2];
              // objIDCard.backidcard2 = io[3];
              print("kkokokoko ${io.length}\n\n\n");
              widget.getForm!(objIDCard);
              ck = true;
            }
          });
        }
      },
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 22, horizontal: 22),
          width: 1500,
          decoration: BoxDecoration(
              color: Colors.blueGrey.shade100,
              borderRadius: BorderRadius.circular(10)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                        if (io.length == 0) {
                          setState(() {
                            if (value != null) {
                              print("upload card1 ${value.toString()}\n");

                              io.add(value);
                            }
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
                        if (io.length == 1) {
                          setState(() {
                            if (value != null) {
                              print("upload card2 ${value.toString()}\n");
                              io.add(value);
                            }
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
          ])),
    );
  }
}
