import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final IconData icons;
  final String labelText;
  const InputTextField({super.key, required this.icons, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        labelText: labelText,
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: Colors.red)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: Colors.blueAccent)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: Colors.blueAccent)),
          prefixIcon: Icon(icons)),
    );
  }
}
