import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:oaseproject/login_page.dart';
import 'package:oaseproject/utils/common.dart';

import 'constans.dart';

class signupPage extends StatefulWidget {
  const signupPage({super.key});

  @override
  State<signupPage> createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  bool _signUpLoading = false;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "images/image1.png",
                      cacheWidth: 121,
                      cacheHeight: 120,
                    ),
                    SizedBox(height: 20),
                    Text("Device For Child",
                        textAlign: TextAlign.center,
                        style: whitetextstyle.copyWith(
                            fontSize: 34, fontWeight: bold)),
                    SizedBox(height: 38),
                    Container(
                      width: 310,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(48),
                        color: textcolor2.withOpacity(0.2),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Nama",
                          hintStyle: textstyle1.copyWith(
                            fontSize: 16,
                            fontWeight: bold,
                            color: textcolor2.withOpacity(0.6),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 17),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'masukkan nama';
                          }
                          return null;
                        },
                        controller: _usernameController,
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: 310,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(48),
                        color: textcolor2.withOpacity(0.2),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Sandi",
                          hintStyle: textstyle1.copyWith(
                            fontSize: 16,
                            fontWeight: bold,
                            color: textcolor2.withOpacity(0.6),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 17),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'masukkan password';
                          }
                          return null;
                        },
                        controller: _passwordController,
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: 310,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(48),
                        color: textcolor2.withOpacity(0.2),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Masukkan Ulang Sandi",
                          hintStyle: textstyle1.copyWith(
                            fontSize: 16,
                            fontWeight: bold,
                            color: textcolor2.withOpacity(0.6),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 17),
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
                        onPressed: () async {
                          final isValid = _formKey.currentState?.validate();
                          if (isValid != true) {
                            return;
                          }
                          setState(() {
                            _signUpLoading = true;
                          });
                          // print(_passwordController.text);
                          try {
                            await client.auth.signUp(
                              email: _usernameController.text,
                              password: _passwordController.text,
                            );
                            AwesomeDialog(
                              context: context,
                              barrierColor: Colors.transparent,
                              dialogType: DialogType.success,
                              btnOkColor: Color(0xff0092ff),
                              transitionAnimationDuration: Duration(seconds: 1),
                              animType: AnimType.bottomSlide,
                              showCloseIcon: true,
                              title: "Sukses",
                              desc:
                                  "Akun berhasil dibuat, silahkan cek Email untuk verifikasi akun anda!",
                              btnOkOnPress: () {
                                setState(() {
                                  _signUpLoading = false;
                                });
                                Navigator.pop(context);
                              },
                            ).show();
                          } catch (e) {
                            // print(e.toString());
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Buat akun gagal'),
                              backgroundColor: Colors.redAccent,
                            ));
                          }
                          setState(() {
                            _signUpLoading = false;
                          });
                        },
                        child: _signUpLoading
                            ? CircularProgressIndicator()
                            : Text(
                                "Buat Akun",
                                style: bluetextstyle.copyWith(
                                    fontSize: 16, fontWeight: bold),
                              ),
                      ),
                    ),
                    SizedBox(height: 11),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sudah punya akun?",
                          style: textstyle1.copyWith(
                            fontSize: 12,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return LoginPage();
                              }),
                            );
                          },
                          child: Text(
                            "Masuk.",
                            style: textstylelink.copyWith(fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
