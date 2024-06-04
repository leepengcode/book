import 'package:flutter/material.dart';

class textField extends StatelessWidget {
  final String hint;

  const textField({
    super.key,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
        child: Container(
          width: 550,
          child: TextField(
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ));
  }
}
