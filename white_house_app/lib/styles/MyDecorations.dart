import 'package:flutter/material.dart';
import 'package:white_house_app/styles/MyColors.dart';

abstract class SensorScreenDecorations {
  static BoxDecoration circleBoxDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: SensorScreenColors.circleBoxGradientColors,
    ),
    border: Border.all(
      color: SensorScreenColors.circleBoxBorderColor,
      width: 3,
    ),
    shape: BoxShape.circle,
  );
}

class SensorListDecorations {
  static final noSensorFound = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.red[300], Colors.red[300]],
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  );
}

class SensorItemDecorations {
  static final sensorData = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.green, Colors.green[400]],
    ),
    border: Border.all(color: Colors.white, width: 1),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  );
}
