import 'dart:async';

import 'package:flutter/material.dart';

class digitalClock extends StatefulWidget {
  const digitalClock({super.key});

  @override
  State<digitalClock> createState() => _digitalClockState();
}

class _digitalClockState extends State<digitalClock> {
  TimeOfDay _timeOfDay = TimeOfDay.now();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeOfDay.minute != TimeOfDay.now().minute) {
        setState(() {
          _timeOfDay = TimeOfDay.now();
        });
      }
    });
  }

  Widget build(BuildContext context) {
    String _period = _timeOfDay.period == DayPeriod.am ? "AM" : "PM";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${_timeOfDay.hour}:${_timeOfDay.minute}",
          style: TextStyle(
              color: Color(0xff6C7079),
              fontSize: 28,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
