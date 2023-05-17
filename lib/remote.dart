import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                        child: Image.asset(
                          "images/power.png",
                          cacheWidth: 50,
                          cacheHeight: 50,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Kunci Ponsel",
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
                        // onTap: () {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(builder: (context) {
                        //       return const LoginPage();
                        //     }),
                        //   );
                        // },
                        child: Image.asset(
                          "images/riwayat.png",
                          cacheWidth: 50,
                          cacheHeight: 50,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Riwayat",
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
