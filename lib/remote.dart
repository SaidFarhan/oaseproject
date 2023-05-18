import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oaseproject/widgets/buttonMenu.dart';
import 'constans.dart';

class remote extends StatelessWidget {
  const remote({super.key});

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
                  "images/signalwhite.png",
                  cacheWidth: 126,
                  cacheHeight: 126,
                ),
                SizedBox(height: 15),
                Text("Kontrol Jarak Jauh",
                    textAlign: TextAlign.center,
                    style: textstyle1.copyWith(fontSize: 32, fontWeight: bold)),
                SizedBox(height: 50),
                button(
                    image: "images/power.png",
                    text: "Kunci Ponsel",
                    color: Colors.white,
                    ontap: () {
                      AwesomeDialog(
                        context: context,
                        barrierColor: Colors.transparent,
                        dialogType: DialogType.success,
                        btnOkColor: Color(0xff0092ff),
                        transitionAnimationDuration: Duration(seconds: 1),
                        animType: AnimType.bottomSlide,
                        showCloseIcon: true,
                        title: "Sukses",
                        desc: "Berhasil mengunci ponsel anda",
                        btnOkOnPress: () {
                          Navigator.pop(context);
                        },
                      ).show();
                    },
                    sizebutton: 120,
                    fontsize: 22.62),
                SizedBox(height: 30),
                button(
                    image: "images/riwayat.png",
                    text: "Riwayat",
                    color: Colors.white,
                    ontap: () {},
                    sizebutton: 120,
                    fontsize: 22.62),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
