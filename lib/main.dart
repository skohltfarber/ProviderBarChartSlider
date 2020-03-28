import 'package:barslider2/schedule.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'schedule.dart';
import 'piechart.dart';
import 'slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Time Spent'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MySchedule(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          leading: Icon(Icons.menu),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: MyChart(),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(32),
              child: MySlider(),
            ),
          ],
        ),
      ),
    );
  }
}
