import 'package:flutter/material.dart';
import 'package:oaseproject/constans.dart';
import 'package:oaseproject/menu.dart';
import 'package:oaseproject/signupPage.dart';
import 'package:oaseproject/utils/common.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showpass = true;
  bool _signInLoading = false;
  bool _signUpLoading = false;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String text = "Masukkan password";

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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "masukkan password";
                          }
                          return null;
                        },
                        controller: _passwordController,
                        obscureText: showpass,
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
                          suffixIcon: IconButton(
                            icon: showpass
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                showpass = !showpass;
                              });
                            },
                          ),
                        ),
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
                            _signInLoading = true;
                          });
                          try {
                            await client.auth.signInWithPassword(
                              email: _usernameController.text,
                              password: _usernameController.text,
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  'login gagal, periksa kembali username dan password anda!'),
                              backgroundColor: Colors.redAccent,
                            ));
                          }
                        },
                        child: Text(
                          "Masuk",
                          style: bluetextstyle.copyWith(
                              fontSize: 16, fontWeight: bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 11),
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
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "images/googlelogo.png",
                              height: 22,
                              width: 22,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Masuk Menggunakan Google",
                              style: bluetextstyle.copyWith(
                                fontSize: 13,
                                fontWeight: bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 11),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Belum punya akun?",
                          style: textstyle1.copyWith(
                            fontSize: 12,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return signupPage();
                              }),
                            );
                          },
                          child: Text(
                            "Buat akun.",
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
