import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_app/const/const.dart';

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
            about.text.size(20).make(),
            const Spacer(),
            credit.text.size(15.0).makeCentered(),
            10.heightBox
          ],
        ));
  }
}
