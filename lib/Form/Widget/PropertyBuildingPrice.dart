import 'package:book/Componnents/style.dart';
import 'package:flutter/material.dart';

class PropertyPrice extends StatefulWidget {
  final int NoNumber;
  final Function(double) onSizeChange;

  PropertyPrice(
      {super.key, required this.NoNumber, required this.onSizeChange});

  @override
  State<PropertyPrice> createState() => _PropertyPriceState();
}

class _PropertyPriceState extends State<PropertyPrice> {
  TextEditingController _lsize = TextEditingController();
  TextEditingController _minprice = TextEditingController();
  TextEditingController _maxprice = TextEditingController();
  TextEditingController _tminprice = TextEditingController();
  TextEditingController _tmaxprice = TextEditingController();

  @override
  void initState() {
    super.initState();
    _lsize.addListener(_calculateTotal);
    _minprice.addListener(_calculateTotal);
    _maxprice.addListener(_calculateTotal);
    _tminprice.addListener(_calculateTotal);
    _tmaxprice.addListener(_calculateTotal);
  }

  @override
  void dispose() {
    _lsize.dispose();
    _minprice.dispose();
    _maxprice.dispose();
    _tminprice.dispose();
    _tmaxprice.dispose();
    super.dispose();
  }

  void _calculateTotal() {
    double landSize = double.tryParse(_lsize.text) ?? 0.0;
    double minPrice = double.tryParse(_minprice.text) ?? 0.0;
    double maxPrice = double.tryParse(_maxprice.text) ?? 0.0;

    double TotalMin = landSize * minPrice;
    double TotalMax = landSize * maxPrice;

    _tminprice.text = TotalMin.toStringAsFixed(2);
    _tmaxprice.text = TotalMax.toStringAsFixed(2);
  }

  void _onFocusChange() {
    double landSize = double.tryParse(_lsize.text) ?? 0.0;
    widget.onSizeChange(landSize);
  }

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: Focus(
        onFocusChange: (focus) {
          if (!focus) {
            _onFocusChange();
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildTextFieldColumn(
                      width: 100,
                      title: "No",
                      label: "Enter",
                      readOnly: true,
                      controller: TextEditingController(
                          text: widget.NoNumber.toString())),
                  _buildTextFieldColumn(
                      width: 230,
                      title: "Size sqm",
                      label: "Enter",
                      controller: _lsize),
                  _buildTextFieldColumn(
                      width: 230,
                      title: "\$/sqm(Min)",
                      label: "Enter",
                      controller: _minprice),
                  _buildTextFieldColumn(
                      width: 230,
                      title: "Total (\$)",
                      label: "0.0",
                      readOnly: true,
                      controller: _tminprice),
                  _buildTextFieldColumn(
                      width: 230,
                      title: "\$/sqm(Max)",
                      label: "Enter",
                      controller: _maxprice),
                  _buildTextFieldColumn(
                      width: 230,
                      title: "Total (\$)",
                      label: "0.0",
                      readOnly: true,
                      controller: _tmaxprice),
                ],
              ),
            ],
          ),
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
