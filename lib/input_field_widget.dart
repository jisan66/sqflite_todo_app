import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final IconData icons;
  final String labelText;
  final int? maxLine;
  final FocusNode? focusNode;

  const InputTextField(
      {super.key,
      required this.icons,
      required this.labelText,
      this.maxLine,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      // focusNode: focusNode,
      maxLines: maxLine == 0 ? 1 : maxLine,
      // onTapOutside: KeyboardListener.(event) => e,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(4),
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
