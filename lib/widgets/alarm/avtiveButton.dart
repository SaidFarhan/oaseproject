import 'package:flutter/material.dart';

class activeButton extends StatefulWidget {
  const activeButton({super.key});

  @override
  State<activeButton> createState() => _activeButtonState();
}

class _activeButtonState extends State<activeButton> {
  bool isOn = false;
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.7,
      child: Switch(
          value: isOn,
          onChanged: (value) {
            setState(() {
              isOn = value;
            });
          }),
    );
  }
}
