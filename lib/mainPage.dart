import 'dart:convert';
import 'dart:typed_data';

import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oaseproject/chooseApp.dart';
import 'package:oaseproject/controller/appselec_controller.dart';
import 'package:oaseproject/controller/lockAppController.dart';
import 'package:oaseproject/repositories/appselec.dart';
import 'package:oaseproject/widgets/buttonAddApp.dart';

import 'constans.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lockupselect = ref.watch(AppSelecProvider);
    final LockAppState = ref.watch(lockAppProvider);

    return RefreshIndicator(
      onRefresh: () {
        ref.refresh(appSelecProviders);
        return Future.value();
      },
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 30, right: 30),
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
              lockupselect.when(
                data: (app) {
                  print(app.length);
                  if (app.isEmpty) {
                    return Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 360,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.3),
                        ),
                      ),
                    );
                  }
                  return SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width,
                          height: 350,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white.withOpacity(0.3),
                          ),
                          child: Center(
                            child: GridView.builder(
                              itemCount: app.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                              ),
                              itemBuilder: (context, i) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Flexible(
                                          child: Container(
                                            height: 60,
                                            width: 65,
                                            child: buttonAddApp(
                                              ontap: () {
                                                DeviceApps.openApp(
                                                    app[i].app_packagename);
                                              },
                                              icon:
                                                  base64Decode(app[i].app_icon),
                                            ),
                                          ),
                                        ),
                                        // Text(
                                        //   app[i].app_name,
                                        //   textAlign: TextAlign.center,
                                        //   maxLines: 2,
                                        // ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                error: (err, Stack) {
                  return Text("Error $err");
                },
                loading: () => Center(child: const CircularProgressIndicator()),
              ),
              Column(
                children: [
                  SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "User 10101",
                        style:
                            textstyle1.copyWith(fontSize: 46, fontWeight: bold),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                right: 3,
                bottom: 105,
                child: Container(
                  child: !LockAppState.lockbtn
                      ? null
                      : ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              Color(0xff79D7FB),
                            ),
                            shape: MaterialStatePropertyAll<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          onPressed: () {
                            ref.read(lockAppProvider).selectedApp.clear();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return chooseApp();
                              }),
                            );
                          },
                          child: Row(
                            children: [
                              Image.asset("images/tambah.png"),
                              SizedBox(width: 10),
                              Text("tambah"),
                            ],
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
