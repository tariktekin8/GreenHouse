import 'package:white_house_app/models/Device.dart';
import 'package:white_house_app/models/SensorData.dart';

class Overview {
  Device device;
  List<SensorData> sensorDataList;

  Overview({this.device, this.sensorDataList});
}
