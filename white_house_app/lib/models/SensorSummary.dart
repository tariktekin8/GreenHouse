import 'package:white_house_app/models/Sensor.dart';
import 'package:white_house_app/models/SensorData.dart';

class SensorSummary {
  Sensor sensor;
  List<SensorData> sensorDataList;

  SensorSummary({this.sensor, this.sensorDataList});
}
