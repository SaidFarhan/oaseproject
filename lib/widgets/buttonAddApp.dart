import 'package:flutter/material.dart';

class buttonAddApp extends StatelessWidget {
  buttonAddApp({required this.ontap, required this.icon});
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
