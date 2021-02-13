import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  List<Widget> data = List.generate(100, (index) {
    return Card(
      color: Colors.green[100],
      elevation: 4.0,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('$index'),
          ),
        ],
      ),
    );
  });
  double _transform_y = 0;
  double _transform_x = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GestureDetector(
            // onHorizontalDragUpdate: (value) {
            //   setState(() {
            //     _transform_y = value.globalPosition.dy;
            //   });
            // },
            onLongPressMoveUpdate: (value) {
              setState(() {
                _transform_y = value.globalPosition.dy;
                _transform_x = value.globalPosition.dx;
              });
            },
            // onVerticalDragUpdate: (value) {
            //   setState(() {
            //     _transform_x = value.globalPosition.dx;
            //   });
            // },
            child: Container(height: 1000, color: Colors.green),
          ),
          Container(
            height: 40,
            width: 40,
            transform: Matrix4.translationValues(_transform_x, _transform_y, 0),
            color: Colors.pink,
          ),
        ],
      ),
    );
  }
}
