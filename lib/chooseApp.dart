import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_button/group_button.dart';
import 'package:oaseproject/constans.dart';
import 'package:oaseproject/controller/lockAppController.dart';
import 'package:oaseproject/widgets/buttonAddApp.dart';

class chooseApp extends ConsumerWidget {
  const chooseApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lockappstate = ref.watch(getinstallerAppProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.5),
                ),
                width: 300,
                height: 478,
                child: lockappstate.when(
                  data: (app) {
                    return GridView.builder(
                      itemCount: app.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (context, i) {
                        return Column(
                          children: [
                            buttonAddApp(
                                ontap: () {}, icon: "images/tambah.png"),
                            Text(app[i].appName)
                          ],
                        );
                      },
                    );
                  },
                  error: (err, Stack) {
                    return Text("Error $err");
                  },
                  loading: () => const CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
