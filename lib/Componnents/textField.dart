import 'package:flutter/material.dart';

class textField extends StatelessWidget {
  final String hint;

  const textField({
    super.key,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: TextField(
        maxLines: null,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            hintText: hint,
            border: InputBorder.none),
      ),
    );
  }
}
