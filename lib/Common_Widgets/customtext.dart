import 'package:flutter/material.dart';

class CustomText extends StatefulWidget {
 String ? text;
 double ? size;
 bool ? underline;
 CustomText({
   this.text,
   this.size,
   this.underline
 });

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      "${widget.text}",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: widget.size,
        decoration: widget.underline == true ? TextDecoration.underline : TextDecoration.none
      ),
      );
  }
}