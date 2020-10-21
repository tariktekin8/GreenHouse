// TO-DO: Restrict the screen to be horizontal

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:white_house_app/models/DataFilter.dart';
import 'package:white_house_app/providers/SensorDataProvider.dart';
import 'package:white_house_app/styles/MyColors.dart';
import 'package:white_house_app/styles/MyTextStyles.dart';
import 'package:white_house_app/widgets/Chart.dart';

class ChartScreen extends StatefulWidget {
  final int deviceID;
  final int sensorID;
  final String sensorName;

  ChartScreen({
    @required this.deviceID,
    @required this.sensorID,
    @required this.sensorName,
  });

  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  List<FilterButtonData> buttonList = [
    FilterButtonData(
      filter: DataFilter.last10,
      title: 'Last 10',
      isBold: true,
    ),
    FilterButtonData(
      filter: DataFilter.daily,
      title: 'Daily',
      isBold: false,
    ),
    FilterButtonData(
      filter: DataFilter.weekly,
      title: 'Weekly',
      isBold: false,
    ),
    FilterButtonData(
      filter: DataFilter.yearly,
      title: 'Yearly',
      isBold: false,
    ),
  ];

  @override
  initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyBackgroundColor,
      body: Consumer<SensorDataProvider>(
        builder: (ctx, sensorSummaryProvider, _) {
          return Column(
            children: <Widget>[
              Container(
                color: AppColors.appBarBackgroundColor,
                height: 40,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      color: AppColors.appBarTitleColor,
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        SystemChrome.setPreferredOrientations(
                            [DeviceOrientation.portraitUp]);

                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      widget.sensorName,
                      style: AppTextStyles.appBarTitleTextStyle,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SafeArea(
                  left: false,
                  bottom: false,
                  child: Row(
                    children: <Widget>[
                      Container(
                        color: Colors.green,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: buttonList.map<Widget>(
                            (item) {
                              return filterButton(
                                title: item.title,
                                isBold: item.isBold,
                                onPressed: () {
                                  SensorDataProvider.timer.cancel();
                                  Provider.of<SensorDataProvider>(context,
                                          listen: false)
                                      .initTimer(
                                          dataFilter: item.filter,
                                          deviceID: widget.deviceID,
                                          sensorID: widget.sensorID);

                                  var tmpList = buttonList;

                                  tmpList.forEach((tmp) {
                                    if (item.title == tmp.title)
                                      tmp.isBold = true;
                                    else
                                      tmp.isBold = false;
                                  });

                                  setState(() {
                                    buttonList = tmpList;
                                  });
                                },
                              );
                            },
                          ).toList(),
                        ),
                      ),
                      Expanded(
                        child: Chart(
                          data: sensorSummaryProvider.sensorData,
                          unitSymbol: sensorSummaryProvider.sensor.unitSymbol,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget filterButton({title, isBold = false, onPressed}) {
    FontWeight fw;

    if (isBold) {
      fw = FontWeight.bold;
    } else {
      fw = FontWeight.normal;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 1),
        // decoration: MyDecorations.rawMaterialButtonDecoration,
        child: RawMaterialButton(
          padding: EdgeInsets.all(0),
          constraints: BoxConstraints(),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(fontWeight: fw, fontSize: 13, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class FilterButtonData {
  DataFilter filter;
  String title;
  bool isBold;

  FilterButtonData({this.title, this.isBold, this.filter});
}
