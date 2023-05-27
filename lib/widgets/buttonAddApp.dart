import 'dart:typed_data';

import 'package:flutter/material.dart';

class buttonAddApp extends StatelessWidget {
  buttonAddApp({required this.ontap, required this.icon});
  void Function() ontap;
  Uint8List icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.white,
            ),
            child: InkWell(
              splashColor: Color(0xff5AEEF4),
              borderRadius: BorderRadius.circular(22),
              onTap: ontap,
              child: Image.memory(icon),
            ),
            height: 60,
            width: 60,
            // color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class buttonAddApp2 extends StatelessWidget {
  buttonAddApp2({required this.ontap, required this.icon});
  void Function() ontap;
  String icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.white.withOpacity(0.5),
            ),
            child: InkWell(
              splashColor: Color(0xff5AEEF4),
              borderRadius: BorderRadius.circular(22),
              onTap: ontap,
              child: Image.asset(icon),
            ),
            height: 60,
            width: 60,
            // color: Colors.white,
          ),
        ),
      ],
    );
  }
}
