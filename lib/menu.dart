import 'package:flutter/material.dart';
import 'package:oaseproject/constans.dart';
import 'package:oaseproject/loading_page.dart';
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
                Image.asset(
                  "images/profile.png",
                  cacheWidth: 129,
                  cacheHeight: 129,
                ),
                SizedBox(height: 2),
                Text("Said Farhan",
                    textAlign: TextAlign.center,
                    style: textstyle1.copyWith(fontSize: 26, fontWeight: bold)),
                SizedBox(height: 50),
                Material(
                  borderRadius: BorderRadius.circular(22),
                  elevation: 5,
                  child: Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Colors.white,
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(22),
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Color(0xff5AEEF4),
                        borderRadius: BorderRadius.circular(22),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const remote();
                            }),
                          );
                        },
                        child: Image.asset(
                          "images/signal.png",
                          cacheWidth: 60,
                          cacheHeight: 60,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  "Remote",
                  style: textstyle1.copyWith(fontSize: 23, fontWeight: bold),
                ),
                SizedBox(height: 30),
                Material(
                  borderRadius: BorderRadius.circular(22),
                  elevation: 5,
                  child: Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Colors.white,
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(22),
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Color(0xff5AEEF4),
                        borderRadius: BorderRadius.circular(22),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return loadingPage();
                            }),
                          );
                        },
                        child: Image.asset(
                          "images/remote.png",
                          cacheWidth: 60,
                          cacheHeight: 60,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  "Mulai",
                  style: textstyle1.copyWith(fontSize: 23, fontWeight: bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
