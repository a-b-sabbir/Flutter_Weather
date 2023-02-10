import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_app/const/const.dart';
import 'package:weather_app/controller/home_controller.dart';
import 'package:weather_app/model/updated_weather.dart';
import 'package:weather_app/screens/about_screen.dart';
import 'package:weather_app/widgets/text_style.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(img_bg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
                  return Column(children: [
                    boldText(text: 'About', color: Colors.black)
                        .box
                        .padding(const EdgeInsets.all(5.0))
                        .make()
                        .onTap(() {
                      Get.to(() => const AboutScreen());
                    }),
                  ])
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
            padding: const EdgeInsets.only(top: 30),
            child: Obx(() => controller.isLoaded.value == true
                ? FutureBuilder(
                    future: controller.updatedData,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        SavedData data = snapshot.data;

                        return SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      size: 30,
                                    ),
                                    5.widthBox,
                                    boldText(text: data.name, size: 50.0),
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
                              boldText(
                                  text: '${data.main.temp.toInt()}° C',
                                  size: 40.0),
                              15.heightBox,
                              normalText(
                                  text: data.weather[0].main, size: 25.0),
                              50.heightBox,
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: boldText(
                                      text: '  Weather Details', size: 30.0)),
                              const Divider(
                                thickness: 1.5,
                                color: Colors.white,
                                indent: 15,
                                endIndent: 40,
                              ),
                              35.heightBox,
                              GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: weatherDetailsTitles.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3, mainAxisExtent: 180),
                                itemBuilder: (context, index) {
                                  var weatherDetailsValues = [
                                    '${data.wind.speed.toInt()} km/h',
                                    '${data.main.humidity} %',
                                    '${data.main.pressure} hPa',
                                    '${data.main.feelsLike.toInt()}° C',
                                    '${data.visibility.toInt() / 1000} km',
                                    '${data.clouds.all} %',
                                  ];
                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          boldText(
                                              text: weatherDetailsTitles[index],
                                              color: const Color.fromARGB(
                                                  255, 39, 72, 88),
                                              size: 16.0),
                                        ],
                                      ),
                                      10.heightBox,
                                      Container(
                                        alignment: Alignment.center,
                                        child: weatherDetailsValues[index]
                                            .text
                                            .white
                                            .size(16)
                                            .make(),
                                      )
                                          .box
                                          .outerShadowLg
                                          .width(70)
                                          .height(120)
                                          .color(const Color.fromARGB(
                                              255, 91, 167, 192))
                                          .roundedLg
                                          .make(),
                                    ],
                                  );
                                },
                              )
                            ],
                          ),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ))),
      ),
    );
  }
}
