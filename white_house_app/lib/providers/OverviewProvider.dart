import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:white_house_app/helpers/API.dart';
import 'package:white_house_app/models/Device.dart';
import 'package:white_house_app/models/Overview.dart';
import 'package:white_house_app/models/SensorData.dart';

class OverviewProvider extends ChangeNotifier {
  List<Overview> overviewList;

  static Timer timer;

  initTimer() {
    timer = Timer.periodic(new Duration(milliseconds: 1000), (timer) {
      getDevices();
    });
  }

  getDevices() async {
    var response = await API.getDevices();

    if (response.type == 'S') {
      Iterable list = response.data;

      overviewList = list.map((item) {
        var sensorDataList = item['SensorDataList'];

        Device device = new Device(
            deviceID: item['Device']['DeviceID'],
            name: item['Device']['Name'],
            description: item['Device']['Description'],
            isOnline: item['Device']['IsOnline'],
            acOnline: item['Device']['ACOnline'],
            wsOnline: item['Device']['WSOnline']);

        List<SensorData> data = sensorDataList
            .map<SensorData>(
              (element) => SensorData(
                sensorID: element['SensorID'],
                name: element['Name'],
                value: element['Value'],
                createdDate: element['CreatedDate'],
                unitSymbol: element['UnitSymbol'],
              ),
            )
            .toList();

        return new Overview(device: device, sensorDataList: data);
      }).toList();

      print("Done");
    } else {}

    notifyListeners();
  }
}
