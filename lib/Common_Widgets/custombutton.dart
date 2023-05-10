import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  GestureTapCallback ? onPressed;

  CustomButton({
    this.onPressed
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed, 
    child: Text("Submit")
    );
  }
}