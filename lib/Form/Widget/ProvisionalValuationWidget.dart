import 'package:book/Componnents/style.dart';
import 'package:flutter/material.dart';

class ProvisionalValue extends StatefulWidget {
  final String? ck1;
  final int NoLandCount;
  const ProvisionalValue({
    super.key,
    required this.NoLandCount,
    this.ck1,
  });

  @override
  State<ProvisionalValue> createState() => _FinalIndicationWidgetState();
}

class _FinalIndicationWidgetState extends State<ProvisionalValue> {
  List<PropertyInfo> landInfoList = [];
  List<PropertyInfo> buildingInfoList = [];

  TextEditingController _totalLandSizeSqm = TextEditingController();
  TextEditingController _totalMinPrice = TextEditingController();
  TextEditingController _totalMaxPrice = TextEditingController();

  TextEditingController _totalBuildingSizeSqm = TextEditingController();
  TextEditingController _totalBuildingMinPrice = TextEditingController();
  TextEditingController _totalBuildingMaxPrice = TextEditingController();

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
          ...landInfoList.map((landInfo) => Padding(
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
                        width: 210,
                        controller: landInfo.sizeSqm),
                    SizedBox(width: 25),
                    _buildTextFieldColumn(
                        title: "\$/sqm(Min)",
                        label: "Enter",
                        width: 210,
                        controller: landInfo.minPrice),
                    SizedBox(width: 25),
                    _buildTextFieldColumn(
                        title: "Total (Min)",
                        label: "",
                        readOnly: true,
                        width: 210,
                        controller: landInfo.tminPrice),
                    SizedBox(width: 25),
                    _buildTextFieldColumn(
                        title: "\$/sqm(Max)",
                        label: "Enter",
                        width: 210,
                        controller: landInfo.maxPrice),
                    SizedBox(width: 25),
                    _buildTextFieldColumn(
                        title: "Total (Max)",
                        label: "",
                        readOnly: true,
                        width: 210,
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
            child: Row(
              children: [
                _buildTextFieldColumn(
                    title: "Total Size Sqm",
                    label: "",
                    readOnly: true,
                    width: 210,
                    controller: _totalLandSizeSqm),
                SizedBox(width: 25),
                _buildTextFieldColumn(
                    title: "Total Value(Min)",
                    label: "",
                    readOnly: true,
                    width: 210,
                    controller: _totalMinPrice),
                SizedBox(width: 25),
                _buildTextFieldColumn(
                    title: "Total Value(Max)",
                    label: "",
                    readOnly: true,
                    width: 210,
                    controller: _totalMaxPrice),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          if (widget.ck1 != "Property LAND VALUATION REPORT")
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "B. Building",
                  style: THeader(),
                ),
                SizedBox(height: 15),
                ...buildingInfoList.map((buildingInfo) => Padding(
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
                              width: 210,
                              controller: buildingInfo.sizeSqm),
                          SizedBox(width: 25),
                          _buildTextFieldColumn(
                              title: "\$/sqm(Min)",
                              label: "Enter",
                              width: 210,
                              controller: buildingInfo.minPrice),
                          SizedBox(width: 25),
                          _buildTextFieldColumn(
                              title: "Total (Min)",
                              label: "",
                              readOnly: true,
                              width: 210,
                              controller: buildingInfo.tminPrice),
                          SizedBox(width: 25),
                          _buildTextFieldColumn(
                              title: "\$/sqm(Max)",
                              label: "Enter",
                              width: 210,
                              controller: buildingInfo.maxPrice),
                          SizedBox(width: 25),
                          _buildTextFieldColumn(
                              title: "Total (Max)",
                              label: "",
                              readOnly: true,
                              width: 210,
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
                  child: Row(
                    children: [
                      _buildTextFieldColumn(
                          title: "Total Size Sqm",
                          label: "",
                          readOnly: true,
                          width: 210,
                          controller: _totalBuildingSizeSqm),
                      SizedBox(width: 25),
                      _buildTextFieldColumn(
                          title: "Total Value(Min)",
                          label: "",
                          readOnly: true,
                          width: 210,
                          controller: _totalBuildingMinPrice),
                      SizedBox(width: 25),
                      _buildTextFieldColumn(
                          title: "Total Value(Max)",
                          label: "",
                          readOnly: true,
                          width: 210,
                          controller: _totalBuildingMaxPrice),
                    ],
                  ),
                ),
              ],
            ),
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
              child: Row(
                children: [
                  if (widget.ck1 != "Property LAND VALUATION REPORT")
                    _buildTextFieldColumn(
                        width: 300,
                        title: "Fair Market Value (Max\$)",
                        label: "Enter",
                        // readOnly: true,
                        controller: TextEditingController()),
                  SizedBox(
                    width: 25,
                  ),
                  _buildTextFieldColumn(
                      width: 300,
                      title: "Fire Insurance Value",
                      label: "Enter",
                      // readOnly: true,
                      controller: TextEditingController()),
                  SizedBox(
                    width: 25,
                  ),
                  _buildTextFieldColumn(
                      width: 350,
                      title: "Force Sale Value",
                      label: "Enter",
                      // readOnly: true,
                      controller: TextEditingController()),
                ],
              )),
        ],
      ),
    );
  }

  Column _buildTextFieldColumn({
    required String title,
    required String label,
    required double width,
    required TextEditingController controller,
    bool readOnly = false,
    String? Function(String?)? validator,
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
          child: TextFormField(
            readOnly: readOnly,
            controller: controller,
            maxLines: null,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              hintText: label,
              border: InputBorder.none,
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
  final TextEditingController sizeSqm;
  final TextEditingController minPrice;
  final TextEditingController maxPrice;
  final TextEditingController tminPrice;
  final TextEditingController tmaxPrice;

  PropertyInfo({
    required this.maxPrice,
    required this.tminPrice,
    required this.tmaxPrice,
    required this.noCount,
    required this.sizeSqm,
    required this.minPrice,
  });
}
