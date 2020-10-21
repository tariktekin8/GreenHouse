import 'package:flutter/material.dart';
import 'package:white_house_app/models/SensorData.dart';
import 'package:white_house_app/styles/MyTextStyles.dart';

class DataTableItem extends StatelessWidget {
  final List<SensorData> sensorData;

  DataTableItem({@required this.sensorData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        headingRowHeight: 45,
        horizontalMargin: 10,
        rows: _convertDataToDataRow(sensorData),
        columns: [
          DataColumn(
            label: Text(
              'Created Date',
              style: DataTableItemTextStyles.dataColumnTextStyle,
            ),
          ),
          DataColumn(
            label: Text(
              'Value',
              style: DataTableItemTextStyles.dataColumnTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  List<DataRow> _convertDataToDataRow(List<SensorData> list) {
    return list.reversed
        .toList()
        .map(
          (data) => DataRow(
            cells: [
              DataCell(
                Text(data.createdDate),
              ),
              DataCell(
                Text(data.value),
              ),
            ],
          ),
        )
        .toList();
  }
}
