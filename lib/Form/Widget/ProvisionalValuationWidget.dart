import 'package:book/Componnents/style.dart';
import 'package:book/Model/ProvisionalBuildingMdel.dart';
import 'package:book/Model/ProvisionalLandMdel.dart';
import 'package:book/Model/ProvisionalModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef OnChangeCallback = void Function(dynamic value);

class ProvisionalValue extends StatefulWidget {
  final String? ck1;
  final int NoLandCount;
  final ValueChanged<Provisional> getForm;
  ProvisionalValue(
      {super.key, required this.NoLandCount, this.ck1, required this.getForm});

  @override
  State<ProvisionalValue> createState() => _FinalIndicationWidgetState();
}

class _FinalIndicationWidgetState extends State<ProvisionalValue> {
  List<PropertyInfo> landInfoList = [];
  List<PropertyInfo> buildingInfoList = [];

  List<PLand> objland = [];
  List<PBuilding> objbuilding = [];

  final _totalLandSizeSqm = TextEditingController();
  final _totalMinPrice = TextEditingController();
  final _totalMaxPrice = TextEditingController();

  final _totalBuildingSizeSqm = TextEditingController();
  final _totalBuildingMinPrice = TextEditingController();
  final _totalBuildingMaxPrice = TextEditingController();

