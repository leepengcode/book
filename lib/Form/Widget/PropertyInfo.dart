import 'package:book/Componnents/style.dart';

import 'package:flutter/material.dart';

class PropertyInfo_Widget extends StatefulWidget {
  final String? ck1;
  const PropertyInfo_Widget({
    super.key,
    this.ck1,
  });

  @override
  State<PropertyInfo_Widget> createState() => _PropertyInfo_WidgetState();
}

class _PropertyInfo_WidgetState extends State<PropertyInfo_Widget> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

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
            "1.Bordered by the following",
            style: THeader(),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTextFieldColumn(
                  title: "Plot Nº",
                  label: "",
                  width: 250,
                  controller: TextEditingController()),
              _buildTextFieldColumn(
                  title: "North",
                  label: "",
                  width: 250,
                  controller: TextEditingController()),
              _buildTextFieldColumn(
                  title: "South",
                  label: "",
                  width: 250,
                  controller: TextEditingController()),
              _buildTextFieldColumn(
                  title: "East",
                  label: "",
                  width: 250,
                  controller: TextEditingController()),
              _buildTextFieldColumn(
                  title: "West",
                  label: "",
                  width: 250,
                  controller: TextEditingController()),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "2.Land",
            style: THeader(),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTextFieldColumn(
                  title: "Land title deed Nº",
                  label: "",
                  width: 250,
                  controller: TextEditingController()),
              _buildTextFieldColumn(
                  title: "Land Size(by title deed)",
                  label: "",
                  width: 250,
                  keytype: TextInputType.number,
                  controller: TextEditingController()),
              _buildTextFieldColumn(
                  title: "Total Land Size(by Measurement)",
                  label: "",
                  width: 250,
                  keytype: TextInputType.number,
                  controller: TextEditingController()),
              _buildTextFieldColumn(
                  title: "Type of land",
                  label: "",
                  width: 250,
                  controller: TextEditingController()),
              if (widget.ck1 != "Property LAND VALUATION REPORT") ...[
                _buildTextFieldColumn(
                    title: "Occupant",
                    label: "",
                    width: 250,
                    controller: TextEditingController()),
              ] else ...[
                _buildTextFieldColumn(
                    title: "Type of Tenure",
                    label: "",
                    width: 250,
                    controller: TextEditingController()),
              ]
            ],
          ),
          if (widget.ck1 != "Property LAND VALUATION REPORT")
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "3. Building Size  ",
                  style: THeader(),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTextFieldColumn(
                        title: "(Flat)Building Size",
                        label: "",
                        width: 250,
                        keytype: TextInputType.number,
                        controller: TextEditingController()),
                    _buildTextFieldColumn(
                        title: "Building Size",
                        label: "",
                        keytype: TextInputType.number,
                        width: 250,
                        controller: TextEditingController()),
                    _buildTextFieldColumn(
                        title: "Total Building Size",
                        label: "",
                        width: 250,
                        keytype: TextInputType.number,
                        controller: TextEditingController()),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "4. Building Detail",
                  style: THeader(),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTextFieldColumn(
                        title: "Type of Building",
                        label: "",
                        width: 250,
                        controller: TextEditingController()),
                    _buildTextFieldColumn(
                        title: "Age of Building",
                        label: "",
                        width: 250,
                        controller: TextEditingController()),
                    _buildTextFieldColumn(
                        title: "Cost of Construction",
                        label: "",
                        width: 250,
                        controller: TextEditingController()),
                    _buildTextFieldColumn(
                        title: "By owner",
                        label: "",
                        width: 250,
                        controller: TextEditingController()),
                    _buildTextFieldColumn(
                        title: "Metal Roof area",
                        label: "",
                        width: 250,
                        controller: TextEditingController()),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTextFieldColumn(
                        title: "Occupied or Vacant",
                        label: "",
                        width: 250,
                        controller: TextEditingController()),
                    _buildTextFieldColumn(
                        title: "Disposability",
                        label: "",
                        width: 250,
                        controller: TextEditingController()),
                    _buildTextFieldColumn(
                        title: "Quality given as a",
                        label: "",
                        width: 250,
                        controller: TextEditingController()),
                    _buildTextFieldColumn(
                        title: "Percentage",
                        label: "",
                        width: 250,
                        controller: TextEditingController()),
                    _buildTextFieldColumn(
                        title: "Type of building",
                        label: "",
                        width: 250,
                        controller: TextEditingController()),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "5. Sources of Materials",
                  style: THeader(),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTextFieldColumn(
                        title: "Floor",
                        label: "",
                        width: 250,
                        controller: TextEditingController()),
                    _buildTextFieldColumn(
                        title: "Roof",
                        label: "",
                        width: 250,
                        controller: TextEditingController()),
                    _buildTextFieldColumn(
                        title: "Door",
                        label: "",
                        width: 250,
                        controller: TextEditingController()),
                    _buildTextFieldColumn(
                        title: "Stair",
                        label: "",
                        width: 250,
                        controller: TextEditingController()),
                    _buildTextFieldColumn(
                        title: "Window",
                        label: "",
                        width: 250,
                        controller: TextEditingController()),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTextFieldColumn(
                        title: "Ceiling",
                        label: "",
                        width: 250,
                        controller: TextEditingController()),
                    _buildTextFieldColumn(
                        title: "Wall",
                        label: "",
                        width: 250,
                        controller: TextEditingController()),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "6. Internal Description ",
                  style: THeader(),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTextFieldColumn(
                        title: "Floor/Story",
                        label: "",
                        width: 250,
                        controller: TextEditingController()),
                    _buildTextFieldColumn(
                        title: "Bathroom",
                        label: "",
                        width: 250,
                        controller: TextEditingController()),
                    _buildTextFieldColumn(
                        title: "Room",
                        label: "",
                        width: 250,
                        controller: TextEditingController()),
                    _buildTextFieldColumn(
                        title: "Kitchen",
                        label: "",
                        width: 250,
                        controller: TextEditingController()),
                    _buildTextFieldColumn(
                        title: "Dining/Living Room",
                        label: "",
                        width: 250,
                        controller: TextEditingController()),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTextFieldColumn(
                        title: "Storage Room",
                        label: "",
                        width: 250,
                        controller: TextEditingController()),
                    
                    _buildTextFieldColumn(
                        title: "Total Accommodation",
                        label: "",
                        width: 250,
                        controller: TextEditingController()),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "7. Utilities/Facilities Available",
                  style: THeader(),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTextFieldColumn(
                        title: "Water",
                        label: "",
                        width: 250,
                        controller: TextEditingController()),
                    _buildTextFieldColumn(
                        title: "Electricity",
                        label: "",
                        width: 250,
                        controller: TextEditingController()),
                    _buildTextFieldColumn(
                        title: "Sewerage",
                        label: "",
                        width: 250,
                        controller: TextEditingController()),
                    _buildTextFieldColumn(
                        title: "Telecommunications",
                        label: "",
                        width: 250,
                        controller: TextEditingController()),
                    _buildTextFieldColumn(
                        title: "Security",
                        label: "",
                        width: 250,
                        controller: TextEditingController()),
                  ],
                ),
              ],
            )
        ],
      ),
    );
  }

  Column _buildTextFieldColumn(
      {required String title,
      required String label,
      required double width,
      required TextEditingController controller,
      bool readOnly = false,
      String? Function(String?)? validator,
      TextInputType? keytype}) {
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
            keyboardType: keytype,
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
