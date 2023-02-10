import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_app/const/const.dart';
import 'package:weather_app/widgets/text_style.dart';

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
          ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) => Card(
                child: '${about_list[index]}'
                    .text
                    .size(20)
                    .make()
                    .box
                    .padding(EdgeInsets.all(10.0))
                    .margin(EdgeInsets.all(5.0))
                    .make()),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              credit.text.size(15.0).make(),
              2.widthBox,
              developer.text.size(15.0).bold.purple600.make(),
            ],
          ),
          10.heightBox
        ],
      ),
    );
  }
}
