import 'package:book/Componnents/style.dart';
import 'package:book/Form/Widget/ComparePropery.dart';
import 'package:book/Model/OfficerReportModel.dart';
import 'package:flutter/material.dart';

import '../../Model/ComparisonModel.dart';

class NearbyPropertyWidget extends StatefulWidget {
  final ValueChanged<OfficerReport>? getForm;
  const NearbyPropertyWidget({
    super.key,
    this.getForm,
  });

  @override
  State<NearbyPropertyWidget> createState() => _NearbyPropertyWidgetState();
}

class _NearbyPropertyWidgetState extends State<NearbyPropertyWidget> {
  final _conditionController = TextEditingController();
  final _immediateController = TextEditingController();
  final _strengthController = TextEditingController();
  final _weaknessController = TextEditingController();
  final _opportunityController = TextEditingController();
  final _threatController = TextEditingController();
  final _markrtpriceController = TextEditingController();

  List<Comparison> objComparison = [];
  OfficerReport? objOfficer;

  int parcelCounter = 1;
  List<ComparePropertyWidget> comparePropertyWidgets = [];

  void addNewComparePropertyWidget() {
    setState(() {
      comparePropertyWidgets.add(ComparePropertyWidget(
        parcelNumber: parcelCounter,
        getvalue: (value) {
          if (objComparison.length == 0) {
            objComparison.add(value);
            print(
                "location ${objComparison[objComparison.length - 1].totalprice}\n");
          } else if (objComparison.length > 0 &&
              objComparison[objComparison.length - 1].totalprice !=
                  value.totalprice) {
            objComparison.add(value);
            print(
                "location2 ${objComparison[objComparison.length - 1].totalprice}\n");
          }
        },
      ));
      parcelCounter++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    addNewComparePropertyWidget();
    objOfficer = OfficerReport(
        conditions: 'we',
        immediate: 'we',
        strength: 'we',
        weakness: 'we',
        opportunity: 'we',
        threat: 'we',
        markrtprice: 'we',
        comparison: objComparison);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onFocusChange: (value) {
        if (value == false) {
          setState(() {
            objComparison;
            print("objComparison.length : ${objComparison.length}\n");
            widget.getForm!(objOfficer!);
          });
        }
      },
      child: Container(
          decoration: BoxDecoration(
              color: Colors.blueGrey.shade100,
              borderRadius: BorderRadius.circular(10)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Inspection Officer’s Report",
              style: THeader(),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  "Condition of property",
                  style: THeader(),
                ),
                Text(
                  " *",
                  style: TextStyle(color: Colors.red, fontSize: 15),
                )
              ],
            ),
            Container(
              width: double.infinity,
              child: TextField(
                controller: _conditionController,
                onChanged: (value) {
                  setState(() {
                    objOfficer!.conditions = value.toString();
                  });
                },
                maxLines: null,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: "Enter Condition",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  "Immediate Environment",
                  style: THeader(),
                ),
                Text(
                  " *",
                  style: TextStyle(color: Colors.red, fontSize: 15),
                )
              ],
            ),
            Container(
              width: double.infinity,
              child: TextField(
                controller: _immediateController,
                onChanged: (value) {
                  setState(() {
                    objOfficer!.immediate = value.toString();
                  });
                },
                maxLines: null,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: "Enter Immediate Environment",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "SWOT",
              style: THeader(),
            ),
            SizedBox(
              height: 15,
            ),
            Wrap(
              spacing: 10.0,
              // spacing: 10,
              // direction: Axis.horizontal,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      overflow: TextOverflow.ellipsis,
                      TextSpan(children: [
                        TextSpan(
                          text: "Strengths",
                          style: THeader(),
                        ),
                        TextSpan(
                          text: " *",
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        )
                      ]),
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: _strengthController,
                        onChanged: (value) {
                          setState(() {
                            objOfficer!.strength = value.toString();
                          });
                        },
                        maxLines: null,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: "Enter Strengths",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16)),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      overflow: TextOverflow.ellipsis,
                      TextSpan(children: [
                        TextSpan(
                          text: "Weakness",
                          style: THeader(),
                        ),
                        TextSpan(
                          text: " *",
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        )
                      ]),
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: _weaknessController,
                        onChanged: (value) {
                          setState(() {
                            objOfficer!.weakness = value.toString();
                          });
                        },
                        maxLines: null,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: "Enter Weakness",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16)),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      overflow: TextOverflow.ellipsis,
                      TextSpan(children: [
                        TextSpan(
                          text: "Opportunities",
                          style: THeader(),
                        ),
                        TextSpan(
                          text: " *",
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        )
                      ]),
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: _opportunityController,
                        onChanged: (value) {
                          setState(() {
                            objOfficer!.opportunity = value.toString();
                          });
                        },
                        maxLines: null,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: "Enter Opportunities",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16)),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      overflow: TextOverflow.ellipsis,
                      TextSpan(children: [
                        TextSpan(
                          text: "Threats",
                          style: THeader(),
                        ),
                        TextSpan(
                          text: " *",
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        )
                      ]),
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: _threatController,
                        onChanged: (value) {
                          setState(() {
                            objOfficer!.threat = value.toString();
                          });
                        },
                        maxLines: null,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: "Enter Threats",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16)),
                        ),
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
                  Row(
                    children: [
                      Text(
                        "Market Prices ",
                        style: THeader(),
                      ),
                      Text(
                        " *",
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      )
                    ],
                  ),
                  Container(
                    width: 250,
                    child: TextField(
                      controller: _markrtpriceController,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          objOfficer!.markrtprice = value.toString();
                        });
                      },
                      maxLines: null,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: "Enter Market Prices",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16)),
                      ),
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
          ])),
    );
  }
}
