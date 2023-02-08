import 'package:weather_app/utils/api_link.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/model/updated_weather.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

fetchDataAndSave() async {
  var response = await http.get(Uri.parse(link));
  var data;
  if (response.statusCode == 200) {
    var pref = await SharedPreferences.getInstance();

    // Retrieve JSON data from SharedPreferences
    var prefAsString = pref.getString('data'); //as string
    var prefAsDartObject = savedDataFromJson(prefAsString!); // as dart object

    print('Not connected');
    return prefAsDartObject;
  } else {
    data = savedDataFromJson(response.body.toString());

    var pref = await SharedPreferences.getInstance();
    var jsonString = json.encode(data);
    pref.setString('data', jsonString);

    print('connected');
    return data;
  }
}
