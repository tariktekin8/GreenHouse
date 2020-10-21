import 'package:flutter/material.dart';
import 'package:white_house_app/styles/MyColors.dart';

class ColumnDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.3,
        height: 1,
        color: ValuteTileColors.columnDividerColor,
      ),
    );
  }
}
