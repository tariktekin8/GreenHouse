import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:white_house_app/providers/OverviewProvider.dart';
import 'package:white_house_app/providers/SensorDataProvider.dart';
import 'package:white_house_app/screens/DeviceScreen.dart';
import 'package:syncfusion_flutter_core/core.dart';

void main() {
  SyncfusionLicense.registerLicense(
      "NT8mJyc2IWhiZH1nfWN9YGpoYmF8YGJ8ampqanNiYmlmamlmanMDHmgxMiE6IDwpNDY9amUTND4yOj99MDw+");

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OverviewProvider()),
        ChangeNotifierProvider(create: (context) => SensorDataProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Green House',
        theme: ThemeData(
          textTheme: GoogleFonts.montserratAlternatesTextTheme(),
        ),
        home: DeviceScreen(),
      ),
    );
  }
}
