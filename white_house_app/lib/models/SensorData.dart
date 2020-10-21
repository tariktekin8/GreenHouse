import 'package:white_house_app/models/Sensor.dart';

class SensorData extends Sensor {
  String value;
  String createdDate;

  SensorData({sensorID, name, unitSymbol, this.value, this.createdDate})
      : super(sensorID: sensorID, name: name, unitSymbol: unitSymbol);
}
