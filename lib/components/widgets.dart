import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String text;
  final Color color;
  final Function() onpress;
  const Buttons({
    required this.color,
    required this.text,
    required this.onpress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onpress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(text),
        ),
      ),
    );
  }
}
