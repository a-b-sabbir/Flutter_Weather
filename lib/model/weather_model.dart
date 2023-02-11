import 'dart:convert';

WeatherModel savedDataFromJson(String str) =>
    WeatherModel.fromJson(json.decode(str));

String savedDataToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  WeatherModel({
    required this.id,
    required this.coord,
    required this.weather,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.name,
  });
  int id;
  Coord coord;
  List<Weather> weather;
  Main main;
  int visibility;
  Wind wind;
  Clouds clouds;
  String name;

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
      coord: Coord.fromJson(json["coord"]),
      weather:
          List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
      main: Main.fromJson(json["main"]),
      visibility: json["visibility"],
      wind: Wind.fromJson(json["wind"]),
      clouds: Clouds.fromJson(json["clouds"]),
      name: json["name"],
      id: json["id"]);

  Map<String, dynamic> toJson() => {
        "coord": coord.toJson(),
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "main": main.toJson(),
        "visibility": visibility,
        "wind": wind.toJson(),
        "clouds": clouds.toJson(),
        "name": name,
        "id": id
      };
}

class Clouds {
  Clouds({
    required this.all,
  });

  int all;

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
      );

  Map<String, dynamic> toJson() => {
        "all": all,
      };
}

class Coord {
  Coord({
    required this.lon,
    required this.lat,
  });

  double lon;
  double lat;

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"]?.toDouble(),
        lat: json["lat"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
      };
}

class Main {
  Main({
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
  });

  double temp;
  double feelsLike;
  int pressure;
  int humidity;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"]?.toDouble(),
        feelsLike: json["feels_like"]?.toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "pressure": pressure,
        "humidity": humidity,
      };
}

class Weather {
  Weather({
    required this.main,
    required this.icon,
  });

  String main;
  String icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        main: json["main"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "main": main,
        "icon": icon,
      };
}

class Wind {
  Wind({
    required this.speed,
  });

  num speed;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"],
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
      };
}
