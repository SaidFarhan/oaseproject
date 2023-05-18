import 'package:flutter/material.dart';
import 'package:oaseproject/constans.dart';

class profile extends StatelessWidget {
  profile({
    required this.image,
    required this.text,
    required this.cacheimgsize,
    required this.fontsize,
  });

  String image;
  String text;
  int? cacheimgsize;
  double? fontsize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(200),
          child: Image.asset(
            image,
            cacheWidth: cacheimgsize,
            cacheHeight: cacheimgsize,
          ),
        ),
        SizedBox(height: 2),
        Text(text,
            textAlign: TextAlign.center,
            style: textstyle1.copyWith(fontSize: fontsize, fontWeight: bold)),
      ],
    );
  }
}
