import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:provider/provider.dart';
import 'package:barslider2/schedule.dart';

class MyChart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<MySchedule>(
      builder: (context, schedule, _) => PieChart(
        createData(schedule.stateManagementTime),
        animate: false,
        defaultRenderer: ArcRendererConfig(arcRendererDecorators: [
          ArcLabelDecorator(labelPosition: ArcLabelPosition.inside),
        ]),
      ),
    );
  }

  static List<Series<_DataElement, String>> createData(
    double stateMgmtTime,
  ) {
    List<_DataElement> result;

    result = [
      _DataElement(
        name: "UX",
        time: (1.0 - stateMgmtTime) * 12.0 + 3.0,
        colorOfSlice: MaterialPalette.yellow.shadeDefault,
      ),
      _DataElement(
        name: "UI",
        time: (1.0 - stateMgmtTime) * 24.0 + 6.0,
        colorOfSlice: MaterialPalette.red.shadeDefault,
      ),
      _DataElement(
        name: "Backend",
        time: (1.0 - stateMgmtTime) * 24.0 + 6.0,
        colorOfSlice: MaterialPalette.green.shadeDefault,
      ),
      _DataElement(
        name: "State Management",
        time: stateMgmtTime * 70.0 + 25.0,
        colorOfSlice: MaterialPalette.blue.shadeDefault,
      ),
    ];

    print("${result[0].name} = ${result[0].time}");
    print("${result[1].name} = ${result[1].time}");
    print("${result[2].name} = ${result[2].time}");
    print("${result[3].name} = ${result[3].time}");

    return [
      Series(
          id: "Data Elements",
          data: result,
          colorFn: (_DataElement result, _) => result.colorOfSlice,
          domainFn: (_DataElement result, _) => result.name,
          measureFn: (_DataElement result, _) => result.time,
          labelAccessorFn: (_DataElement result, _) => '${result.name}')
    ];
  }
}

class _DataElement {
  const _DataElement({this.name, this.time, this.colorOfSlice});

  final String name;
  final double time;
  final Color colorOfSlice;
}
