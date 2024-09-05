import 'dart:io';

import 'package:book/Componnents/IdCard.dart';
import 'package:book/Model/IDCardModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
        decoration: BoxDecoration(
            color: Colors.blueGrey.shade100,
            borderRadius: BorderRadius.circular(10)),
        child: StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 9, //អ័ក្សX
            crossAxisSpacing: 9,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text.rich(
                    overflow: TextOverflow.ellipsis,
                    TextSpan(children: [
                      TextSpan(
                        text: "Front Of ID Card",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      TextSpan(
                        text: " *",
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      )
                    ]),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text.rich(
                    overflow: TextOverflow.ellipsis,
                    TextSpan(children: [
                      TextSpan(
                        text: "Back Of ID Card",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      TextSpan(
                        text: " *",
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      )
                    ]),
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
              SizedBox(
                height: 10,
              ),
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
