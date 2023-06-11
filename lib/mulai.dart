import 'dart:ffi';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oaseproject/closeApp.dart';
import 'package:oaseproject/controller/lockAppController.dart';
import 'package:oaseproject/lockApp.dart';
// import 'package:oaseproject/constans.dart';
import 'package:oaseproject/mainPage.dart';
import 'settingPage.dart';

class mulaiPage extends ConsumerStatefulWidget {
  const mulaiPage({super.key});

  @override
  ConsumerState<mulaiPage> createState() => _mulaiPageState();
}

class _mulaiPageState extends ConsumerState<mulaiPage> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    final LockAppState = ref.watch(lockAppProvider);

    return Scaffold(
      bottomNavigationBar: !LockAppState.lockbtn
          ? null
          : ConvexAppBar(
              style: TabStyle.reactCircle,
/*           color: Color(0xff2AA4FF), */
              // backgroundColor: Colors.white,
              height: 60,
              items: [
                TabItem(icon: Icons.settings_outlined),
                TabItem(
                  icon: InkWell(
                    onDoubleTap: () {
                      ref.read(lockAppProvider).afterLock();
                    },
                    // onTap: () {
                    //   setState(() {
                    //     index = 1;
                    //   });
                    // },
                    child: Icon(
                      LockAppState.lockbtn
                          ? Icons.lock_open
                          : Icons.lock_outlined,
                      color: Color(0xff2AA4FF),
                    ),
                  ),
                ),
                TabItem(icon: Icons.logout),
              ],
              initialActiveIndex: index,
              onTap: (int i) {
                setState(() {
                  index = i;
                });
              }),
      body: IndexedStack(
        index: index,
        children: [
          settingPage(),
          MainPage(),
          closeApp(),
        ],
      ),
      floatingActionButton: !LockAppState.lockbtn
          ? InkWell(
              onLongPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return lockApp();
                  }),
                );
                // ref.read(lockAppProvider).afterLock();
              },
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.lock_outline,
                  color: Color(0xff2196F3),
                ),
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
