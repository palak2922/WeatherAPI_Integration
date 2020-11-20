import 'package:clima/Services/Location.dart';
import 'package:clima/Services/Networking.dart';


const apiKey = 'ced99f59b4e22d1e8e968545cf9e546f';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel{


  Future<dynamic> getCityWeather(String cityName) async{

    NetworkHelper networkHelper = NetworkHelper('$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');
    var weatherdata = await networkHelper.getData();
    return weatherdata;
  }



  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();

    // lati = location.latitude;
    // longi = location.longitude;

    NetworkHelper networkHelper = NetworkHelper('$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    //to convert temperature in celsius use '&units=metric' after apikey in url

    var weatherData = await networkHelper.getData();
    return weatherData;

  }


  String getWeatherIcon(int condition){
   if(condition<300){
     return '🌩';
   }
   else if(condition<400){
     return '🌧';
   }
   else if(condition<600){
     return '☔';
   }
   else if(condition<700){
     return '☃️';
   }
   else if(condition<800){
     return '🌫';
   }
   else if(condition==800){
     return '☀️';
   }
   else if(condition<=804){
     return '☁️';
   }
   else {
     return '🤷';
   }
  }



  String getMessage(int temp){
    if(temp > 25){
      return 'it\'s 🍦 time...';
    }
    else if(temp > 20){
      return 'Time for shorts and 👕...';
    }
    else if(temp < 10){
      return 'you\'ll need 🧣 and 🧤...';
    }
    else{
      return 'Bring a 🧥 just in case...';
    }
  }

}



