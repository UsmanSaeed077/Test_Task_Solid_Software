import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color backgroundColor = Colors.white;
  Color textColor = Colors.black;

  void changeBackgroundColor() {
    setState(() {
      // generate random color
      backgroundColor = Color.fromARGB(
        255,
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
      );

      // this code is to check luminance of background color
      final double luminance = 0.2126 * backgroundColor.red +
          0.7152 * backgroundColor.green +
          0.0722 * backgroundColor.blue;

      // then assign color to text, based on luminance
      textColor = luminance > 100 ? Colors.black : Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeBackgroundColor,
      onLongPress: () {
        setState(() {
          backgroundColor = Colors.white;
        });
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Random Color Generator',
            style: TextStyle(color: textColor),
          ),
          backgroundColor: backgroundColor,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Hey There",
                style: TextStyle(
                  color: textColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Type anywhere on the screen to generate random color",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16.0,
                  ),
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
