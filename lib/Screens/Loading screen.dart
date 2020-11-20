import 'package:clima/Screens/Location%20Screen.dart';
import 'package:clima/Services/Weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';





class loadingScreen extends StatefulWidget {
  @override
  _loadingScreenState createState() => _loadingScreenState();
}

class _loadingScreenState extends State<loadingScreen> {



  void getLocationData() async{

    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(
      builder: (context) => LocationScreen(locationWeather: weatherData,)
    ));

  }


  @override
  void initState() {
    super.initState();
    getLocationData();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}









