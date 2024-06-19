import 'package:book/Componnents/style.dart';
import 'package:book/Form/Widget/ComparePropery.dart';
import 'package:flutter/material.dart';

class NearbyPropertyWidget extends StatefulWidget {
  const NearbyPropertyWidget({
    super.key,
  });

  @override
  State<NearbyPropertyWidget> createState() => _NearbyPropertyWidgetState();
}

class _NearbyPropertyWidgetState extends State<NearbyPropertyWidget> {
  int parcelCounter = 1;
  List<ComparePropertyWidget> comparePropertyWidgets = [];

  void addNewComparePropertyWidget() {
    setState(() {
      comparePropertyWidgets.add(ComparePropertyWidget(
        parcelNumber: parcelCounter,
      ));
      parcelCounter++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addNewComparePropertyWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 22),
        width: 1500,
        decoration: BoxDecoration(
            color: Colors.blueGrey.shade100,
            borderRadius: BorderRadius.circular(10)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "SWOT",
            style: THeader(),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Strengths",
                    style: THeader(),
                  ),
                  Container(
                    width: 250,
                    child: TextField(
                      maxLines: null,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: "Enter Strengths",
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Weakness",
                    style: THeader(),
                  ),
                  Container(
                    width: 250,
                    child: TextField(
                      maxLines: null,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: "Enter Strengths",
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Opportunities",
                    style: THeader(),
                  ),
                  Container(
                    width: 250,
                    child: TextField(
                      maxLines: null,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: "Enter Strengths",
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Threats",
                    style: THeader(),
                  ),
                  Container(
                    width: 250,
                    child: TextField(
                      maxLines: null,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: "Enter Strengths",
                          border: InputBorder.none),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Value of Comparable nearby Property",
            style: THeader(),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Market Prices ",
                  style: THeader(),
                ),
                Container(
                  width: 250,
                  child: TextField(
                    maxLines: null,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: "Enter",
                        border: InputBorder.none),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Comparisons with nearby Property",
            style: THeader(),
          ),
          SizedBox(
            height: 25,
          ),
          Column(
            children: comparePropertyWidgets,
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
                onPressed: addNewComparePropertyWidget,
                icon: Icon(Icons.add),
              ),
              Container(
                width: 50, // Adjust the width as needed
                height: 1,
                color: Colors.black,
              ),
            ],
          )
        ]));
  }
}
