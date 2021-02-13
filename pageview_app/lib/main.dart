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

  PageController _controller = PageController(initialPage: 2);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: PageView(
          controller: _controller,
          scrollDirection: Axis.vertical,
          children: [
            Container(
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Text',
                  fillColor: Colors.white,
                ),
              ),
              color: Colors.white,
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.pink,
            ),
            Container(
              color: Colors.green,
            ),
          ],
        ));
  }
}
