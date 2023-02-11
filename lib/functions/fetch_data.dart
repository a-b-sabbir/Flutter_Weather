import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/model/weather_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';
import 'package:hive/hive.dart';
import 'package:get/get.dart';

const key = "4df9479620c3bbb9e98ef89039a5eab0";

Box? _box;
var data;
fetchDataAndSave(lat, long) async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    var link =
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$key&units=metric";
    var response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      data = savedDataFromJson(response.body.toString());

      //
      //! set data using Hive
      var jsonData = jsonDecode(response.body);
      // Open the Hive database
      _box = await Hive.openBox('myBox');
      // put the JSON data to the Hive box
      _box!.put('data', jsonData);

      // //
      // //? set data using shared_preferences
      // var pref = await SharedPreferences.getInstance();
      // // save JSON data to SharedPreferences
      // var jsonString = json.encode(data);
      // pref.setString('data', jsonString);

      print('Connected');

      return data;
    }
  } else {
    //
    //! get data using Hive
    _box = await Hive.openBox('myBox');
    var valueAsString = _box!.get('data');
    var valueAsJson = json.encode(valueAsString); //as string
    var data = savedDataFromJson(valueAsJson); // as dart object

    // //
    // //? get data using shared_preferences
    // var pref = await SharedPreferences.getInstance(); // made instance
    // // Retrieve JSON data from SharedPreferences
    // var prefAsString = pref.getString('data'); //as string
    // data = savedDataFromJson(prefAsString!); // as dart object

    print('Not connected');

    return data;
  }
}
