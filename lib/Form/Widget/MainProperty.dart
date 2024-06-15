import 'package:book/Componnents/style.dart';
import 'package:book/Form/Widget/PropertyLandPrice.dart';

import 'package:flutter/material.dart';

class MainProperty extends StatefulWidget {
  const MainProperty({super.key});

  @override
  State<MainProperty> createState() => _MianPropertyState();
}

class _MianPropertyState extends State<MainProperty> {
  int NoCount = 1;
  List<PropertyPrice> propertyPrice = [];
  double sum = 0.0;

  void addNeWPropertyPrice() {
    setState(() {
      propertyPrice.add(PropertyPrice(
        NoNumber: NoCount,
        onSizeChange: (double newSize) {
          updateTotalSize(newSize);
        },
      ));
      NoCount++;
    });
  }

  void updateTotalSize(double newSize) {
    setState(() {
      sum += newSize;
    });
  }

  @override
  void initState() {
    super.initState();
    addNeWPropertyPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 22, horizontal: 22),
        width: 1500,
        decoration: BoxDecoration(
            color: Colors.blueGrey.shade100,
            borderRadius: BorderRadius.circular(10)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Google Location of Comparable Property",
            style: THeader(),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Provisional Valuation Made by the Inspecting Officer(s)",
            style: THeader(),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: _buildTextFieldColumn(
                width: 300,
                controller: TextEditingController(),
                label: "Inspactor",
                title: "Inspactor Name",
                readOnly: false),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Property Price",
            style: THeader(),
          ),
          Text(
            "A. Land",
            style: THeader(),
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            children: propertyPrice,
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 50, // Adjust the width as needed
                height: 1,
                color: Colors.black,
              ),
              IconButton(
                onPressed: () {
                  addNeWPropertyPrice();
                },
                icon: Icon(Icons.add),
              ),
              Container(
                width: 50, // Adjust the width as needed
                height: 1,
                color: Colors.black,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildTextFieldColumn(
                    width: 230,
                    title: "Total Size sqm",
                    label: sum.toString(),
                    readOnly: true,
                    controller: TextEditingController()),
                SizedBox(
                  width: 30,
                ),
                _buildTextFieldColumn(
                    width: 230,
                    title: "Total Min (\$)",
                    label: "Enter",
                    readOnly: true,
                    controller: TextEditingController()),
                SizedBox(
                  width: 30,
                ),
                _buildTextFieldColumn(
                    width: 230,
                    title: "Total Max (\$)",
                    label: "Enter",
                    readOnly: true,
                    controller: TextEditingController())
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Divider(
            color: Colors.black ,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "B. Building",
            style: THeader(),
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            children: propertyPrice,
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 50, // Adjust the width as needed
                height: 1,
                color: Colors.black,
              ),
              IconButton(
                onPressed: () {
                  addNeWPropertyPrice();
                },
                icon: Icon(Icons.add),
              ),
              Container(
                width: 50, // Adjust the width as needed
                height: 1,
                color: Colors.black,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildTextFieldColumn(
                    width: 230,
                    title: "Total Size sqm",
                    label: sum.toString(),
                    readOnly: true,
                    controller: TextEditingController()),
                SizedBox(
                  width: 30,
                ),
                _buildTextFieldColumn(
                    width: 230,
                    title: "Total Min (\$)",
                    label: "Enter",
                    readOnly: true,
                    controller: TextEditingController()),
                SizedBox(
                  width: 30,
                ),
                _buildTextFieldColumn(
                    width: 230,
                    title: "Total Max (\$)",
                    label: "Enter",
                    readOnly: true,
                    controller: TextEditingController())
              ],
            ),
          )
        ]));
  }

  Column _buildTextFieldColumn({
    required String title,
    required String label,
    required double width,
    required TextEditingController controller,
    bool readOnly = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: THeader(),
        ),
        Container(
          width: width,
          child: TextField(
            readOnly: readOnly,
            controller: controller,
            maxLines: null,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              hintText: label,
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
