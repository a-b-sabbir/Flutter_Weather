import 'package:flutter/widgets.dart';
import 'package:weather_app/const/const.dart';

weatherIcon(String fetchedIcon) {
  if (fetchedIcon == '50d') {
    return Image.asset(ic_haze, width: 160, height: 160);
  } else if (fetchedIcon == '01d') {
    return Image.asset(ic_clear_sky, width: 160, height: 160);
  } else if (fetchedIcon == '10d') {
    return Image.asset(ic_rain, width: 160, height: 160);
  } else if (fetchedIcon == '10d') {
    return Image.asset(ic_snow, width: 160, height: 160);
  } else if (fetchedIcon == '13d') {
    return Image.asset(ic_rain, width: 160, height: 160);
  } else if (fetchedIcon == '50d') {
    return Image.asset(ic_mist, width: 160, height: 160);
  } else {
    return Image.asset(ic_clear_sky, width: 160, height: 160);
  }
}