  final _inspactor = TextEditingController();
  final _fairmarket = TextEditingController();
  final _fireinsurance = TextEditingController();
  final _forcesale = TextEditingController();

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
        minPrice: TextEditingController(),
        maxPrice: TextEditingController(),
        tminPrice: TextEditingController(),
        tmaxPrice: TextEditingController(),
        bedroomno: TextEditingController(),
        floorno: TextEditingController(),
      ));

      // Add listeners to the newly added controllers
      final newLandInfo = landInfoList.last;
      newLandInfo.sizeSqm
          .addListener(() => _calculateTotal(newLandInfo, isLand: true));
      newLandInfo.minPrice
          .addListener(() => _calculateTotal(newLandInfo, isLand: true));
      newLandInfo.maxPrice
          .addListener(() => _calculateTotal(newLandInfo, isLand: true));
    });
  }

  void _addNewBuildingInfo() {
    setState(() {
      buildingInfoList.add(PropertyInfo(
        noCount: widget.NoLandCount + buildingInfoList.length,
        sizeSqm: TextEditingController(),
        minPrice: TextEditingController(),
        maxPrice: TextEditingController(),
        tminPrice: TextEditingController(),
        tmaxPrice: TextEditingController(),
        bedroomno: TextEditingController(),
        floorno: TextEditingController(),
      ));

      // Add listeners to the newly added controllers
      final newBuildingInfo = buildingInfoList.last;
      newBuildingInfo.sizeSqm
          .addListener(() => _calculateTotal(newBuildingInfo, isLand: false));
      newBuildingInfo.minPrice
          .addListener(() => _calculateTotal(newBuildingInfo, isLand: false));
      newBuildingInfo.maxPrice
          .addListener(() => _calculateTotal(newBuildingInfo, isLand: false));
    });
  }

  void _calculateTotal(PropertyInfo propertyInfo, {required bool isLand}) {
    double sizeSqm = double.tryParse(propertyInfo.sizeSqm.text) ?? 0.0;
    double minPrice = double.tryParse(propertyInfo.minPrice.text) ?? 0.0;
    double maxPrice = double.tryParse(propertyInfo.maxPrice.text) ?? 0.0;

    double tminPrice = sizeSqm * minPrice;
    double tmaxPrice = sizeSqm * maxPrice;

    propertyInfo.tminPrice.text = tminPrice.toStringAsFixed(2);
    propertyInfo.tmaxPrice.text = tmaxPrice.toStringAsFixed(2);

    _updateTotals(isLand: isLand);
  }

  void _updateTotals({required bool isLand}) {
    double totalSizeSqm = 0.0;
    double totalMaxPrice = 0.0;
    double totalMinPrice = 0.0;
    double totalBuildingSizeSqm = 0.0;
    double totalBuildingMinPrice = 0.0;
    double totalBuildingMaxPrice = 0.0;

    List<PropertyInfo> infoList = isLand ? landInfoList : buildingInfoList;

    for (var info in infoList) {
      totalSizeSqm += double.tryParse(info.sizeSqm.text) ?? 0.0;
      totalMinPrice += double.tryParse(info.tminPrice.text) ?? 0.0;
      totalMaxPrice += double.tryParse(info.tmaxPrice.text) ?? 0.0;
      totalBuildingSizeSqm += double.tryParse(info.sizeSqm.text) ?? 0.0;
      totalBuildingMinPrice += double.tryParse(info.tminPrice.text) ?? 0.0;
      totalBuildingMaxPrice += double.tryParse(info.tmaxPrice.text) ?? 0.0;
    }

    if (isLand) {
      _totalLandSizeSqm.text = totalSizeSqm.toStringAsFixed(2);
      _totalMinPrice.text = totalMinPrice.toStringAsFixed(2);
      _totalMaxPrice.text = totalMaxPrice.toStringAsFixed(2);
    } else {
      _totalBuildingSizeSqm.text = totalBuildingSizeSqm.toStringAsFixed(2);
      _totalBuildingMinPrice.text = totalBuildingMinPrice.toStringAsFixed(2);
      _totalBuildingMaxPrice.text = totalBuildingMaxPrice.toStringAsFixed(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onFocusChange: (value) {
        if (value == false) {
          setState(() {
            if (_fairmarket.text == null) {
              Provisional obj = Provisional(
                  totallandsizesqm: _totalLandSizeSqm.text,
                  totallandvaluemin: _totalMinPrice.text,
                  totallandvaluemax: _totalMaxPrice.text,
                  totalbuildingsizesqm: _totalBuildingSizeSqm.text,
                  totalbuildingvaluemin: _totalBuildingMinPrice.text,
                  totalbuildingvaluemax: _totalBuildingMaxPrice.text,
                  force_sale: _forcesale.text,
                  name: _inspactor.text,
                  land: objland);
              widget.getForm(obj);
            } else {
              Provisional obj = Provisional(
                  totallandsizesqm: _totalLandSizeSqm.text,
                  totallandvaluemin: _totalMinPrice.text,
                  totallandvaluemax: _totalMaxPrice.text,
                  totalbuildingsizesqm: _totalBuildingSizeSqm.text,
                  totalbuildingvaluemin: _totalBuildingMinPrice.text,
                  totalbuildingvaluemax: _totalBuildingMaxPrice.text,
                  fair_market: _fairmarket.text,
                  fire_insurance: _fireinsurance.text,
                  force_sale: _forcesale.text,
                  name: _inspactor.text,
                  land: objland,
                  building: objbuilding);
              widget.getForm(obj);
            }
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blueGrey.shade100,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  controller: _inspactor,
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
            if (widget.ck1 == "Property LAND VALUATION REPORT" &&
                widget.ck1 != "Property OFFICE SPACE VALUATION REPORT") ...[
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
                          objland.add(PLand(
                              no: landInfo.noCount.toString(),
                              size_sqm: landInfo.sizeSqm.text,
                              minsqm: landInfo.minPrice.text,
                              maxsqm: landInfo.maxPrice.text,
                              totalmin: landInfo.tminPrice.text,
                              totalmax: landInfo.tmaxPrice.text));
                        }
                      });
                    },
                    child: Wrap(
                      spacing: 10.0,
                      children: [
                        _buildTextFieldColumn(
                            title: "No.",
                            label: "",
                            width: 50,
                            readOnly: true,
                            controller: TextEditingController(
                                text: landInfo.noCount.toString())),
                        _buildTextFieldColumn(
                            title: "Size Sqm",
                            label: "Enter",
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            width: 180,
                            controller: landInfo.sizeSqm),
                        _buildTextFieldColumn(
                            title: "\$/sqm(Min)",
                            label: "Enter",
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            width: 180,
                            controller: landInfo.minPrice),
                        _buildTextFieldColumn(
                            title: "Total (Min)",
                            label: "",
                            readOnly: true,
                            width: 180,
                            controller: landInfo.tminPrice),
                        _buildTextFieldColumn(
                            title: "\$/sqm(Max)",
                            label: "Enter",
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            width: 180,
                            controller: landInfo.maxPrice),
                        _buildTextFieldColumn(
                            title: "Total (Max)",
                            label: "",
                            readOnly: true,
                            width: 180,
                            controller: landInfo.tmaxPrice),
                        _buildTextFieldColumn(
                            title: "Total (Max)",
                            label: "",
                            readOnly: true,
                            width: 180,
                            controller: landInfo.tmaxPrice),
                      ],
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
                child: Wrap(
                  spacing: 10.0,
                  children: [
                    _buildTextFieldColumn(
                        title: "Total Size Sqm",
                        label: "",
                        readOnly: true,
                        width: 180,
                        controller: _totalLandSizeSqm),
                    _buildTextFieldColumn(
                        title: "Total Value(Min)",
                        label: "",
                        readOnly: true,
                        width: 180,
                        controller: _totalMinPrice),
                    _buildTextFieldColumn(
                        title: "Total Value(Max)",
                        label: "",
                        readOnly: true,
                        width: 180,
                        controller: _totalMaxPrice),
                  ],
                ),
              ),
            ],

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
                          objland.add(PLand(
                              no: landInfo.noCount.toString(),
                              size_sqm: landInfo.sizeSqm.text,
                              minsqm: landInfo.minPrice.text,
                              maxsqm: landInfo.maxPrice.text,
                              totalmin: landInfo.tminPrice.text,
                              totalmax: landInfo.tmaxPrice.text));
                        }
                      });
                    },
                    child: Wrap(
                      spacing: 10.0,
                      children: [
                        _buildTextFieldColumn(
                            title: "No.",
                            label: "",
                            width: 50,
                            readOnly: true,
                            controller: TextEditingController(
                                text: landInfo.noCount.toString())),
                        _buildTextFieldColumn(
                            title: "Size Sqm",
                            label: "Enter",
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            width: 180,
                            controller: landInfo.sizeSqm),
                        _buildTextFieldColumn(
                            title: "\$/sqm(Min)",
                            label: "Enter",
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            width: 180,
                            controller: landInfo.minPrice),
                        _buildTextFieldColumn(
                            title: "Total (Min)",
                            label: "",
                            readOnly: true,
                            width: 180,
                            controller: landInfo.tminPrice),
                        _buildTextFieldColumn(
                            title: "\$/sqm(Max)",
                            label: "Enter",
                            width: 180,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            controller: landInfo.maxPrice),
                        _buildTextFieldColumn(
                            title: "Total (Max)",
                            label: "",
                            readOnly: true,
                            width: 180,
                            controller: landInfo.tmaxPrice),
                      ],
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
                child: Wrap(
                  spacing: 10.0,
                  children: [
                    _buildTextFieldColumn(
                        title: "Total Size Sqm",
                        label: "",
                        readOnly: true,
                        width: 180,
                        controller: _totalLandSizeSqm),
                    _buildTextFieldColumn(
                        title: "Total Value(Min)",
                        label: "",
                        readOnly: true,
                        width: 180,
                        controller: _totalMinPrice),
                    _buildTextFieldColumn(
                        title: "Total Value(Max)",
                        label: "",
                        readOnly: true,
                        width: 180,
                        controller: _totalMaxPrice),
                  ],
                ),
              ),
            ],
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
                              objbuilding.add(PBuilding(
                                  no: buildingInfo.noCount.toString(),
                                  sizesqm: buildingInfo.sizeSqm.text,
                                  minsqm: buildingInfo.minPrice.text,
                                  maxsqm: buildingInfo.maxPrice.text,
                                  totalmin: buildingInfo.tminPrice.text,
                                  totalmax: buildingInfo.tmaxPrice.text));
                            }
                          });
                        },
                        child: Wrap(
                          spacing: 10.0,
                          children: [
                            _buildTextFieldColumn(
                                title: "No.",
                                label: "",
                                width: 50,
                                readOnly: true,
                                controller: TextEditingController(
                                    text: buildingInfo.noCount.toString())),
                            _buildTextFieldColumn(
                                title: "Size Sqm",
                                label: "Enter",
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                width: 180,
                                controller: buildingInfo.sizeSqm),
                            _buildTextFieldColumn(
                                title: "\$/sqm(Min)",
                                label: "Enter",
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                width: 180,
                                controller: buildingInfo.minPrice),
                            _buildTextFieldColumn(
                                title: "Total (Min)",
                                label: "",
                                readOnly: true,
                                width: 180,
                                controller: buildingInfo.tminPrice),
                            _buildTextFieldColumn(
                                title: "\$/sqm(Max)",
                                label: "Enter",
                                width: 180,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                controller: buildingInfo.maxPrice),
                            _buildTextFieldColumn(
                                title: "Total (Max)",
                                label: "",
                                readOnly: true,
                                width: 180,
                                controller: buildingInfo.tmaxPrice),
                          ],
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
                    child: Wrap(
                      spacing: 10.0,
                      children: [
                        _buildTextFieldColumn(
                            title: "Total Size Sqm",
                            label: "",
                            readOnly: true,
                            width: 180,
                            controller: _totalBuildingSizeSqm),
                        _buildTextFieldColumn(
                            title: "Total Value(Min)",
                            label: "",
                            readOnly: true,
                            width: 180,
                            controller: _totalBuildingMinPrice),
                        _buildTextFieldColumn(
                            title: "Total Value(Max)",
                            label: "",
                            readOnly: true,
                            width: 180,
                            controller: _totalBuildingMaxPrice),
                      ],
                    ),
                  ),
                ],
              ),

            //OFFICE SPACE
            if (widget.ck1 == "Property OFFICE SPACE VALUATION REPORT") ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "A. OFFICE SPACE",
                    style: THeader(),
                  ),
                  SizedBox(height: 15),
                  ...buildingInfoList.map((buildingInfo) => InkWell(
                        onFocusChange: (value) {
                          setState(() {
                            if (value == false) {
                              objbuilding.add(PBuilding(
                                  floorno: buildingInfo.floorno.text,
                                  bedroomno: buildingInfo.bedroomno.text,
                                  sizesqm: buildingInfo.sizeSqm.text,
                                  minsqm: buildingInfo.minPrice.text,
                                  maxsqm: buildingInfo.maxPrice.text,
                                  totalmin: buildingInfo.tminPrice.text,
                                  totalmax: buildingInfo.tmaxPrice.text));
                            }
                          });
                        },
                        child: Wrap(
                          spacing: 10.0,
                          children: [
                            _buildTextFieldColumn(
                                title: "Floor/Unit No.",
                                label: "",
                                width: 120,
                                controller: buildingInfo.floorno),
                            _buildTextFieldColumn(
                                title: "No. of Bedroom",
                                label: "",
                                width: 120,
                                controller: buildingInfo.bedroomno),
                            _buildTextFieldColumn(
                                title: "Gross Area Sqm",
                                label: "Enter",
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                width: 170,
                                controller: buildingInfo.sizeSqm),
                            _buildTextFieldColumn(
                                title: "\$/sqm(Min)",
                                label: "Enter",
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                width: 170,
                                controller: buildingInfo.minPrice),
                            _buildTextFieldColumn(
                                title: "Total (Min)",
                                label: "",
                                readOnly: true,
                                width: 170,
                                controller: buildingInfo.tminPrice),
                            _buildTextFieldColumn(
                                title: "\$/sqm(Max)",
                                label: "Enter",
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                width: 180,
                                controller: buildingInfo.maxPrice),
                            _buildTextFieldColumn(
                                title: "Total (Max)",
                                label: "",
                                readOnly: true,
                                width: 170,
                                controller: buildingInfo.tmaxPrice),
                          ],
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
                    child: Wrap(
                      spacing: 10.0,
                      children: [
                        _buildTextFieldColumn(
                            title: "Total Size Sqm",
                            label: "",
                            readOnly: true,
                            width: 180,
                            controller: _totalBuildingSizeSqm),
                        _buildTextFieldColumn(
                            title: "Total Value(Min)",
                            label: "",
                            readOnly: true,
                            width: 180,
                            controller: _totalBuildingMinPrice),
                        _buildTextFieldColumn(
                            title: "Total Value(Max)",
                            label: "",
                            readOnly: true,
                            width: 180,
                            controller: _totalBuildingMaxPrice),
                      ],
                    ),
                  ),
                ],
              ),
            ] else if (widget.ck1 == "Property CONDO REPORT") ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "A. CONDO",
                    style: THeader(),
                  ),
                  SizedBox(height: 15),
                  ...buildingInfoList.map((buildingInfo) => InkWell(
                        onFocusChange: (value) {
                          setState(() {
                            if (value == false) {
                              objbuilding.add(PBuilding(
                                  floorno: buildingInfo.floorno.text,
                                  bedroomno: buildingInfo.bedroomno.text,
                                  sizesqm: buildingInfo.sizeSqm.text,
                                  minsqm: buildingInfo.minPrice.text,
                                  maxsqm: buildingInfo.maxPrice.text,
                                  totalmin: buildingInfo.tminPrice.text,
                                  totalmax: buildingInfo.tmaxPrice.text));
                            }
                          });
                        },
                        child: Wrap(
                          spacing: 10.0,
                          children: [
                            _buildTextFieldColumn(
                                title: "Floor/Unit No.",
                                label: "",
                                width: 120,
                                controller: buildingInfo.floorno),
                            _buildTextFieldColumn(
                                title: "No. of Bedroom",
                                label: "",
                                width: 120,
                                controller: buildingInfo.bedroomno),
                            _buildTextFieldColumn(
                                title: "Gross Area Sqm",
                                label: "Enter",
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                width: 170,
                                controller: buildingInfo.sizeSqm),
                            _buildTextFieldColumn(
                                title: "\$/sqm(Min)",
                                label: "Enter",
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                width: 170,
                                controller: buildingInfo.minPrice),
                            _buildTextFieldColumn(
                                title: "Total (Min)",
                                label: "",
                                readOnly: true,
                                width: 170,
                                controller: buildingInfo.tminPrice),
                            _buildTextFieldColumn(
                                title: "\$/sqm(Max)",
                                label: "Enter",
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                width: 180,
                                controller: buildingInfo.maxPrice),
                            _buildTextFieldColumn(
                                title: "Total (Max)",
                                label: "",
                                readOnly: true,
                                width: 170,
                                controller: buildingInfo.tmaxPrice),
                          ],
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
                    child: Wrap(
                      spacing: 10.0,
                      children: [
                        _buildTextFieldColumn(
                            title: "Total Size Sqm",
                            label: "",
                            readOnly: true,
                            width: 180,
                            controller: _totalBuildingSizeSqm),
                        _buildTextFieldColumn(
                            title: "Total Value(Min)",
                            label: "",
                            readOnly: true,
                            width: 180,
                            controller: _totalBuildingMinPrice),
                        _buildTextFieldColumn(
                            title: "Total Value(Max)",
                            label: "",
                            readOnly: true,
                            width: 180,
                            controller: _totalBuildingMaxPrice),
                      ],
                    ),
                  ),
                ],
              ),
            ],

            Divider(
              color: Colors.black,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "C. Fair Market Value ",
              style: THeader(),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Wrap(
                  spacing: 10.0,
                  children: [
                    if (widget.ck1 != "Property LAND VALUATION REPORT") ...[
                      // _buildTextFieldColumn(
                      //     width: 300,
                      //     title: "Fair Market Value (Max\$)",
                      //     label: "Enter",
                      //     // readOnly: true,
                      //     controller: _fairmarket),
                      // SizedBox(
                      //   width: 25,
                      // ),
                      _buildTextFieldColumn(
                          width: 300,
                          title: "Fire Insurance Value",
                          label: "Enter",
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          // readOnly: true,
                          controller: _fireinsurance),
                      SizedBox(
                        width: 25,
                      ),
                      _buildTextFieldColumn(
                          width: 350,
                          title: "Force Sale Value",
                          label: "Enter",
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          // readOnly: true,
                          controller: _forcesale),
                    ] else ...[
                      _buildTextFieldColumn(
                          width: 350,
                          title: "Force Sale Value",
                          label: "Enter",
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          // readOnly: true,
                          controller: _forcesale),
                    ]
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldColumn({
    required String title,
    required String label,
    double? width,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    bool readOnly = false,
    String? Function(String?)? validator,
  }) {
    return Column(
      children: [
        Text.rich(
          overflow: TextOverflow.ellipsis,
          TextSpan(children: [
            TextSpan(
              text: title,
              style: THeader(),
            ),
            TextSpan(
              text: " *",
              style: TextStyle(color: Colors.red, fontSize: 15),
            )
          ]),
        ),
        Container(
          width: width,
          child: TextFormField(
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
            validator: validator,
          ),
        ),
      ],
    );
  }
}

class PropertyInfo {
  final int noCount;
  TextEditingController floorno;
  TextEditingController bedroomno;
  final TextEditingController sizeSqm;
  final TextEditingController minPrice;
  final TextEditingController maxPrice;
  final TextEditingController tminPrice;
  final TextEditingController tmaxPrice;

  PropertyInfo(
      {required this.noCount,
      required this.bedroomno,
      required this.floorno,
      required this.sizeSqm,
      required this.minPrice,
      required this.maxPrice,
      required this.tminPrice,
      required this.tmaxPrice});
}
