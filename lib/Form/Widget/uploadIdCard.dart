import 'package:book/Componnents/IdCard.dart';
import 'package:book/Componnents/style.dart';
import 'package:flutter/material.dart';

class uploadIDCard extends StatelessWidget {
  const uploadIDCard({
    super.key,
  });

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
                  Text(
                    "Front of ID Card",
                    style: THeader(),
                  ),
                  IdcardPicker(),
                ],
              ),
              SizedBox(
                width: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Back Of ID Card",
                    style: THeader(),
                  ),
                  IdcardPicker(),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Front Of ID Card",
                    style: THeader(),
                  ),
                  IdcardPicker(),
                ],
              ),
              SizedBox(
                width: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Back Of ID Card",
                    style: THeader(),
                  ),
                  IdcardPicker(),
                ],
              ),
            ],
          )
        ]));
  }
}
