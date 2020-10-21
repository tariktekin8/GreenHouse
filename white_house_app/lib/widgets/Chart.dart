import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:white_house_app/helpers/Calculators.dart';
import 'package:white_house_app/models/SensorData.dart';

class Chart extends StatelessWidget {
  final List<SensorData> data;
  final String unitSymbol;

  Chart({@required this.data, @required this.unitSymbol});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryYAxis: NumericAxis(
        minimum: double.parse(Calculators.getMinValue(data)),
        maximum: double.parse(Calculators.getMaxValue(data)),
        labelFormat: '{value} $unitSymbol',
      ),
      // tooltipBehavior: TooltipBehavior(
      //     enable: true,
      //     header: 'Value',
      //     canShowMarker: false,
      //     format: 'point.y'),
      primaryXAxis: CategoryAxis(
        labelPlacement: LabelPlacement.onTicks,
        labelRotation: -75,
      ),
      series: <LineSeries<SensorData, String>>[
        LineSeries<SensorData, String>(
            enableTooltip: false,
            color: Colors.green,
            // markerSettings: MarkerSettings(isVisible: true),
            dataSource: this.data,
            xValueMapper: (SensorData sensorData, _) {
              if (sensorData.createdDate.contains(' ')) {
                return sensorData.createdDate.split(' ')[1];
              } else {
                return sensorData.createdDate;
              }
            },
            yValueMapper: (SensorData sensorData, _) {
              return double.parse(sensorData.value);
            })
      ],
    );
  }
}
