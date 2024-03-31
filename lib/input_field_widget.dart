import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final IconData icons;
  final String labelText;
  final int? maxLine;
  final FocusNode? focusNode;
  final TextEditingController textEditingController;

  const InputTextField(
      {super.key,
      required this.icons,
      required this.labelText,
      this.maxLine,
      this.focusNode,
      required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      // focusNode: focusNode,
      maxLines: maxLine == 0 ? 1 : maxLine,
      // onTapOutside: KeyboardListener.(event) => e,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(4),
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.blue),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: Colors.red)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: Colors.blueAccent)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: Colors.blueAccent)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: Colors.blueAccent)),
          prefixIcon: Icon(
            icons,
            color: Colors.blue,
          )),
    );
  }
}
