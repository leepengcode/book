import 'package:book/Componnents/style.dart';
import 'package:book/Model/FinalIndicationBuildingMdel.dart';
import 'package:book/Model/FinalIndicationLandMdel.dart';
import 'package:book/Model/FinalIndicationModel.dart';
import 'package:book/Model/ProvisionalLandMdel.dart';
import 'package:flutter/material.dart';

typedef OnChangeCallback = void Function(dynamic value);

class FinalIndicationWidget extends StatefulWidget {
  final String? ck1;
  final int NoLandCount;
  final ValueChanged<FinalIndication> getForm;
  const FinalIndicationWidget({
    super.key,
    required this.NoLandCount,
    this.ck1,
    required this.getForm,
  });

  @override
  State<FinalIndicationWidget> createState() => _FinalIndicationWidgetState();
}

class _FinalIndicationWidgetState extends State<FinalIndicationWidget> {
  List<PropertyInfo> landInfoList = [];
  List<PropertyInfo> buildingInfoList = [];

  List<Land> objland = [];
  List<Building> objbuilding = [];

  TextEditingController _totalLandSizeSqm = TextEditingController();
  TextEditingController _totalLandPValue = TextEditingController();
  TextEditingController _totalBuildingSizeSqm = TextEditingController();
  TextEditingController _totalBuildingPValue = TextEditingController();

  @override
  void initState() {
    super.initState();
    _addNewLandInfo(); // Initialize with the first row
    _addNewBuildingInfo(); // Initialize with the first row
  }

  void _addNewLandInfo() {
    setState(() {
      landInfoList.add(PropertyInfo(
          noCount: widget.NoLandCount + landInfoList.length,
          sizeSqm: TextEditingController(),
          sizeSqft: TextEditingController(),
          valueUsd: TextEditingController(),
          pValue: TextEditingController(),
          bedroomno: TextEditingController(),
          floorno: TextEditingController()));

      // Add listeners to the newly added controllers
      final newLandInfo = landInfoList.last;
      newLandInfo.sizeSqm
          .addListener(() => _calculateTotal(newLandInfo, isLand: true));
      newLandInfo.valueUsd
          .addListener(() => _calculateTotal(newLandInfo, isLand: true));
    });
  }

  void _addNewBuildingInfo() {
    setState(() {
      buildingInfoList.add(PropertyInfo(
          noCount: widget.NoLandCount + buildingInfoList.length,
          sizeSqm: TextEditingController(),
          sizeSqft: TextEditingController(),
          valueUsd: TextEditingController(),
          pValue: TextEditingController(),
          bedroomno: TextEditingController(),
          floorno: TextEditingController()));

      // Add listeners to the newly added controllers
      final newBuildingInfo = buildingInfoList.last;
      newBuildingInfo.sizeSqm
          .addListener(() => _calculateTotal(newBuildingInfo, isLand: false));
      newBuildingInfo.valueUsd
          .addListener(() => _calculateTotal(newBuildingInfo, isLand: false));
    });
  }

  void _calculateTotal(PropertyInfo propertyInfo, {required bool isLand}) {
    double sizeSqm = double.tryParse(propertyInfo.sizeSqm.text) ?? 0.0;
    double valueUsd = double.tryParse(propertyInfo.valueUsd.text) ?? 0.0;

    double sizeSqft = sizeSqm * 10.7639;
    double pValue = sizeSqm * valueUsd;

    propertyInfo.sizeSqft.text = sizeSqft.toStringAsFixed(2);
    propertyInfo.pValue.text = pValue.toStringAsFixed(2);

    _updateTotals(isLand: isLand);
  }

