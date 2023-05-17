import 'package:flutter/material.dart';
import 'package:oaseproject/constans.dart';
import 'package:oaseproject/loading_page.dart';
import 'package:oaseproject/widgets/buttonMenu.dart';
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Image.asset(
                    "images/person.jpg",
                    cacheWidth: 129,
                    cacheHeight: 129,
                  ),
                ),
                SizedBox(height: 2),
                Text("Said Farhan",
                    textAlign: TextAlign.center,
                    style: textstyle1.copyWith(fontSize: 26, fontWeight: bold)),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
