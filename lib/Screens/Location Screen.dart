import 'package:clima/Screens/City%20Screen.dart';
import 'package:clima/Utilities/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clima/Services/Weather.dart';



class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  WeatherModel weatherModel = WeatherModel();

  int temperature;
  String weatherIcon;
  String city;
  String weatherMessage;

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }


  void updateUI(dynamic weatherData){

    setState(() {
      if(weatherData == null){
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get weather data...';
        city = '';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      weatherMessage = weatherModel.getMessage(temperature);
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weatherModel.getWeatherIcon(condition);
      city = weatherData['name'];

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('img/rain.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8),
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  FlatButton(
                      child: Icon(Icons.near_me, size: 50.0, color: Colors.pink,),
                    onPressed: () async{
                        var weatherdata = await weatherModel.getLocationWeather();
                        updateUI(weatherdata);
                    },
                  ),

                  FlatButton(
                    child: Icon(Icons.location_city, size: 50.0, color: Colors.pink,),
                    onPressed: () async{
                      var typedName = await Navigator.push(context, MaterialPageRoute(
                        builder: (context) => CityScreen()
                      ));
                      if(typedName != null){
                        var citydata = await weatherModel.getCityWeather(typedName);
                        updateUI(citydata);
                      }
                    },
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),

                    Text(
                      '$weatherIcon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$weatherMessage in $city',
                  style: kMessageTextStyle,
                  textAlign: TextAlign.right,
                ),

              ),

            ],
          ),
        ),
      ),
    );
  }
}
