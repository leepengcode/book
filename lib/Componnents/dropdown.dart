import 'package:book/Componnents/style.dart';
import 'package:flutter/material.dart';

typedef OnChangeCallback = void Function(dynamic value);

class HeaderDropdown extends StatefulWidget {
  final List headerList;
  final String selectedVal;
  final OnChangeCallback? onChanged;
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
  State<HeaderDropdown> createState() => _HeaderDropdownState();
}

class _HeaderDropdownState extends State<HeaderDropdown> {
  var selectedVal;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
      child: SizedBox(
        width: 550,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Text(
                  widget.title,
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
                hintText: widget.hint,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
                filled: true,
                fillColor: Colors.grey[200], // Replace with your desired color
              ),
              value: selectedVal,
              items: widget.headerList
                  .map((e) => DropdownMenuItem<String>(
                        child: Text(e),
                        value: e,
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  print("object! ${value}\n");
                  widget.onChanged!(value);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderDropdown1 extends StatefulWidget {
  final List headerList;
  final String selectedVal;
  final OnChangeCallback onChanged;
  final String title;
  final String? hint;

  HeaderDropdown1({
    required this.headerList,
    required this.selectedVal,
    required this.title,
    required this.hint,
    required this.onChanged,
  });

  @override
  State<HeaderDropdown1> createState() => _HeaderDropdownState1();
}

class _HeaderDropdownState1 extends State<HeaderDropdown1> {
  var selectedVal;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
      child: SizedBox(
        width: 550,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Text(
                  widget.title,
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
                hintText: widget.hint,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
                filled: true,
                fillColor: Colors.grey[200], // Replace with your desired color
              ),
              value: selectedVal,
              items: widget.headerList
                  .map((e) => DropdownMenuItem<String>(
                        child: Text(e),
                        value: e,
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  print("object! ${value}\n");
                  widget.onChanged(value);
                });
              },
              onSaved: (newValue) {
                setState(() {
                  widget.onChanged(newValue);
                });
              },
              onTap: () {
                widget.onChanged(selectedVal);
              },
            ),
          ],
        ),
      ),
    );
  }
}
