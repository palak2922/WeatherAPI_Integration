import 'package:clima/Screens/Location%20Screen.dart';
import 'package:clima/Utilities/Constants.dart';
import 'package:flutter/material.dart';




class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  String cityName;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('img/land.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [

              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  child: Icon(Icons.arrow_back_ios, size: 50,),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ),

              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value){
                    cityName = value;
                  },
                ),

              ),

              FlatButton(
                  child: Text('Get Weather',style: kButtonTextStyle,),
                onPressed: (){
                    Navigator.pop(context, cityName);
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}




