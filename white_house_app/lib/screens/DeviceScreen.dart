import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:white_house_app/providers/OverviewProvider.dart';
import 'package:white_house_app/styles/MyColors.dart';
import 'package:white_house_app/widgets/DeviceDetailItem.dart';
import 'package:white_house_app/widgets/SensorItemList.dart';
import 'package:white_house_app/widgets/designWidgets/ItemCard.dart';

class DeviceScreen extends StatefulWidget {
  @override
  _DeviceScreen createState() => _DeviceScreen();
}

class _DeviceScreen extends State {
  @override
  initState() {
    super.initState();
    initDataProviders();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  initDataProviders() async {
    await Provider.of<OverviewProvider>(context, listen: false).initTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackgroundColor,
        title: Text('Greenhouse'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // TO-DO: Add New Device
            },
          ),
        ],
      ),
      body: Consumer<OverviewProvider>(
        builder: (ctx, overviewProvider, _) {
          if (overviewProvider.overviewList.isNotEmpty) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: overviewProvider.overviewList
                    .map<Widget>(
                      (overview) => ItemCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            DeviceDetailItem(
                              overview: overview,
                            ),
                            SensorItemList(
                              overview: overview,
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            );
          } else {
            return Text("No Data");
          }
        },
      ),
    );
  }
}
