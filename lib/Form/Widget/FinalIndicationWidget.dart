import 'package:book/Componnents/style.dart';
import 'package:flutter/material.dart';

class FinalIndicationWidget extends StatefulWidget {
  final int NoLandCount;
  const FinalIndicationWidget({
    super.key,
    required this.NoLandCount,
  });

  @override
  State<FinalIndicationWidget> createState() => _FinalIndicationWidgetState();
}

class _FinalIndicationWidgetState extends State<FinalIndicationWidget> {
  List<PropertyInfo> landInfoList = [];
  List<PropertyInfo> buildingInfoList = [];

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
      ));

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
      ));

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
          SizedBox(
            height: 15,
          ),
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

class PropertyInfo {
  final int noCount;
  final TextEditingController sizeSqm;
  final TextEditingController sizeSqft;
  final TextEditingController valueUsd;
  final TextEditingController pValue;

  PropertyInfo({
    required this.noCount,
    required this.sizeSqm,
    required this.sizeSqft,
    required this.valueUsd,
    required this.pValue,
  });
}
