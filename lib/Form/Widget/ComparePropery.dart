import 'package:book/Componnents/style.dart';
import 'package:flutter/material.dart';

class ComparePropertyWidget extends StatefulWidget {
  final int parcelNumber;

  const ComparePropertyWidget({
    Key? key,
    required this.parcelNumber,
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
    _tblprice.dispose();
    _bsize.dispose();
    _bprice.dispose();
    _tbprice.dispose();
    _lsize.dispose();
    _lprice.dispose();
    _tlprice.dispose();
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
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, bottom: 15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildTextFieldColumn(
                label: "Parcel",
                controller:
                    TextEditingController(text: widget.parcelNumber.toString()),
              ),
              SizedBox(width: 15),
              _buildTextFieldColumn(
                label: "Land Size",
                controller: _lsize,
              ),
              SizedBox(width: 15),
              _buildTextFieldColumn(
                label: "Building Size",
                controller: _bsize,
              ),
              SizedBox(width: 15),
              _buildTextFieldColumn(
                label: "Land value USD/sqm",
                controller: _lprice,
              ),
              SizedBox(width: 15),
              _buildTextFieldColumn(
                  label: "Building value USD/sqm", controller: _bprice),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              _buildTextFieldColumn(
                label: "Land Price/USD",
                controller: _tlprice,
                readOnly: true,
              ),
              SizedBox(width: 15),
              _buildTextFieldColumn(
                label: "Building Price/USD",
                controller: _tbprice,
                readOnly: true,
              ),
              SizedBox(width: 15),
              _buildTextFieldColumn(
                label: "Total Price",
                controller: _tblprice,
                readOnly: true,
              ),
              SizedBox(width: 15),
              _buildTextFieldColumn(
                label: "Type of compare",
                controller: TextEditingController(),
                readOnly: true,
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Column _buildTextFieldColumn({
    required String label,
    required TextEditingController controller,
    bool readOnly = false,
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
          width: 230,
          child: TextField(
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
