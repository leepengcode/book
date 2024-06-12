import 'package:book/Componnents/style.dart';
import 'package:book/Componnents/textField.dart';
import 'package:flutter/material.dart';

class PropertyInfo_Widget extends StatelessWidget {
  const PropertyInfo_Widget({
    super.key,
  });

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Plot Nº",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "North",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter North",
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "South",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter South",
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "East",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter East",
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "West",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter West",
                  ),
                ],
              ),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Land title deed Nº",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Land Size(by title deed)",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Land Size(by Measurement)",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Type of land : ",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Occupant : ",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  )
                ],
              ),
            ],
          ),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Building Size",
                    style: THeader(),
                  ),
                  textField(
                    hint: "Enter",
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Building Size",
                    style: THeader(),
                  ),
                  textField(
                    hint: "Enter",
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Building",
                    style: THeader(),
                  ),
                  textField(
                    hint: "",
                  ),
                ],
              ),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Type of Building ",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Age of Building  ",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cost of Construction",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "By owner ",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Metal Roof area ",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Occupied or Vacant",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Disposability",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Quality given as a",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Percentage",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Type of building ",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  )
                ],
              ),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Floor",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Roof ",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Door",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Stair",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Window",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ceiling",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Wall",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  ),
                ],
              ),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Floor/Story ",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bathroom",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Room",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kitchen ",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dining/Living Room ",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Storage Room ",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Accommodation",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  ),
                ],
              ),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Water",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Electricity",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sewerage",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Telecommunications",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Security",
                    style: THeader(),
                  ),
                  const textField(
                    hint: "Enter",
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
