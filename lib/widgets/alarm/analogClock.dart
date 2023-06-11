import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';

class analogClock extends StatelessWidget {
  const analogClock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 251,
      width: 251,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/backgroundClock.png"),
        ),
      ),
      child: Container(
        child: AnalogClock(
          dialColor: null,
          markingColor: null,
          hourNumberColor: null,
          secondHandColor: Color(0xff0D8AFC),
          minuteHandColor: Color(0xff0D8AFC),
          hourHandColor: Color(0xff0D8AFC),
          centerPointColor: Color(0xff0D8AFC),
          secondHandWidthFactor: 1.0,
          secondHandLengthFactor: 0.5,
          hourHandLengthFactor: 0.5,
          hourHandWidthFactor: 0.7,
          minuteHandLengthFactor: 0.5,
        ),
      ),
    );
  }
}
