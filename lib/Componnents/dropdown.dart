import 'package:book/style.dart';
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
          children: [
            Text(
              title,
              style: THeader(),
            ),
            const SizedBox(
              height: 10,
            ),
            DropdownButtonFormField<String>(
              alignment: Alignment.center,
              elevation: 16,
              decoration: InputDecoration(
                  hintText: hint,
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 8)),
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
