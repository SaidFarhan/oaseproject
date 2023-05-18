import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:oaseproject/login_page.dart';

import 'constans.dart';

class gantisandi extends StatelessWidget {
  const gantisandi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
          )),
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 31),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Ganti Sandi",
                    textAlign: TextAlign.center,
                    style: textstyle1.copyWith(fontSize: 34, fontWeight: bold),
                  ),
                  Image.asset(
                    "images/sandilogo.png",
                    cacheWidth: 123,
                    cacheHeight: 123,
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 310,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48),
                      color: textcolor2.withOpacity(0.2),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Nama",
                        hintStyle: textstyle1.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                          color: textcolor2.withOpacity(0.6),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: 310,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48),
                      color: textcolor2.withOpacity(0.2),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Sandi",
                        hintStyle: textstyle1.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                          color: textcolor2.withOpacity(0.6),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: 310,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48),
                      color: textcolor2.withOpacity(0.2),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Masukkan Ulang Sandi",
                        hintStyle: textstyle1.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                          color: textcolor2.withOpacity(0.6),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: 310,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48),
                      color: textcolor2.withOpacity(0.2),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: double.infinity,
                    height: 51,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: textcolor,
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(48))),
                      ),
                      onPressed: () {
                        AwesomeDialog(
                          context: context,
                          barrierColor: Colors.transparent,
                          dialogType: DialogType.success,
                          btnOkColor: Color(0xff0092ff),
                          transitionAnimationDuration: Duration(seconds: 1),
                          animType: AnimType.bottomSlide,
                          showCloseIcon: true,
                          title: "Sukses",
                          desc: "Berhasil Mengganti Sandi",
                          btnOkOnPress: () {
                            Navigator.pop(context);
                          },
                        ).show();
                      },
                      child: Text(
                        "Simpan",
                        style: bluetextstyle.copyWith(
                            fontSize: 16, fontWeight: bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
