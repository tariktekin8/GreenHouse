import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:white_house_app/helpers/API.dart';
import 'package:white_house_app/models/ApiResponse.dart';
import 'package:white_house_app/models/DataFilter.dart';
import 'package:white_house_app/models/Sensor.dart';
import 'package:white_house_app/models/SensorData.dart';

class SensorDataProvider extends ChangeNotifier {
  Sensor sensor;
  List<SensorData> sensorData;
  String lastValue;

  static Timer timer;

  initTimer({deviceID, sensorID, DataFilter dataFilter = DataFilter.last10}) {
    Function timerFunction;

    switch (dataFilter) {
      case DataFilter.last10:
        timerFunction = (timer) {
          getLastSensorData(deviceID: deviceID, sensorID: sensorID);
          getLast10SensorData(deviceID: deviceID, sensorID: sensorID);
        };
        break;
      case DataFilter.daily:
        timerFunction = (timer) {
          getLastSensorData(deviceID: deviceID, sensorID: sensorID);
          getDailySensorData(deviceID: deviceID, sensorID: sensorID);
        };
        break;
      case DataFilter.weekly:
        timerFunction = (timer) {
          getLastSensorData(deviceID: deviceID, sensorID: sensorID);
          getWeeklySensorData(deviceID: deviceID, sensorID: sensorID);
        };
        break;
      case DataFilter.yearly:
        timerFunction = (timer) {
          getLastSensorData(deviceID: deviceID, sensorID: sensorID);
          getYearlySensorData(deviceID: deviceID, sensorID: sensorID);
        };
        break;
      default:
    }

    timer = Timer.periodic(new Duration(milliseconds: 1000), timerFunction);
  }

  getLastSensorData({deviceID, sensorID}) async {
    var response =
        await API.getLastSensorData(deviceID: deviceID, sensorID: sensorID);

    lastValue = response.data["lastValue"];

    notifyListeners();
  }

  getLast10SensorData({deviceID, sensorID}) async {
    var response =
        await API.getLast10SensorData(deviceID: deviceID, sensorID: sensorID);

    bindData(response);

    notifyListeners();
  }

  getDailySensorData({deviceID, sensorID}) async {
    var response =
        await API.getDailySensorData(deviceID: deviceID, sensorID: sensorID);

    bindData(response);

    notifyListeners();
  }

  getWeeklySensorData({deviceID, sensorID}) async {
    var response =
        await API.getWeeklySensorData(deviceID: deviceID, sensorID: sensorID);

    bindData(response);

    notifyListeners();
  }

  getYearlySensorData({deviceID, sensorID}) async {
    var response =
        await API.getYearlySensorData(deviceID: deviceID, sensorID: sensorID);

    bindData(response);

    notifyListeners();
  }

  bindData(ApiResponse response) {
    if (response.type == 'S') {
      var lvSensor = response.data['sensor'];
      var lvSensorData = response.data['sensorData'];

      sensor = new Sensor(
        sensorID: lvSensor['SensorID'],
        name: lvSensor['Name'],
        unitSymbol: lvSensor['UnitSymbol'],
      );

      Iterable list = lvSensorData;

      sensorData = list.map<SensorData>(
        (item) {
          return new SensorData(
            createdDate: item['CreatedDate'],
            value: item['Value'],
          );
        },
      ).toList();
    }
  }
}
