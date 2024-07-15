import 'package:book/Componnents/style.dart';
import 'package:book/Model/ComparisonModel.dart';
import 'package:flutter/material.dart';

class ComparePropertyWidget extends StatefulWidget {
  final ValueChanged<Comparison>? getvalue;
  final int parcelNumber;

  const ComparePropertyWidget({
    Key? key,
    required this.parcelNumber,
    this.getvalue,
  }) : super(key: key);

  @override
  _ComparePropertyWidgetState createState() => _ComparePropertyWidgetState();
}

class _ComparePropertyWidgetState extends State<ComparePropertyWidget> {
  TextEditingController _lsize = TextEditingController();
  TextEditingController _lprice = TextEditingController();
  TextEditingController _tlprice = TextEditingController();
  TextEditingController _bsize = TextEditingController();
  TextEditingController _bprice = TextEditingController();
  TextEditingController _tbprice = TextEditingController();
  TextEditingController _tblprice = TextEditingController();
  TextEditingController _type = TextEditingController();
  TextEditingController _typeofproperty1 = TextEditingController();
  TextEditingController _typeofproperty2 = TextEditingController();
  TextEditingController _location = TextEditingController();

  @override
  void initState() {
    super.initState();
    _lsize.addListener(_calculateTotal);
    _lprice.addListener(_calculateTotal);
    _bsize.addListener(_calculateTotal);
    _bprice.addListener(_calculateTotal);
    _tblprice.addListener(_calculateTotal);
    _tblprice.addListener(_calculateTotal);
  }

  @override
  void dispose() {
    _lsize.removeListener(_calculateTotal);
    _lprice.removeListener(_calculateTotal);
    _bsize.removeListener(_calculateTotal);
    _bprice.removeListener(_calculateTotal);
    _tblprice.removeListener(_calculateTotal);
    _type.removeListener(_calculateTotal);
    _tblprice.dispose();
    _bsize.dispose();
    _bprice.dispose();
    _tbprice.dispose();
    _lsize.dispose();
    _lprice.dispose();
    _tlprice.dispose();
    _type.dispose();
    _location.dispose();
    super.dispose();
  }

  void _calculateTotal() {
    double landSize = double.tryParse(_lsize.text) ?? 0.0;
    double landPrice = double.tryParse(_lprice.text) ?? 0.0;
    double buildingSize = double.tryParse(_bsize.text) ?? 0.0;
    double buildingPrice = double.tryParse(_bprice.text) ?? 0.0;
    // double totalPrice = double.tryParse(_tblprice.text) ?? 0.0;
    double totalLandPrice = landSize * landPrice;
    double totalBuildingPrice = buildingSize * buildingPrice;
    double totaltbPrice = totalLandPrice + totalBuildingPrice;

    _tlprice.text = totalLandPrice.toStringAsFixed(2);
    _tbprice.text = totalBuildingPrice.toStringAsFixed(2);
    _tblprice.text = totaltbPrice.toStringAsFixed(2);

    objCompa!.parcel = widget.parcelNumber.toString();
    objCompa!.typeofproperty1 = _typeofproperty1.text;
    objCompa!.typeofproperty2 = _typeofproperty2.text;
    objCompa!.location = _location.text;
    objCompa!.landsize = _lsize.text;
    objCompa!.landprice = _lprice.text;
    objCompa!.landvalue = _tlprice.text;
    objCompa!.buildingsize = _bsize.text;
    objCompa!.buildingprice = _bprice.text;
    objCompa!.buildingvalue = _tbprice.text;
    objCompa!.totalprice = _tblprice.text;
    objCompa!.typecompare = _type.text ?? "good";
  }

  Comparison? objCompa = Comparison(
      parcel: '0',
      landsize: '0',
      buildingsize: '0',
      landvalue: '0',
      buildingvalue: '0',
      landprice: '0',
      buildingprice: '0',
      totalprice: '0',
      typecompare: 'New',
      typeofproperty1: '0',
      typeofproperty2: '0',
      location: '0');

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onFocusChange: (value) {
        if (_location != null && value == false) {
          print("location in comp ${_location.text}\n");
          setState(() {
            objCompa!.location = _location.text;
            widget.getvalue!(objCompa!);
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0, bottom: 15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildTextFieldColumn(
                  label: "Parcel",
                  readOnly: true,
                  width: 50,
                  controller: TextEditingController(
                      text: widget.parcelNumber.toString()),
                ),
                SizedBox(width: 15),
                _buildTextFieldColumn(
                  label: "type of property1",
                  width: 200,
                  controller: _typeofproperty1,
                ),
                SizedBox(width: 15),
                _buildTextFieldColumn(
                  label: "type of property2",
                  width: 200,
                  controller: _typeofproperty2,
                ),
                SizedBox(width: 15),
                _buildTextFieldColumn(
                  label: "Land Size",
                  width: 230,
                  controller: _lsize,
                ),
                SizedBox(width: 15),
                _buildTextFieldColumn(
                  label: "Building Size",
                  width: 230,
                  controller: _bsize,
                ),
                SizedBox(width: 15),
                _buildTextFieldColumn(
                  label: "Land value USD/sqm",
                  width: 230,
                  controller: _lprice,
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                _buildTextFieldColumn(
                    width: 230,
                    label: "Building value USD/sqm",
                    controller: _bprice),
                SizedBox(width: 15),
                _buildTextFieldColumn(
                  label: "Land Price/USD",
                  controller: _tlprice,
                  width: 230,
                  readOnly: true,
                ),
                SizedBox(width: 15),
                _buildTextFieldColumn(
                  label: "Building Price/USD",
                  width: 230,
                  controller: _tbprice,
                  readOnly: true,
                ),
                SizedBox(width: 15),
                _buildTextFieldColumn(
                  label: "Total Price",
                  width: 230,
                  controller: _tblprice,
                  readOnly: true,
                ),
                SizedBox(width: 15),
                _buildTextFieldColumn(
                    label: "Type of compare", width: 230, controller: _type),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                _buildTextFieldColumn(
                    width: 500, label: "location", controller: _location),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Column _buildTextFieldColumn({
    required String label,
    required TextEditingController controller,
    bool readOnly = false,
    double? width,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
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
            controller: controller,
            maxLines: null,
            readOnly: readOnly,
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
