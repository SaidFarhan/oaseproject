import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oaseproject/controller/lockAppController.dart';
import 'package:oaseproject/utils/common.dart';
import 'package:shared_preferences/shared_preferences.dart';

class lockApp extends ConsumerStatefulWidget {
  const lockApp({super.key});

  @override
  ConsumerState<lockApp> createState() => _lockAppState();
}

class _lockAppState extends ConsumerState<lockApp> {
  final _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool _signLoading = false;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final LockAppState = ref.watch(lockAppProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 30, right: 30),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color(0xff64F4F2),
              Color(0xff0092FF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: Column(
            children: [
              SizedBox(height: 150),
              Text(
                "Masukkan Sandi",
                style: GoogleFonts.poppins(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 100),
              Form(
                key: _formkey,
                child: TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Masukkan Password";
                    }
                    return null;
                  },
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Sandi Akun",
                    labelStyle: GoogleFonts.poppins(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white),
                  shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100))),
                ),
                onPressed: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  final isValid = _formkey.currentState?.validate();
                  if (isValid != true) {
                    return;
                  }
                  setState(() {
                    _signLoading = true;
                  });

                  final String? oldpass = prefs.getString('password');

                  if (oldpass == _passwordController.text) {
                    setState(() {
                      _signLoading = false;
                    });
                    LockAppState.afterLock();
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Passwod Salah'),
                      backgroundColor: Colors.redAccent,
                    ));
                    setState(() {
                      _signLoading = false;
                    });
                    print(oldpass);
                    print(_passwordController.text);
                  }
                  // print(_passwordController.text);
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: _signLoading
                          ? CircularProgressIndicator()
                          : Text(
                              "OK",
                              style: GoogleFonts.poppins(
                                color: Color(0xff2AA4FF),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
