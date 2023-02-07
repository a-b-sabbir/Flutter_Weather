import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Vx.purple300,
          title: 'About'.text.color(Colors.black).make(),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            10.heightBox,
            'The weather app provides users with real-time information about the current weather conditions and forecast for a specific location. It typically uses data from weather services or weather APIs to deliver accurate and up-to-date information about temperature, precipitation, wind speed and direction, humidity, and other key weather factors.'
                .text
                .size(20)
                .make(),
            const Spacer(),
            'Developed By A B SABBIR'.text.size(15.0).makeCentered(),
            10.heightBox
          ],
        ));
  }
}
