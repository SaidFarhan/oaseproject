import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:oaseproject/constans.dart';
import 'package:oaseproject/mainPage.dart';
import 'settingPage.dart';

class mulaiPage extends StatefulWidget {
  const mulaiPage({super.key});

  @override
  State<mulaiPage> createState() => _mulaiPageState();
}

class _mulaiPageState extends State<mulaiPage> {
  // bool _signInLoading = false;
  // bool _signUpLoading = false;
  // final _usernameController = TextEditingController();
  // final _passwordController = TextEditingController();
  int index = 1;

  // @override
  // void dispose() {
  //   _usernameController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
          style: TabStyle.reactCircle,
/*           color: Color(0xff2AA4FF), */
          // backgroundColor: Colors.white,
          height: 60,
          items: [
            TabItem(icon: Icons.settings),
            TabItem(icon: Icons.lock),
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
        ],
      ),
    );
  }
}
