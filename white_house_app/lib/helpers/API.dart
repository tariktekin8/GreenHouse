import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:white_house_app/models/ApiResponse.dart';
import 'package:white_house_app/models/SystemType.dart';

const baseUrl = "http://192.168.4.1:8080";

class API {
  static Future<ApiResponse> changeStatus(
      {int deviceID, SystemType systemType, bool setStatus}) async {
    var url = baseUrl + "/changeStatus";
    String columnName;

    switch (systemType) {
      case SystemType.device:
        columnName = "IsOnline";
        break;
      case SystemType.airCondition:
        columnName = "ACOnline";
        break;
      case SystemType.wateringSystem:
        columnName = "WSOnline";
        break;
      default:
        columnName = "";
        break;
    }

    Map<String, String> headers = {"Content-type": "application/json"};

    int value = setStatus ? 1 : 0;

    String body =
        '{"DeviceID": $deviceID, "ColumnName": "$columnName", "Value": $value}';

    // String body =
    //     '{"DeviceID": ${deviceID.toString()}, "ColumnName": ${columnName.toString()}, "Value": ${value.toString()}}';

    http.Response res = await http.patch(url, headers: headers, body: body);

    final response = json.decode(res.body);

    return ApiResponse(
      type: response['type'],
      message: response['message'],
    );
  }

  static Future<ApiResponse> getDevices() async {
    var url = baseUrl + "/getDevices";
    final res = await http.get(url);
    final response = json.decode(res.body);
    return ApiResponse(
      type: response['type'],
      message: response['message'],
      data: response['data'],
    );
  }

  static Future<ApiResponse> getLastSensorData({deviceID, sensorID}) async {
    var url =
        baseUrl + "/getLastSensorData?DeviceID=$deviceID&SensorID=$sensorID";
    final res = await http.get(url);
    final response = json.decode(res.body);
    return ApiResponse(
      type: response['type'],
      message: response['message'],
      data: response['data'],
    );
  }

  static Future<ApiResponse> getLast10SensorData({deviceID, sensorID}) async {
    var url =
        baseUrl + "/getLast10SensorData?DeviceID=$deviceID&SensorID=$sensorID";
    var res = await http.get(url);
    final response = json.decode(res.body);
    return ApiResponse(
      type: response['type'],
      message: response['message'],
      data: response['data'],
    );
  }

  static Future<ApiResponse> getDailySensorData({deviceID, sensorID}) async {
    var url =
        baseUrl + "/getDailySensorData?DeviceID=$deviceID&SensorID=$sensorID";
    var res = await http.get(url);
    final response = json.decode(res.body);
    return ApiResponse(
      type: response['type'],
      message: response['message'],
      data: response['data'],
    );
  }

  static Future<ApiResponse> getWeeklySensorData({deviceID, sensorID}) async {
    var url =
        baseUrl + "/getWeeklySensorData?DeviceID=$deviceID&SensorID=$sensorID";
    var res = await http.get(url);
    final response = json.decode(res.body);
    return ApiResponse(
      type: response['type'],
      message: response['message'],
      data: response['data'],
    );
  }

  static Future<ApiResponse> getYearlySensorData({deviceID, sensorID}) async {
    var url =
        baseUrl + "/getYearlySensorData?DeviceID=$deviceID&SensorID=$sensorID";
    var res = await http.get(url);
    final response = json.decode(res.body);
    return ApiResponse(
      type: response['type'],
      message: response['message'],
      data: response['data'],
    );
  }
}
