import 'package:flutter/material.dart';
import 'package:oaseproject/constans.dart';
import 'package:oaseproject/loading_page.dart';
import 'package:oaseproject/login_page.dart';
import 'package:oaseproject/mulai.dart';
import 'package:oaseproject/widgets/buttonMenu.dart';
import 'package:oaseproject/widgets/profile.dart';
import 'remote.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xff64F4F2),
            Color(0xff0092FF),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 31),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                profile(
                    image: "images/profile.png",
                    text: "Said Farhan",
                    cacheimgsize: 129,
                    fontsize: 26.62),
                SizedBox(height: 50),
                button(
                  image: "images/signal.png",
                  text: "Remote",
                  color: Colors.white,
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return remote();
                      }),
                    );
                  },
                  sizebutton: 120,
                  fontsize: 22.62,
                ),
                SizedBox(height: 40),
                button(
                  image: "images/remote.png",
                  text: "Mulai",
                  color: Colors.white,
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return loadingPage();
                      }),
                    );
                  },
                  sizebutton: 120,
                  fontsize: 22.62,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
