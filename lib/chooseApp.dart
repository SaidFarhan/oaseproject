import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_button/group_button.dart';
import 'package:oaseproject/constans.dart';
import 'package:oaseproject/controller/appselec_controller.dart';
import 'package:oaseproject/controller/lockAppController.dart';
import 'package:oaseproject/widgets/buttonAddApp.dart';
import 'package:selectable_box/selectable_box.dart';

class chooseApp extends ConsumerWidget {
  const chooseApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lockappstate = ref.watch(getinstallerAppProvider);
    final pilihapp = ref.watch(lockAppProvider);
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        "Pilih aplikasi Yang Anda Inginkan",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
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
                            Flexible(
                              child: SelectableBox(
                                height: 60,
                                width: 65,
                                onTap: () {
                                  if (app[i].isselected == true) {
                                    pilihapp.unselectedapp(app[i]);
                                  } else {
                                    pilihapp.selectedapp(app[i]);
                                  }
                                },
                                isSelected: app[i].isselected,
                                child: buttonAddApp(
                                  ontap: () {},
                                  icon: app[i].appicon!.icon,
                                ),
                              ),
                            ),
                            Text(
                              app[i].appname?.appName ?? "",
                              textAlign: TextAlign.center,
                              maxLines: 2,
                            )
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
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  // show loading
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                  ref
                      .read(AppSelecProvider.notifier)
                      .insert_dataapp(pilihapp.selectedApp)
                      .then((_) {
                    Navigator.pop(context);
                    ref.refresh(AppSelecProvider);
                    Navigator.pop(context);
                  }).onError((error, stackTrace) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("${error.toString()}"),
                      backgroundColor: Colors.redAccent,
                    ));
                  });
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: Colors.white,
                  ),
                  child: Image.asset("images/centang.png"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
