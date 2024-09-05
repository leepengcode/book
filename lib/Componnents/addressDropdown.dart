import 'package:flutter/material.dart';

class AddressDropdown extends StatefulWidget {
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
  State<AddressDropdown> createState() => _AddressDropdownState();
}

class _AddressDropdownState extends State<AddressDropdown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          overflow: TextOverflow.ellipsis,
          TextSpan(children: [
            TextSpan(
              text: widget.title,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            TextSpan(
              text: " *",
              style: TextStyle(color: Colors.red, fontSize: 15),
            )
          ]),
        ),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            hintStyle: const TextStyle(height: 2.5),
            hintText: widget.hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            contentPadding: EdgeInsets.symmetric(horizontal: 8),
            filled: true,
            fillColor: Colors.grey[200],
          ),
          value: widget.selectedVal,
          items: widget.headerList.isNotEmpty
              ? widget.headerList
                  .map((e) => DropdownMenuItem<String>(
                        child: Text(e),
                        value: e,
                      ))
                  .toList()
              : [],
          onChanged: widget.onChanged,
          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return 'Please select a value';
          //   } else {
          //     return null;
          //   }
          // },
        ),
      ],
    );
  }
}
