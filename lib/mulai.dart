import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:oaseproject/constans.dart';

class mulaiPage extends StatelessWidget {
  const mulaiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: ConvexAppBar(
          style: TabStyle.reactCircle,
/*           color: Color(0xff2AA4FF), */
          // backgroundColor: Colors.white,
          height: 60,
          items: [
            TabItem(icon: Icons.settings),
            TabItem(icon: Icons.lock),
            TabItem(icon: Icons.logout),
          ],
          onTap: (int i) => print("click index=$i"),
        ),
        body: Container(
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
                        style: textstyle1.copyWith(
                            fontSize: 46, fontWeight: bold)),
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
        ));
  }
}
