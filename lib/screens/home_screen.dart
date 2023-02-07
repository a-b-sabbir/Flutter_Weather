import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_app/const/lists.dart';
import 'package:weather_app/screens/about_screen.dart';
import 'package:weather_app/widgets/text_style.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg-image.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: normalText(text: 'Weather', color: Colors.black, size: 25.0),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: VxPopupMenu(
                menuBuilder: () {
                  return Column(
                          children: List.generate(
                              1,
                              (index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(children: [
                                      boldText(
                                          text: 'About', color: Colors.black)
                                    ]).onTap(() {
                                      Get.to(() => const AboutScreen());
                                    }),
                                  )))
                      .box
                      .width(100)
                      .roundedSM
                      .white
                      .padding(const EdgeInsets.all(10.0))
                      .make();
                },
                clickType: VxClickType.singleClick,
                child: const Icon(
                  Icons.more_vert_rounded,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 30,
                  ),
                  5.widthBox,
                  boldText(text: 'Dhaka  ', size: 50.0),
                ]),
                10.heightBox,
                boldText(
                    text: intl.DateFormat('MMMM d, EEE,   hh:mm')
                        .format(DateTime.now()),
                    size: 20.0),
                20.heightBox,
                const Icon(
                  Icons.sunny,
                  color: Colors.amberAccent,
                  size: 150,
                ),
                30.heightBox,
                boldText(text: '30° C', size: 40.0),
                15.heightBox,
                normalText(text: 'Haze', size: 25.0),
                50.heightBox,
                Align(
                    alignment: Alignment.centerLeft,
                    child: boldText(text: '  Weather Details', size: 30.0)),
                const Divider(
                  thickness: 1.5,
                  color: Colors.white,
                  indent: 15,
                  endIndent: 40,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, mainAxisExtent: 200),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            boldText(
                                text: weatherDetailsTitles[index],
                                color: Color.fromARGB(255, 39, 72, 88),
                                size: 16.0),
                          ],
                        ),
                        10.heightBox,
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            weatherDetailsValues[index].text.white.make(),
                          ],
                        )
                            .box
                            .outerShadowLg
                            .width(60)
                            .height(100)
                            .color(Color.fromARGB(255, 91, 167, 192))
                            .roundedLg
                            .makeCentered(),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
