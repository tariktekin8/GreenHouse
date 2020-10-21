import 'package:flutter/material.dart';
import 'package:white_house_app/models/Overview.dart';
import 'package:white_house_app/providers/OverviewProvider.dart';
import 'package:white_house_app/screens/SensorScreen.dart';
import 'package:white_house_app/styles/MyDecorations.dart';

class SensorItemList extends StatelessWidget {
  // final int deviceID;
  // final String deviceName;
  // final List<SensorData> sensorList;

  final Overview overview;

  // SensorItemList({this.deviceID, this.deviceName, this.sensorList, this.overview});
  SensorItemList({this.overview});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: buildSensorList(context),
          ),
        ),
      ),
    );
  }

  List<Widget> buildSensorList(BuildContext context) {
    List<Widget> data = new List<Widget>();
    if (overview.sensorDataList.isEmpty) {
      data.add(
        Container(
          margin: EdgeInsets.all(3),
          decoration: SensorListDecorations.noSensorFound,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Text("No Sensor Found !!!"),
              ],
            ),
          ),
        ),
      );
    } else {
      data = overview.sensorDataList.map<Widget>(
        (item) {
          return FlatButton(
            padding: EdgeInsets.all(0),
            onPressed: () {
              OverviewProvider.timer.cancel();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SensorScreen(
                      deviceDescription: this.overview.device.description,
                      deviceID: this.overview.device.deviceID,
                      deviceName: this.overview.device.name,
                      sensorID: item.sensorID),
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
                    Text(item.name),
                    Text("${item.value} ${item.unitSymbol}"),
                  ],
                ),
              ),
            ),
          );
        },
      ).toList();
    }

    return data;
  }
}
