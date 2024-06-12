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

  @override
  void initState() {
    super.initState();
    _lsize.addListener(_calculateTotalLandPrice);
    _lprice.addListener(_calculateTotalLandPrice);
  }

  @override
  void dispose() {
    _lsize.removeListener(_calculateTotalLandPrice);
    _lprice.removeListener(_calculateTotalLandPrice);
    _lsize.dispose();
    _lprice.dispose();
    _tlprice.dispose();
    super.dispose();
  }

  void _calculateTotalLandPrice() {
    double landSize = double.tryParse(_lsize.text) ?? 0.0;
    double landPrice = double.tryParse(_lprice.text) ?? 0.0;
    double totalLandPrice = landSize * landPrice;
    _tlprice.text = totalLandPrice.toStringAsFixed(2);
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
                readOnly: true,
              ),
              SizedBox(width: 15),
              _buildTextFieldColumn(
                label: "Land Size",
                controller: _lsize,
              ),
              SizedBox(width: 15),
              _buildTextFieldColumn(
                label: "Building Size",
                controller: TextEditingController(),
              ),
              SizedBox(width: 15),
              _buildTextFieldColumn(
                label: "Land value USD/sqm",
                controller: _lprice,
              ),
              SizedBox(width: 15),
              _buildTextFieldColumn(
                label: "Building value USD/sqm",
                controller: TextEditingController(),
              ),
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
                controller: TextEditingController(),
                readOnly: true,
              ),
              SizedBox(width: 15),
              _buildTextFieldColumn(
                label: "Total Land Price",
                controller: TextEditingController(),
                readOnly: true,
              ),
              SizedBox(width: 15),
              _buildTextFieldColumn(
                label: "Total Building Price",
                controller: TextEditingController(),
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
        Text(
          label,
          style: THeader(),
        ),
        Container(
          width: 250,
          child: TextField(
            controller: controller,
            readOnly: readOnly,
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
