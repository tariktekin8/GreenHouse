import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:white_house_app/helpers/Calculators.dart';
import 'package:white_house_app/models/SensorData.dart';
import 'package:white_house_app/providers/SensorDataProvider.dart';
import 'package:white_house_app/styles/MyColors.dart';
import 'package:white_house_app/styles/MyDecorations.dart';
import 'package:white_house_app/styles/MyTextStyles.dart';
import 'package:white_house_app/widgets/designWidgets/ColumnDivider.dart';
import 'package:white_house_app/widgets/designWidgets/RowDivider.dart';
import 'package:white_house_app/widgets/designWidgets/ValueTile.dart';

import 'ChartScreen.dart';

class SensorScreen extends StatefulWidget {
  final int deviceID;
  final String deviceName;
  final String deviceDescription;
  final int sensorID;

  SensorScreen(
      {this.deviceID, this.sensorID, this.deviceName, this.deviceDescription});

  @override
  _SensorScreen createState() => _SensorScreen(
        deviceID: deviceID,
        sensorID: sensorID,
        deviceName: deviceName,
        deviceDescription: deviceDescription,
      );
}

class _SensorScreen extends State {
  int deviceID;
  int sensorID;
  String deviceName;
  String deviceDescription;
  IconData sensorIcon;

  _SensorScreen(
      {this.deviceID, this.sensorID, this.deviceName, this.deviceDescription}) {
    switch (this.sensorID) {
      case 201:
        sensorIcon = WeatherIcons.thermometer;
        break;
      case 202:
        sensorIcon = WeatherIcons.humidity;
        break;
      case 203:
        sensorIcon = WeatherIcons.smoke;
        break;
      default:
        sensorIcon = WeatherIcons.na;
    }
  }

  @override
  initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    initDataProviders();
  }

  initDataProviders() async {
    await Provider.of<SensorDataProvider>(context, listen: false)
        .initTimer(deviceID: this.deviceID, sensorID: this.sensorID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackgroundColor,
        title: Text(
          deviceName,
          style: AppTextStyles.appBarTitleTextStyle,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.arrowBackIconColor,
          ),
          onPressed: () {
            SensorDataProvider.timer.cancel();
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.show_chart,
              color: SensorScreenColors.showChartIconColor,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => ChartScreen(
                    deviceID: deviceID,
                    sensorID: sensorID,
                    sensorName: 'Temperature',
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Consumer<SensorDataProvider>(
          builder: (ctx, sensorDataProvider, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  // Time
                  // padding: EdgeInsets.only(top: 15),
                  child: Column(
                    children: <Widget>[
                      Text(
                        DateFormat.yMMMMEEEEd().format(
                          DateTime.now(),
                        ), // Saturday, March 28, 2020
                        style: SensorScreenTextStyles.currentDateTimeTextStyle,
                      ),
                      Text(
                        DateFormat.Hms().format(
                          DateTime.now(),
                        ), // 19:29:05
                        style: SensorScreenTextStyles.currentDateTimeTextStyle,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        sensorDataProvider.sensor.name,
                        style: SensorScreenTextStyles.sensorNameTextStyle,
                      ),
                      Text(
                        deviceDescription,
                        style:
                            SensorScreenTextStyles.deviceDescriptionTextStyle,
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 280,
                  height: 280,
                  decoration: SensorScreenDecorations.circleBoxDecoration,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        sensorIcon,
                        size: 70,
                        color: SensorScreenColors.sensorIconColor,
                      ),
                      Text(
                        '${sensorDataProvider.lastValue} ${sensorDataProvider.sensor.unitSymbol}',
                        style: SensorScreenTextStyles.lastValueTextStyle,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      ColumnDivider(),
                      Text(
                        'Last ${sensorDataProvider.sensorData.length} Values',
                        style:
                            SensorScreenTextStyles.recentValuesTitleTextStyle,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 15),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: _buildLast10DataToWidgetList(
                                sensorDataProvider.sensorData,
                                sensorDataProvider.sensor.unitSymbol),
                          ),
                        ),
                      ),
                      ColumnDivider(),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ValueTile(
                          label: "min",
                          value:
                              '${Calculators.getMinValue(sensorDataProvider.sensorData)} ${sensorDataProvider.sensor.unitSymbol}'),
                      RowDivider(),
                      ValueTile(
                          label: "avg",
                          value:
                              '${Calculators.getAverageValue(sensorDataProvider.sensorData)} ${sensorDataProvider.sensor.unitSymbol}'),
                      RowDivider(),
                      ValueTile(
                          label: "max",
                          value:
                              '${Calculators.getMaxValue(sensorDataProvider.sensorData)} ${sensorDataProvider.sensor.unitSymbol}'),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  List<Widget> _buildLast10DataToWidgetList(
      List<SensorData> dataList, String unitSymbol) {
    List<Widget> widgetList = [];
    for (var data in dataList) {
      widgetList.add(
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: ValueTile(
                  label: data.createdDate.split(' ')[1],
                  value: '${data.value} $unitSymbol'),
            ),
          ],
        ),
      );
    }
    return widgetList;
  }
}
