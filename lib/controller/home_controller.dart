import 'package:get/get.dart';
import 'package:weather_app/functions/fetch_data.dart';

class HomeController extends GetxController {
  var updatedData;
  @override
  void onInit() {
    super.onInit();
    updatedData = fetchDataAndSave();
  }
}
