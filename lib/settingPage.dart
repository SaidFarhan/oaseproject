import 'package:flutter/material.dart';
import 'package:oaseproject/alarmPage.dart';
import 'package:oaseproject/gantisandi.dart';
import 'package:oaseproject/login_page.dart';
import 'package:oaseproject/utils/common.dart';
import 'package:oaseproject/widgets/buttonMenu.dart';
import 'package:oaseproject/widgets/profile.dart';

import 'constans.dart';

class settingPage extends StatelessWidget {
  const settingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
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
                  SizedBox(height: 160),
                  Text("Pengaturan",
                      style:
                          textstyle1.copyWith(fontSize: 46, fontWeight: bold)),
                ],
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    // SizedBox(height: 26),
                    profile(
                      image: "images/profile.png",
                      text: "Said Farhan",
                      cacheimgsize: 83,
                      fontsize: 17.07,
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        button(
                          image: "images/changepass.png",
                          text: "Ganti Sandi",
                          color: null,
                          ontap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return gantisandi();
                              }),
                            );
                          },
                          sizebutton: 80,
                          fontsize: 12.24,
                        ),
                        SizedBox(width: 60),
                        button(
                          image: "images/changeacc.png",
                          text: "Ganti Akun",
                          color: null,
                          ontap: () async {
                            await client.auth.signOut();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return LoginPage();
                              }),
                            );
                          },
                          sizebutton: 80,
                          fontsize: 12.24,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            button(
                              image: "images/timer.png",
                              text: "Timer",
                              color: null,
                              ontap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return alarmPage();
                                  }),
                                );
                              },
                              sizebutton: 80,
                              fontsize: 12.24,
                            ),
                            SizedBox(width: 60),
                            button(
                              image: "images/setlainnya.png",
                              text: "Lainnya",
                              color: null,
                              ontap: () {},
                              sizebutton: 80,
                              fontsize: 12.24,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.5),
                ),
                height: 430,
                width: 308,
              )
            ],
          ),
        ),
      ),
    );
  }
}
