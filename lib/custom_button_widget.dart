import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double height;
  const CustomButton({super.key, required this.text, required this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25)
          ),
          width: double.infinity,
          height: height,
          child: MaterialButton(
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)
            ),
            elevation: 4,
            focusColor: Colors.purple,
            disabledColor: Colors.red,onPressed: (){},color:Colors.blueAccent,child: Text(text),)),
    );
  }
}
