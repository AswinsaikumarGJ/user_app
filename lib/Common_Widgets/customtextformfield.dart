import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
   double ? h;
   double ? w;
   String ? hintText;
   TextEditingController ? controller;
   CustomTextFormField({
    this.h,
    this.w,
    this.hintText,
    this.controller
   });
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.h,
      width: widget.w,
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            )
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue
            )
          ) 
        ),
      ),
    );
  }
}