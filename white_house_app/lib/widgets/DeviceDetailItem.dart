import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:white_house_app/helpers/API.dart';
import 'package:white_house_app/models/ApiResponse.dart';
import 'package:white_house_app/models/Overview.dart';
import 'package:white_house_app/models/SystemType.dart';
import 'package:white_house_app/styles/MyColors.dart';
import 'package:white_house_app/styles/MyTextStyles.dart';

class DeviceDetailItem extends StatelessWidget {
  final Overview overview;

  DeviceDetailItem({this.overview});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                overview.device.name,
                style: DeviceScreenTextStyles.deviceNameTextStyle,
              ),
              Text(
                overview.device.description,
                style: DeviceScreenTextStyles.deviceDescriptionTextStyle,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.toys,
                  color: overview.device.acOnline
                      ? DeviceScreenColors.acOnlineColor
                      : DeviceScreenColors.acOfflineColor,
                ),
                onPressed: () async {
                  ApiResponse response = await API.changeStatus(
                    deviceID: overview.device.deviceID,
                    setStatus: !overview.device.acOnline,
                    systemType: SystemType.airCondition,
                  );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      Future.delayed(Duration(seconds: 3), () {
                        Navigator.of(context).pop(true);
                      });
                      return AlertDialog(
                        title: Text(
                          changeResponseTypeToText(response.type),
                          textAlign: TextAlign.center,
                        ),
                        content: Text(
                          response.message,
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  );
                },
              ),
              IconButton(
                icon: Icon(
                  WeatherIcons.raindrop,
                  color: overview.device.wsOnline
                      ? DeviceScreenColors.wsOnlineColor
                      : DeviceScreenColors.wsOfflineColor,
                ),
                onPressed: () async {
                  ApiResponse response = await API.changeStatus(
                    deviceID: overview.device.deviceID,
                    setStatus: !overview.device.wsOnline,
                    systemType: SystemType.wateringSystem,
                  );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.of(context).pop(true);
                      });
                      return AlertDialog(
                        title: Text(
                          changeResponseTypeToText(response.type),
                          textAlign: TextAlign.center,
                        ),
                        content: Text(
                          response.message,
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

String changeResponseTypeToText(String responseType) {
  String result = "";

  switch (responseType) {
    case "S":
      result = "Success";
      break;
    case "E":
      result = "Error";
      break;
    case "N/a":
      result = "No action";
      break;
    default:
  }

  return result;
}
