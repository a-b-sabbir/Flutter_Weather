import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/functions/fetch_data.dart';

class HomeController extends GetxController {
  var updatedData;
  @override
  void onInit() async {
    await getLocation();
    updatedData = fetchDataAndSave(latitude.value, longitude.value);

    super.onInit();
  }

  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var isLoaded = false.obs;

  getLocation() async {
    bool isLocationEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    isLocationEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isLocationEnabled) {
      print('Location is off');
      return Future.error('Location services are disabled.');
    }
    // Test if permission is granted.
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Permission is denied forever');
    } else if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Permission is denied');
      }
    }
    // getting the current position
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      // updating the values of latitude and longitude
      latitude.value = value.latitude;
      longitude.value = value.longitude;
      isLoaded.value = true;
    });
  }
}
