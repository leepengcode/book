import 'package:book/Componnents/style.dart';
import 'package:flutter/material.dart';

class HeaderDropdown extends StatelessWidget {
  final List headerList;
  final String selectedVal;
  final ValueChanged<String?> onChanged;
  final String title;
  final String? hint;

  HeaderDropdown({
    required this.headerList,
    required this.selectedVal,
    required this.title,
    required this.hint,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
      child: Container(
        width: 550,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
            DropdownButtonFormField<String>(
              alignment: Alignment.center,
              elevation: 16,
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
                filled: true,
                fillColor: Colors.grey[200], // Replace with your desired color
              ),
              value: selectedVal,
              items: headerList
                  .map((e) => DropdownMenuItem<String>(
                        child: Text(e),
                        value: e,
                      ))
                  .toList(),
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
