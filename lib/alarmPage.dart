import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oaseproject/widgets/alarm/analogClock.dart';
import 'package:oaseproject/widgets/alarm/avtiveButton.dart';
import 'package:oaseproject/widgets/alarm/digitalClock.dart';

class alarmPage extends StatefulWidget {
  alarmPage({super.key});

  @override
  State<alarmPage> createState() => _alarmPageState();
}

class _alarmPageState extends State<alarmPage> {
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
            child: Column(
              children: [
                SizedBox(height: 30),
                Text(
                  "Timer",
                  style: GoogleFonts.poppins(
                      fontSize: 44,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 15),
                analogClock(),
                // SizedBox(height: 10),
                Center(
                  child: Container(
                    width: 157.16,
                    height: 66.49,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/digitalBackground.png"))),
                    child: digitalClock(),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.all(18),
                  width: 320,
                  height: 96.24,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xffF2F4F8),
                      border: Border.all(
                        color: Color(0xff64CBF4),
                        width: 2,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "8:00",
                            style: TextStyle(
                              color: Color(0xff6C7079),
                              fontSize: 28,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Waktunya Istirahat",
                            style: TextStyle(
                                color: Color(0xff0D89FC),
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      activeButton(),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          width: 120.58,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white,
                              border: Border.all(
                                color: Color(0xff64CBF4),
                                width: 2,
                              )),
                          child: Center(
                              child: Text(
                            "Kunci Perangkat",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff6C7079)),
                          )),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          width: 120.58,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white,
                              border: Border.all(
                                color: Color(0xff64CBF4),
                                width: 2,
                              )),
                          child: Center(
                              child: Text(
                            "Alarm",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff6C7079)),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Colors.white,
                        border: Border.all(
                          color: Color(0xff64CBF4),
                          width: 2,
                        )),
                    child: Image.asset("images/centang.png"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
