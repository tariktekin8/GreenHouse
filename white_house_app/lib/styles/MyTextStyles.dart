import 'package:flutter/material.dart';
import 'package:white_house_app/styles/MyColors.dart';

abstract class AppTextStyles {
  static const TextStyle appBarTitleTextStyle =
      TextStyle(color: AppColors.appBarTitleColor);
}

abstract class DeviceScreenTextStyles {
  static const TextStyle deviceNameTextStyle = TextStyle(
      color: DeviceScreenColors.deviceNameColor,
      fontWeight: FontWeight.w800,
      fontSize: 24.0);
  static const TextStyle deviceDescriptionTextStyle =
      TextStyle(color: DeviceScreenColors.deviceDescriptionColor, fontSize: 15);
}

abstract class SensorScreenTextStyles {
  static const TextStyle deviceNameTextStyle =
      TextStyle(color: SensorScreenColors.deviceNameColor);
  static const TextStyle currentDateTimeTextStyle =
      TextStyle(color: SensorScreenColors.currentDateTimeColor);
  static const TextStyle sensorNameTextStyle = TextStyle(
      color: SensorScreenColors.sensorNameColor,
      fontSize: 30,
      fontWeight: FontWeight.bold);
  static const TextStyle deviceDescriptionTextStyle = TextStyle(
      // color: SensorScreenColors.deviceDescriptionColor
      );
  static const TextStyle lastValueTextStyle = TextStyle(
      color: SensorScreenColors.lastValueColor,
      fontSize: 50,
      fontWeight: FontWeight.bold);
  static const TextStyle recentValuesTitleTextStyle = TextStyle(
      // color: SensorScreenColors.recentValueTitleColor
      );
}

abstract class ValueTileTextStyles {
  static const TextStyle labelTextStyle =
      TextStyle(color: ValuteTileColors.labelColor, fontSize: 14);
  static const TextStyle valueTextStyle = TextStyle(
      color: ValuteTileColors.valueColor,
      fontSize: 18,
      fontWeight: FontWeight.bold);
}

abstract class DataTableItemTextStyles {
  static const TextStyle dataColumnTextStyle =
      TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
}
