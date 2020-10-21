import 'package:flutter/material.dart';
import 'package:white_house_app/models/SensorData.dart';
import 'package:white_house_app/providers/OverviewProvider.dart';
import 'package:white_house_app/screens/SensorScreen.dart';
import 'package:white_house_app/styles/MyDecorations.dart';

class SensorItem extends StatelessWidget {
  final int deviceID;
  final String deviceName;
  final SensorData sensorData;

  SensorItem({this.deviceID, this.deviceName, this.sensorData});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: () {
        OverviewProvider.timer.cancel();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SensorScreen(
              deviceID: deviceID,
              sensorID: sensorData.sensorID,
              deviceName: deviceName,
            ),
            fullscreenDialog: true,
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(3),
        decoration: SensorItemDecorations.sensorData,
        width: 130,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Text(sensorData.name),
              Text("${sensorData.value} ${sensorData.unitSymbol}"),
            ],
          ),
        ),
      ),
    );
  }
}
