import 'package:book/Componnents/style.dart';
import 'package:book/Model/PropertyInfoModel.dart';

import 'package:flutter/material.dart';

class PropertyInfo_Widget extends StatefulWidget {
  final String? ck1;
  const PropertyInfo_Widget({
    super.key,
    this.ck1,
    this.getForm,
  });

  final ValueChanged<PropertyInfor?>? getForm;
  @override
  State<PropertyInfo_Widget> createState() => _PropertyInfo_WidgetState();
}

class _PropertyInfo_WidgetState extends State<PropertyInfo_Widget> {
  PropertyInfor objInfo = new PropertyInfor(
      // bathroom: "Skokok",r
      // buildingage: "S",
      // buildingsize: "s",
      // buildingtype: "w",
      // byowner: "q",
      // ceiling: "q",
      // cost: "w",
      // diningnlivingroom: "d",
      // disposability: "d",
      // door: "d",
      // east: "d",
      // electricity: "d",
      // flatsize: "d",
      // floor: "d",
      // floornstory: "d",
      // kitchen: "d",
      // landsize: "s",
      // landtitledeep: "d",
      // metalroof: "s",
      // north: "s",
      // occoupied: "s",
      // occupant: "s",
      // percentage: "s",
      // plotno: "s",
      // quality: "s",
      // roof: "s",
      // room: "s",
      // security: "dkoko",
      // severage: "S",
      // south: "s",
      // stair: "s",
      // store: "s",
      // telecom: "s",
      // tenure: "s",
      // total: "s",
      // totalland: "s",
      // totalsize: "s",
      // typeland: "s",
      // typeofbuilding: "s",
      // wall: "s",
      // water: "s",
      // west: "s",
      // windows: "s",
      );

