import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';
import 'package:http/http.dart' as http;

String apiKey = '70d375bfc8182ecd27d72e5b632306b2';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{
    final url = await Uri.https(
        'api.openweathermap.org',
        '/data/2.5/weather',
        {
          'q': cityName,
          'appid': apiKey,
        },
    );

      NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;

  }

  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();

    var url = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/weather',
      {
        'lat': '${location.latitude}',
        'lon': '${location.longitude}',
        'appid': '$apiKey',
      },
    );

    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