  void _updateTotals({required bool isLand}) {
    double totalSizeSqm = 0.0;
    double totalPValue = 0.0;

    List<PropertyInfo> infoList = isLand ? landInfoList : buildingInfoList;

    for (var info in infoList) {
      totalSizeSqm += double.tryParse(info.sizeSqm.text) ?? 0.0;
      totalPValue += double.tryParse(info.pValue.text) ?? 0.0;
    }

    if (isLand) {
      _totalLandSizeSqm.text = totalSizeSqm.toStringAsFixed(2);
      _totalLandPValue.text = totalPValue.toStringAsFixed(2);
    } else {
      _totalBuildingSizeSqm.text = totalSizeSqm.toStringAsFixed(2);
      _totalBuildingPValue.text = totalPValue.toStringAsFixed(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onFocusChange: (value) {
        setState(() {
          if (value == false && _totalBuildingSizeSqm.text != '') {
            FinalIndication obj = FinalIndication(
                totallandsizesqm: _totalLandSizeSqm.text,
                totallandvalue: _totalLandPValue.text,
                totalbuildingsizesqm: _totalBuildingSizeSqm.text,
                totalbuildingvalue: _totalBuildingPValue.text,
                land: objland,
                building: objbuilding);
            widget.getForm(obj);
          }
          if (value == false && _totalBuildingSizeSqm.text == '') {
            FinalIndication obj = FinalIndication(
                totallandsizesqm: _totalLandSizeSqm.text,
                totallandvalue: _totalLandPValue.text,
                totalbuildingsizesqm: _totalBuildingSizeSqm.text,
                totalbuildingvalue: _totalBuildingPValue.text,
                land: objland);
            widget.getForm(obj);
          }
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 22, horizontal: 22),
        width: 1500,
        decoration: BoxDecoration(
            color: Colors.blueGrey.shade100,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Final Indication",
              style: THeader(),
            ),
            SizedBox(
              height: 15,
            ),
            if (widget.ck1 ==
                "Property [LAND AND BUILDING] VALUATION REPORT") ...[
              Text(
                "A. Land",
                style: THeader(),
              ),
              SizedBox(
                height: 15,
              ),
              ...landInfoList.map((landInfo) => InkWell(
                    onFocusChange: (value) {
                      setState(() {
                        if (value == false) {
                          objland.add(Land(
                              no: landInfo.noCount.toString(),
                              sizesqm: landInfo.sizeSqm.text,
                              sizesqft: landInfo.sizeSqft.text,
                              valuesqm: landInfo.valueUsd.text,
                              propertyvalue: landInfo.pValue.text));
                        }
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 20),
                      child: Row(
                        children: [
                          _buildTextFieldColumn(
                              title: "No.",
                              label: "",
                              width: 50,
                              readOnly: true,
                              controller: TextEditingController(
                                  text: landInfo.noCount.toString())),
                          SizedBox(width: 25),
                          _buildTextFieldColumn(
                              title: "Size Sqm",
                              label: "Enter",
                              width: 220,
                              controller: landInfo.sizeSqm),
                          SizedBox(width: 25),
                          _buildTextFieldColumn(
                              title: "Size Sqft",
                              label: "",
                              readOnly: true,
                              width: 220,
                              controller: landInfo.sizeSqft),
                          SizedBox(width: 25),
                          _buildTextFieldColumn(
                              title: "Property Value USD/Sqm",
                              label: "Enter",
                              width: 220,
                              controller: landInfo.valueUsd),
                          SizedBox(width: 25),
                          _buildTextFieldColumn(
                              title: "Property Value",
                              label: "",
                              readOnly: true,
                              width: 220,
                              controller: landInfo.pValue),
                        ],
                      ),
                    ),
                  )),
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
                    onPressed: _addNewLandInfo,
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
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: Row(
                  children: [
                    _buildTextFieldColumn(
                        title: "Total Size Sqm",
                        label: "",
                        readOnly: true,
                        width: 220,
                        controller: _totalLandSizeSqm),
                    SizedBox(width: 25),
                    _buildTextFieldColumn(
                        title: "Total Property Value",
                        label: "",
                        readOnly: true,
                        width: 220,
                        controller: _totalLandPValue),
                  ],
                ),
              ),
            ],
            SizedBox(
              height: 15,
            ),
            if (widget.ck1 != "Property LAND VALUATION REPORT" &&
                widget.ck1 != "Property OFFICE SPACE VALUATION REPORT" &&
                widget.ck1 != "Property CONDO REPORT")
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "B. Building",
                    style: THeader(),
                  ),
                  SizedBox(height: 15),
                  ...buildingInfoList.map((buildingInfo) => InkWell(
                        onFocusChange: (value) {
                          setState(() {
                            if (value == false) {
                              objbuilding.add(Building(
                                  no: buildingInfo.noCount.toString(),
                                  sizesqm: buildingInfo.sizeSqm.text,
                                  sizesqft: buildingInfo.sizeSqft.text,
                                  valuesqm: buildingInfo.valueUsd.text,
                                  propertyvalue: buildingInfo.pValue.text));
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 20),
                          child: Row(
                            children: [
                              _buildTextFieldColumn(
                                  title: "No.",
                                  label: "",
                                  width: 50,
                                  readOnly: true,
                                  controller: TextEditingController(
                                      text: buildingInfo.noCount.toString())),
                              SizedBox(width: 25),
                              _buildTextFieldColumn(
                                  title: "Size Sqm",
                                  label: "Enter",
                                  width: 220,
                                  controller: buildingInfo.sizeSqm),
                              SizedBox(width: 25),
                              _buildTextFieldColumn(
                                  title: "Size Sqft",
                                  label: "",
                                  readOnly: true,
                                  width: 220,
                                  controller: buildingInfo.sizeSqft),
                              SizedBox(width: 25),
                              _buildTextFieldColumn(
                                  title: "Property Value USD/Sqm",
                                  label: "Enter",
                                  width: 220,
                                  controller: buildingInfo.valueUsd),
                              SizedBox(width: 25),
                              _buildTextFieldColumn(
                                  title: "Property Value",
                                  label: "",
                                  readOnly: true,
                                  width: 220,
                                  controller: buildingInfo.pValue),
                            ],
                          ),
                        ),
                      )),
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
                        onPressed: _addNewBuildingInfo,
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
                    padding: const EdgeInsets.only(left: 20, bottom: 20),
                    child: Row(
                      children: [
                        _buildTextFieldColumn(
                            title: "Total Size Sqm",
                            label: "",
                            readOnly: true,
                            width: 220,
                            controller: _totalBuildingSizeSqm),
                        SizedBox(width: 25),
                        _buildTextFieldColumn(
                            title: "Total Property Value",
                            label: "",
                            readOnly: true,
                            width: 220,
                            controller: _totalBuildingPValue),
                      ],
                    ),
                  ),
                ],
              ),
            if (widget.ck1 == "Property LAND VALUATION REPORT")
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "A. Land",
                    style: THeader(),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ...landInfoList.map((landInfo) => InkWell(
                        onFocusChange: (value) {
                          setState(() {
                            if (value == false) {
                              objland.add(Land(
                                  no: landInfo.noCount.toString(),
                                  sizesqm: landInfo.sizeSqm.text,
                                  sizesqft: landInfo.sizeSqft.text,
                                  valuesqm: landInfo.valueUsd.text,
                                  propertyvalue: landInfo.pValue.text));
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 20),
                          child: Row(
                            children: [
                              _buildTextFieldColumn(
                                  title: "No.",
                                  label: "",
                                  width: 50,
                                  readOnly: true,
                                  controller: TextEditingController(
                                      text: landInfo.noCount.toString())),
                              SizedBox(width: 25),
                              _buildTextFieldColumn(
                                  title: "Size Sqm",
                                  label: "Enter",
                                  width: 220,
                                  controller: landInfo.sizeSqm),
                              SizedBox(width: 25),
                              _buildTextFieldColumn(
                                  title: "Size Sqft",
                                  label: "",
                                  readOnly: true,
                                  width: 220,
                                  controller: landInfo.sizeSqft),
                              SizedBox(width: 25),
                              _buildTextFieldColumn(
                                  title: "Property Value USD/Sqm",
                                  label: "Enter",
                                  width: 220,
                                  controller: landInfo.valueUsd),
                              SizedBox(width: 25),
                              _buildTextFieldColumn(
                                  title: "Property Value",
                                  label: "",
                                  readOnly: true,
                                  width: 220,
                                  controller: landInfo.pValue),
                            ],
                          ),
                        ),
                      )),
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
                        onPressed: _addNewLandInfo,
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
                    padding: const EdgeInsets.only(left: 20, bottom: 20),
                    child: Row(
                      children: [
                        _buildTextFieldColumn(
                            title: "Total Size Sqm",
                            label: "",
                            readOnly: true,
                            width: 220,
                            controller: _totalLandSizeSqm),
                        SizedBox(width: 25),
                        _buildTextFieldColumn(
                            title: "Total Property Value",
                            label: "",
                            readOnly: true,
                            width: 220,
                            controller: _totalLandPValue),
                      ],
                    ),
                  ),
                ],
              ),
            if (widget.ck1 == "Property OFFICE SPACE VALUATION REPORT")
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "A. Office Space",
                    style: THeader(),
                  ),
                  SizedBox(height: 15),
                  ...buildingInfoList.map((buildingInfo) => InkWell(
                        onFocusChange: (value) {
                          setState(() {
                            if (value == false) {
                              objbuilding.add(Building(
                                  no: buildingInfo.noCount.toString(),
                                  sizesqm: buildingInfo.sizeSqm.text,
                                  sizesqft: buildingInfo.sizeSqft.text,
                                  valuesqm: buildingInfo.valueUsd.text,
                                  propertyvalue: buildingInfo.pValue.text,
                                  floorno: buildingInfo.floorno.text,
                                  bedroomno: buildingInfo.bedroomno.text));
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 20),
                          child: Row(
                            children: [
                              _buildTextFieldColumn(
                                title: "Floor No",
                                label: "",
                                width: 180,
                                controller: buildingInfo.floorno,
                              ),
                              SizedBox(width: 25),
                              _buildTextFieldColumn(
                                title: "Bedroom No",
                                label: "",
                                width: 180,
                                controller: buildingInfo.bedroomno,
                              ),
                              SizedBox(width: 25),
                              _buildTextFieldColumn(
                                  title: "Gross Area",
                                  label: "Enter",
                                  width: 180,
                                  controller: buildingInfo.sizeSqm),
                              SizedBox(width: 25),
                              _buildTextFieldColumn(
                                  title: "Size Sqft",
                                  label: "",
                                  readOnly: true,
                                  width: 180,
                                  controller: buildingInfo.sizeSqft),
                              SizedBox(width: 25),
                              _buildTextFieldColumn(
                                  title: "Property Value USD/Sqm",
                                  label: "Enter",
                                  width: 180,
                                  controller: buildingInfo.valueUsd),
                              SizedBox(width: 25),
                              _buildTextFieldColumn(
                                  title: "Property Value",
                                  label: "",
                                  readOnly: true,
                                  width: 180,
                                  controller: buildingInfo.pValue),
                            ],
                          ),
                        ),
                      )),
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
                        onPressed: _addNewBuildingInfo,
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
                    padding: const EdgeInsets.only(left: 20, bottom: 20),
                    child: Row(
                      children: [
                        _buildTextFieldColumn(
                            title: "Total Size Sqm",
                            label: "",
                            readOnly: true,
                            width: 220,
                            controller: _totalBuildingSizeSqm),
                        SizedBox(width: 25),
                        _buildTextFieldColumn(
                            title: "Total Property Value",
                            label: "",
                            readOnly: true,
                            width: 220,
                            controller: _totalBuildingPValue),
                      ],
                    ),
                  ),
                ],
              ),
            if (widget.ck1 == "Property CONDO REPORT")
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "A. Condo",
                    style: THeader(),
                  ),
                  SizedBox(height: 15),
                  ...buildingInfoList.map((buildingInfo) => InkWell(
                        onFocusChange: (value) {
                          setState(() {
                            if (value == false) {
                              objbuilding.add(Building(
                                  no: buildingInfo.noCount.toString(),
                                  sizesqm: buildingInfo.sizeSqm.text,
                                  sizesqft: buildingInfo.sizeSqft.text,
                                  valuesqm: buildingInfo.valueUsd.text,
                                  propertyvalue: buildingInfo.pValue.text,
                                  floorno: buildingInfo.floorno.text,
                                  bedroomno: buildingInfo.bedroomno.text));
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 20),
                          child: Row(
                            children: [
                              _buildTextFieldColumn(
                                title: "Floor No",
                                label: "",
                                width: 180,
                                controller: buildingInfo.floorno,
                              ),
                              SizedBox(width: 25),
                              _buildTextFieldColumn(
                                title: "Bedroom No",
                                label: "",
                                width: 180,
                                controller: buildingInfo.bedroomno,
                              ),
                              SizedBox(width: 25),
                              _buildTextFieldColumn(
                                  title: "Gross Area",
                                  label: "Enter",
                                  width: 180,
                                  controller: buildingInfo.sizeSqm),
                              SizedBox(width: 25),
                              _buildTextFieldColumn(
                                  title: "Size Sqft",
                                  label: "",
                                  readOnly: true,
                                  width: 180,
                                  controller: buildingInfo.sizeSqft),
                              SizedBox(width: 25),
                              _buildTextFieldColumn(
                                  title: "Property Value USD/Sqm",
                                  label: "Enter",
                                  width: 180,
                                  controller: buildingInfo.valueUsd),
                              SizedBox(width: 25),
                              _buildTextFieldColumn(
                                  title: "Property Value",
                                  label: "",
                                  readOnly: true,
                                  width: 180,
                                  controller: buildingInfo.pValue),
                            ],
                          ),
                        ),
                      )),
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
                        onPressed: _addNewBuildingInfo,
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
                    padding: const EdgeInsets.only(left: 20, bottom: 20),
                    child: Row(
                      children: [
                        _buildTextFieldColumn(
                            title: "Total Size Sqm",
                            label: "",
                            readOnly: true,
                            width: 220,
                            controller: _totalBuildingSizeSqm),
                        SizedBox(width: 25),
                        _buildTextFieldColumn(
                            title: "Total Property Value",
                            label: "",
                            readOnly: true,
                            width: 220,
                            controller: _totalBuildingPValue),
                      ],
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
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
        Row(
          children: [
            Text(
              title,
              style: THeader(),
            ),
            Text(
              " *",
              style: TextStyle(color: Colors.red, fontSize: 15),
            )
          ],
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
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            ),
          ),
        ),
      ],
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
