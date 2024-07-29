import 'dart:convert';

import 'package:book/Componnents/style.dart';
import 'package:book/Model/FinalIndicationBuildingMdel.dart';
import 'package:book/Model/FinalIndicationLandMdel.dart';
import 'package:book/Model/FinalIndicationModel.dart';
import 'package:book/Model/ProvisionalLandMdel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

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
  String _controllby = "";
  String _verifyby = "";
  String _issuedate = "";
  var _expiredate;
  DateTime date1 = DateTime.now();
  DateTime date2 = DateTime.now();
  @override
  void initState() {
    fetchDropDownItems();
    super.initState();
    date2;
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

  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  String? selectedValue1;
  String? selectedValue2;
  List? dropDownItems;
  bool isLoading = true;
  Future<void> fetchDropDownItems() async {
    const url =
        'https://www.angkorrealestate.com/book_report/bookReport/public/api/getallinspactor';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse['data'] != null) {
          setState(() {
            dropDownItems = jsonResponse['data'];
            isLoading = false;
          });
        } else {
          print('Error: Data is null');
        }
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  FinalIndication? obj;
  bool ckeck = false;
  @override
  Widget build(BuildContext context) {
    if (dropDownItems == null) {
      fetchDropDownItems();
    }
    if (!ckeck) {
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          if (_expiredate != null && _totalBuildingSizeSqm.text != '') {
            obj = new FinalIndication(
              totallandsizesqm: _totalLandSizeSqm.text,
              totallandvalue: _totalLandPValue.text,
              totalbuildingsizesqm: _totalBuildingSizeSqm.text,
              totalbuildingvalue: _totalBuildingPValue.text,
              controlled_by: _controllby,
              verified_by: _verifyby,
              issus_date: _issuedate,
              expiry_date: DateFormat("yyyy-MMM-dd").format(date2).toString(),
              land: objland,
              building: objbuilding,
            );
            widget.getForm(obj!);
            ckeck = true;
          }
          if (_expiredate != null && _totalBuildingSizeSqm.text == '') {
            obj = new FinalIndication(
                totallandsizesqm: _totalLandSizeSqm.text,
                totallandvalue: _totalLandPValue.text,
                totalbuildingsizesqm: _totalBuildingSizeSqm.text,
                totalbuildingvalue: _totalBuildingPValue.text,
                controlled_by: _controllby,
                verified_by: _verifyby,
                issus_date: _issuedate,
                expiry_date: DateFormat("yyyy-MMM-dd").format(date2).toString(),
                land: objland);
            widget.getForm(obj!);
            ckeck = true;
          }
        });
      });
    }

    return Container(
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
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            width: 220,
                            controller: landInfo.sizeSqm),
                        SizedBox(width: 25),
                        _buildTextFieldColumn(
                            title: "Size Sqft",
                            label: "",
                            readOnly: true,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            width: 220,
                            controller: landInfo.sizeSqft),
                        SizedBox(width: 25),
                        _buildTextFieldColumn(
                            title: "Property Value USD/Sqm",
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            label: "Enter",
                            width: 220,
                            controller: landInfo.valueUsd),
                        SizedBox(width: 25),
                        _buildTextFieldColumn(
                            title: "Property Value",
                            label: "",
                            readOnly: true,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
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
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                width: 220,
                                controller: buildingInfo.sizeSqm),
                            SizedBox(width: 25),
                            _buildTextFieldColumn(
                                title: "Size Sqft",
                                label: "",
                                readOnly: true,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                width: 220,
                                controller: buildingInfo.sizeSqft),
                            SizedBox(width: 25),
                            _buildTextFieldColumn(
                                title: "Property Value USD/Sqm",
                                label: "Enter",
                                width: 220,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                controller: buildingInfo.valueUsd),
                            SizedBox(width: 25),
                            _buildTextFieldColumn(
                                title: "Property Value",
                                label: "",
                                readOnly: true,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
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
          ],
          SizedBox(
            height: 15,
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
            ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 400,
                child: Form(
                  key: _formKey1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          "Controlled by",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        isLoading
                            ? const CircularProgressIndicator()
                            : DropdownButtonFormField<String>(
                                value: selectedValue1,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Select an option',
                                ),
                                items: dropDownItems!.map((value) {
                                  return DropdownMenuItem<String>(
                                    value: value['name'].toString(),
                                    child: Text('${value['name']}'),
                                    onTap: () {
                                      print("object \n");
                                      _controllby =
                                          "${value['name']} 24k ${value['position']} 24k ${value['license_no']}";
                                    },
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    // selectedValue1 = newValue;
                                    print("test get data ${newValue}\n");
                                  });
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return "Required field";
                                  }
                                  return null;
                                },
                              ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 400,
                child: Form(
                  key: _formKey2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          "Verifired by",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        isLoading
                            ? const CircularProgressIndicator()
                            : DropdownButtonFormField<String>(
                                value: selectedValue2,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Select an option',
                                ),
                                items: dropDownItems!.map((value) {
                                  return DropdownMenuItem<String>(
                                    value: value['name'].toString(),
                                    child: Text('${value['name']}'),
                                    onTap: () {
                                      print(
                                          "object2 ${value['name']} 24k ${value['position']} 24k ${value['license_no']}\n");
                                      _verifyby =
                                          "${value['name']} 24k ${value['position']} 24k ${value['license_no']}";
                                    },
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    // selectedValue2 = newValue;
                                    // _verifyby = newValue.toString();
                                  });
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return "Required field";
                                  }
                                  return null;
                                },
                              ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        '${date1.day}/${date1.month}/${date1.year}',
                        style: THeader(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: ElevatedButton(
                      child: const Text(
                        "Issus Date",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: date1,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );

                        if (newDate != null) {
                          setState(() {
                            date1 = newDate;
                            String formattedDate =
                                DateFormat("yyyy-MMM-dd").format(date1);
                            _issuedate = formattedDate;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Column(
                children: [
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        '${date2.day}/${date2.month}/${date2.year}',
                        style: THeader(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: ElevatedButton(
                        child: const Text(
                          "Expiry Date",
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: date2,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );

                          if (newDate != null) {
                            setState(() {
                              date2 = newDate;
                              String formattedDate =
                                  DateFormat("yyyy-MMM-dd").format(date2);
                              _expiredate = formattedDate;
                            });
                          }
                        }),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column _buildTextFieldColumn({
    required String title,
    required String label,
    required double width,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    bool readOnly = false,
    List<TextInputFormatter>? inputFormatters,
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
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
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
