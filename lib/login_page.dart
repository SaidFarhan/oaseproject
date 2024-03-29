import 'package:flutter/material.dart';
import 'package:oaseproject/constans.dart';
import 'package:oaseproject/menu.dart';
import 'package:oaseproject/signupPage.dart';
import 'package:oaseproject/utils/common.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showpass = true;
  bool _signInLoading = false;
  // bool _signUpLoading = false;
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'masukkan password';
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
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
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
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
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
                              password: _passwordController.text,
                            );
                            await prefs.setString(
                                'password', _passwordController.text);
                            setState(() {
                              _signInLoading = false;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return Menu();
                              }),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('login gagal'),
                              backgroundColor: Colors.redAccent,
                            ));
                            setState(() {
                              _signInLoading = false;
                            });
                          }
                          // Navigator.push( context, MaterialPageRoute(builder: (context) { return const Menu(); }), );
                        },
                        child: _signInLoading
                            ? CircularProgressIndicator()
                            : Text(
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
