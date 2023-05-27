import 'package:flutter/material.dart';
import 'package:oaseproject/chooseApp.dart';
import 'package:oaseproject/controller/lockAppController.dart';
import 'package:oaseproject/widgets/buttonAddApp.dart';

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
      child: Stack(
        children: [
          // color: Colors.white,
          Expanded(
            child: Center(
              child: buttonAddApp2(
                icon: "images/tambah.png",
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return chooseApp();
                    }),
                  );
                },
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HI SAID",
                      style:
                          textstyle1.copyWith(fontSize: 46, fontWeight: bold)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
