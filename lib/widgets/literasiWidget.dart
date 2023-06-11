import 'package:flutter/material.dart';

class literasiWidget extends StatelessWidget {
  literasiWidget({
    required this.imageTitle,
    required this.imageContent,
    required this.textContent,
    required this.iconSize,
  });

  String imageTitle;
  String imageContent;
  String textContent;
  double iconSize;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(),
            image: DecorationImage(
              image: AssetImage("images/backgroundliterasi.png"),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 40),
              Image.asset(imageTitle, width: 200),
              SizedBox(height: 30),
              Image.asset(imageContent, width: iconSize),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Text(
                  textContent,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
