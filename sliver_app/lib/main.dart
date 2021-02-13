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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Sliver Text'),
          ),
          expandedHeight: 200,
        ),
        SliverToBoxAdapter(
          child: GestureDetector(
            onTap: () {
              print("On Tap");
            },
            onLongPress: () {
              print("Long press");
            },
            child: Text('Some Text'),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate(data.map((e) => e).toList())),
        SliverGrid.count(
          crossAxisCount: 3,
          childAspectRatio: 1,
          children: data.map((e) => e).toList(),
        )
      ],
    ));
  }
}
