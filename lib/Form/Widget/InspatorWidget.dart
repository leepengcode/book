import 'package:book/Componnents/style.dart';
import 'package:book/Model/FinalIndicationBuildingMdel.dart';
import 'package:book/Model/FinalIndicationLandMdel.dart';
import 'package:book/Model/FinalIndicationModel.dart';
import 'package:book/Model/ProvisionalLandMdel.dart';
import 'package:flutter/material.dart';

typedef OnChangeCallback = void Function(dynamic value);

class Inspatorwidget extends StatefulWidget {
  const Inspatorwidget({
    super.key,
  });

  @override
  State<Inspatorwidget> createState() => _InspatorwidgetState();
}

class _InspatorwidgetState extends State<Inspatorwidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 22, horizontal: 22),
      width: 1500,
      decoration: BoxDecoration(
          color: Colors.blueGrey.shade100,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [],
      ),
    );
  }
}

class PropertyInfo {
  final int noCount;
  final TextEditingController sizeSqm;
  final TextEditingController floorno;
  final TextEditingController bedroomno;
  final TextEditingController sizeSqft;
  final TextEditingController valueUsd;
  final TextEditingController pValue;

  PropertyInfo(
      {required this.noCount,
      required this.sizeSqm,
      required this.sizeSqft,
      required this.valueUsd,
      required this.pValue,
      required this.bedroomno,
      required this.floorno});
}
