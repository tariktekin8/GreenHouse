import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color appBarBackgroundColor =
      Color(0xFF4CAF50); //  Colors.green;
  static const Color appBarTitleColor = Color(0xFFFFFFFF); // Colors.white;
  static const Color bodyBackgroundColor =
      Color(0xFFE8F5E9); //  Colors.green[50];
  static const Color arrowBackIconColor = Color(0xFFFFFFFF); //  Colors.white;

}

abstract class DeviceScreenColors {
  static const Color deviceNameColor = Color(0xFF000000); //  Colors.black;
  static const Color deviceDescriptionColor =
      Color(0xFF9E9E9E); //  Colors.grey;
  static const Color acOnlineColor = Color(0xFF000000); //  Colors.black;
  static const Color acOfflineColor = Color(0xFF9E9E9E); //  Colors.grey;
  static const Color wsOnlineColor = Color(0xFF03A9F4); // Colors.lightBlue
  static const Color wsOfflineColor = Color(0xFF9E9E9E); //  Colors.grey;
}

abstract class SensorScreenColors {
  static const Color currentDateTimeColor = Color(0xFF9E9E9E); //  Colors.grey;
  static const Color deviceNameColor = Color(0xFF000000); //  Colors.black;
  static const Color sensorNameColor = Color(0xFF000000); //  Colors.black;
  static const Color lastValueColor = Color(0xFFFFFFFF); //  Colors.white;
  static const Color showChartIconColor = Color(0xFFFFFFFF); //  Colors.white;
  static const Color circleBoxBorderColor = Color(0xFFFFFFFF); //  Colors.white;
  static const List<Color> circleBoxGradientColors = [
    Color(0xFF4CAF50),
    Color(0xFF66BB6A)
  ]; // [Colors.green, Colors.green[400]];
  static const Color sensorIconColor = Color(0xFFFFFFFF); //  Colors.white;

}

abstract class ValuteTileColors {
  static const Color columnDividerColor =
      Color(0xFFBDBDBD); // Colors.grey[400];
  static const Color rowDividerColor = Color(0xFFBDBDBD); // Colors.grey[400];
  static const Color labelColor = Color(0x42000000); // Colors.black26;
  static const Color valueColor = Color(0xDD000000); // Colors.black87;
}

abstract class ItemCardColors {
  static const Color backgroundColor = Color(0xFFE8F5E9); //  Colors.green[50];
}
