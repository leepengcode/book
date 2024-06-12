import 'package:book/Componnents/style.dart';
import 'package:flutter/material.dart';

class AddressDropdown extends StatelessWidget {
  final List<String> headerList;
  final String? selectedVal;
  final ValueChanged<String?> onChanged;
  final String title;
  final String? hint;

  AddressDropdown({
    required this.headerList,
    required this.selectedVal,
    required this.title,
    this.hint,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
      child: Container(
        width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: THeader(),
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                hintStyle: const TextStyle(height: 2.5),
                hintText: hint,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              value: selectedVal,
              items: headerList.isNotEmpty
                  ? headerList
                      .map((e) => DropdownMenuItem<String>(
                            child: Text(e),
                            value: e,
                          ))
                      .toList()
                  : [],
              onChanged: onChanged,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a value';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
