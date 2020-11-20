import 'package:flutter/material.dart';


const kTempTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 100,
);


const kConditionTextStyle = TextStyle(
color: Colors.white,
  fontSize: 50,
);


const kMessageTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 50,
);


const kButtonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 40,
  fontWeight: FontWeight.bold,
);


const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(Icons.location_city, color: Colors.white,),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide.none,
  ),
);






