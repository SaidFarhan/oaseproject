import 'package:flutter/material.dart';
import 'package:oaseproject/constans.dart';
import 'package:oaseproject/remote.dart';

class button extends StatelessWidget {
  button({
    super.key,
    required this.image,
    required this.text,
    required this.color,
    required this.ontap,
    required this.sizebutton,
    required this.fontsize,
  });
  String image;
  String text;
  Color? color;
  double? sizebutton;
  double? fontsize;
  void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          borderRadius: BorderRadius.circular(22),
          elevation: 5,
          child: Container(
            width: sizebutton,
            height: sizebutton,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              gradient: color == null
                  ? LinearGradient(colors: [
                      Color(0xff64F4F2),
                      Color(0xff0092FF),
                    ], begin: Alignment.topRight, end: Alignment.bottomLeft)
                  : null,
              color: color,
            ),
            child: Material(
              borderRadius: BorderRadius.circular(22),
              color: Colors.transparent,
              child: InkWell(
                splashColor: Color(0xff5AEEF4),
                borderRadius: BorderRadius.circular(22),
                onTap: ontap,
                child: Image.asset(
                  image,
                  cacheWidth: 60,
                  cacheHeight: 60,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          text,
          style: textstyle1.copyWith(fontSize: fontsize, fontWeight: bold),
        ),
      ],
    );
  }
}
