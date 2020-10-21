import 'package:white_house_app/models/SensorData.dart';

class Calculators {
  static String getMaxValue(List<SensorData> data) {
    return data
        .reduce((curr, next) =>
            double.parse(curr.value) > double.parse(next.value) ? curr : next)
        .value;
  }

  static String getAverageValue(List<SensorData> data) {
    return (data
                .map((item) => double.parse(item.value))
                .reduce((a, b) => a + b) /
            data.length)
        .toStringAsFixed(1);
  }

  static String getMinValue(List<SensorData> data) {
    return data
        .reduce((curr, next) =>
            double.parse(curr.value) < double.parse(next.value) ? curr : next)
        .value;
  }
}
