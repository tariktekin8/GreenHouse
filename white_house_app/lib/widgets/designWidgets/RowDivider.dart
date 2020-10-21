import 'package:flutter/material.dart';
import 'package:white_house_app/styles/MyColors.dart';

class RowDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        width: 1,
        height: 30,
        color: ValuteTileColors.rowDividerColor,
      ),
    );
  }
}
