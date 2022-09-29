import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color backgroundColor;
  final Color textColor;
  const MyButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.backgroundColor = Colors.blue,
      this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(backgroundColor)),
        onPressed: onPressed,
        child: Text(text, style: TextStyle(color: textColor)));
  }
}