  final _plotno = TextEditingController();
  final _north = TextEditingController();
  final _south = TextEditingController();
  final _east = TextEditingController();
  final _west = TextEditingController();
  final _landtitledeep = TextEditingController();
  final _landsize = TextEditingController();
  final _totalland = TextEditingController();
  final _typeland = TextEditingController();
  final _occupant = TextEditingController();
  final _tenure = TextEditingController();
  final _flatsize = TextEditingController();
  final _buildingsize = TextEditingController();
  final _totalsize = TextEditingController();
  final _buildingtype = TextEditingController();
  final _buildingage = TextEditingController();
  final _cost = TextEditingController();
  final _byowner = TextEditingController();
  final _metalroof = TextEditingController();
  final _occoupied = TextEditingController();
  final _disposability = TextEditingController();
  final _quality = TextEditingController();
  final _percentage = TextEditingController();
  final _typeofbuilding = TextEditingController();
  final _floor = TextEditingController();
  final _roof = TextEditingController();
  final _door = TextEditingController();
  final _stair = TextEditingController();
  final _windows = TextEditingController();
  final _ceiling = TextEditingController();
  final _wall = TextEditingController();
  final _floornstory = TextEditingController();
  final _bathroom = TextEditingController();
  final _room = TextEditingController();
  final _kitchen = TextEditingController();
  final _diningnlivingroom = TextEditingController();
  final _store = TextEditingController();
  final _total = TextEditingController();
  final _water = TextEditingController();
  final _electricity = TextEditingController();
  final _severage = TextEditingController();
  final _telecom = TextEditingController();
  final _security = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 1), () {
      setState(() {
        objInfo.plotno = _plotno.text;
        objInfo.north = _north.text;
        objInfo.south = _south.text;
        objInfo.east = _east.text;
        objInfo.west = _west.text;
        objInfo.landtitledeep = _landtitledeep.text;
        objInfo.landsize = _landsize.text;
        objInfo.totalland = _totalland.text;
        objInfo.typeland = _typeland.text;
        objInfo.occupant = _occupant.text;
        objInfo.tenure = _tenure.text;
        objInfo.flatsize = _flatsize.text;
        objInfo.buildingsize = _buildingsize.text;
        objInfo.totalsize = _totalsize.text;
        objInfo.buildingtype = _buildingtype.text;
        objInfo.buildingage = _buildingage.text;
        objInfo.cost = _cost.text;
        objInfo.byowner = _byowner.text;
        objInfo.metalroof = _metalroof.text;
        objInfo.occoupied = _occoupied.text;
        objInfo.disposability = _disposability.text;
        objInfo.quality = _quality.text;
        objInfo.percentage = _percentage.text;
        objInfo.typeofbuilding = _typeofbuilding.text;
        objInfo.floor = _floor.text;
        objInfo.roof = _roof.text;
        objInfo.door = _door.text;
        objInfo.stair = _stair.text;
        objInfo.windows = _windows.text;
        objInfo.ceiling = _ceiling.text;
        objInfo.wall = _wall.text;
        objInfo.floornstory = _floornstory.text;
        objInfo.bathroom = _bathroom.text;
        objInfo.room = _room.text;
        objInfo.kitchen = _kitchen.text;
        objInfo.diningnlivingroom = _diningnlivingroom.text;
        objInfo.store = _store.text;
        objInfo.total = _total.text;
        objInfo.water = _water.text;
        objInfo.electricity = _electricity.text;
        objInfo.severage = _severage.text;
        objInfo.telecom = _telecom.text;
        objInfo.security = _security.text;
        widget.getForm!(objInfo);
      });
    });
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
                  title: "Plot Nº", label: "", width: 250, controller: _plotno),
              _buildTextFieldColumn(
                  title: "North", label: "", width: 250, controller: _north),
              _buildTextFieldColumn(
                  title: "South", label: "", width: 250, controller: _south),
              _buildTextFieldColumn(
                  title: "East", label: "", width: 250, controller: _east),
              _buildTextFieldColumn(
                  title: "West", label: "", width: 250, controller: _west),
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
                  controller: _landtitledeep),
              _buildTextFieldColumn(
                  title: "Land Size(by title deed)",
                  label: "",
                  width: 250,
                  keytype: TextInputType.number,
                  controller: _landsize),
              _buildTextFieldColumn(
                  title: "Total Land Size(by Measurement)",
                  label: "",
                  width: 250,
                  keytype: TextInputType.number,
                  controller: _totalland),
              _buildTextFieldColumn(
                  title: "Type of land",
                  label: "",
                  width: 250,
                  controller: _typeland),
              if (widget.ck1 != "Property LAND VALUATION REPORT") ...[
                _buildTextFieldColumn(
                    title: "Occupant",
                    label: "",
                    width: 250,
                    controller: _occupant),
              ] else ...[
                _buildTextFieldColumn(
                    title: "Type of Tenure",
                    label: "",
                    width: 250,
                    controller: _tenure),
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
                        controller: _flatsize),
                    _buildTextFieldColumn(
                        title: "Building Size",
                        label: "",
                        keytype: TextInputType.number,
                        width: 250,
                        controller: _buildingsize),
                    _buildTextFieldColumn(
                        title: "Total Building Size",
                        label: "",
                        width: 250,
                        keytype: TextInputType.number,
                        controller: _totalsize),
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
                        controller: _buildingtype),
                    _buildTextFieldColumn(
                        title: "Age of Building",
                        label: "",
                        width: 250,
                        controller: _buildingage),
                    _buildTextFieldColumn(
                        title: "Cost of Construction",
                        label: "",
                        width: 250,
                        controller: _cost),
                    _buildTextFieldColumn(
                        title: "By owner",
                        label: "",
                        width: 250,
                        controller: _byowner),
                    _buildTextFieldColumn(
                        title: "Metal Roof area",
                        label: "",
                        width: 250,
                        controller: _metalroof),
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
                        controller: _occoupied),
                    _buildTextFieldColumn(
                        title: "Disposability",
                        label: "",
                        width: 250,
                        controller: _disposability),
                    _buildTextFieldColumn(
                        title: "Quality given as a",
                        label: "",
                        width: 250,
                        controller: _quality),
                    _buildTextFieldColumn(
                        title: "Percentage",
                        label: "",
                        width: 250,
                        controller: _percentage),
                    _buildTextFieldColumn(
                        title: "Type of building",
                        label: "",
                        width: 250,
                        controller: _typeofbuilding),
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
                        controller: _floor),
                    _buildTextFieldColumn(
                        title: "Roof",
                        label: "",
                        width: 250,
                        controller: _roof),
                    _buildTextFieldColumn(
                        title: "Door",
                        label: "",
                        width: 250,
                        controller: _door),
                    _buildTextFieldColumn(
                        title: "Stair",
                        label: "",
                        width: 250,
                        controller: _stair),
                    _buildTextFieldColumn(
                        title: "Window",
                        label: "",
                        width: 250,
                        controller: _windows),
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
                        controller: _ceiling),
                    _buildTextFieldColumn(
                        title: "Wall",
                        label: "",
                        width: 250,
                        controller: _wall),
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
                        controller: _floornstory),
                    _buildTextFieldColumn(
                        title: "Bathroom",
                        label: "",
                        width: 250,
                        controller: _bathroom),
                    _buildTextFieldColumn(
                        title: "Room",
                        label: "",
                        width: 250,
                        controller: _room),
                    _buildTextFieldColumn(
                        title: "Kitchen",
                        label: "",
                        width: 250,
                        controller: _kitchen),
                    _buildTextFieldColumn(
                        title: "Dining/Living Room",
                        label: "",
                        width: 250,
                        controller: _diningnlivingroom),
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
                        controller: _store),
                    _buildTextFieldColumn(
                        title: "Total Accommodation",
                        label: "",
                        width: 250,
                        controller: _total),
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
                        controller: _water),
                    _buildTextFieldColumn(
                        title: "Electricity",
                        label: "",
                        width: 250,
                        controller: _electricity),
                    _buildTextFieldColumn(
                        title: "Sewerage",
                        label: "",
                        width: 250,
                        controller: _severage),
                    _buildTextFieldColumn(
                        title: "Telecommunications",
                        label: "",
                        width: 250,
                        controller: _telecom),
                    _buildTextFieldColumn(
                        title: "Security",
                        label: "",
                        width: 250,
                        controller: _security),
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
