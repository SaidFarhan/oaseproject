import 'package:flutter/material.dart';

import 'constans.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff64F4F2),
            Color(0xff0092FF),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 200),
                Text("HI SAID",
                    style: textstyle1.copyWith(fontSize: 46, fontWeight: bold)),
              ],
            ),
            Container(
              height: 60,
              width: 60,
              color: Colors.white.withOpacity(0.5),
            )
          ],
        ),
      ),
    );
  }
}
