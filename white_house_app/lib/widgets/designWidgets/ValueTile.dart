import 'package:flutter/material.dart';
import 'package:white_house_app/styles/MyTextStyles.dart';

/// General utility widget used to render a cell divided into three rows
/// First row displays [label]
/// second row displays [iconData]
/// third row displays [value]
class ValueTile extends StatelessWidget {
  final String label;
  final String value;
  TextStyle labelStyle;
  TextStyle valueStyle;

  ValueTile({this.label, this.value, this.labelStyle, this.valueStyle}) {
    if (this.labelStyle == null) {
      labelStyle = ValueTileTextStyles.labelTextStyle;
    } else {
      labelStyle = this.labelStyle;
    }
    if (this.valueStyle == null) {
      valueStyle = ValueTileTextStyles.valueTextStyle;
    } else {
      valueStyle = this.valueStyle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          this.label,
          style: labelStyle,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          this.value,
          style: valueStyle,
        ),
      ],
    );
  }
}
