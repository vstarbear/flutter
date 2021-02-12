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
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
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
  final List<Map<String, dynamic>> tabBar = [
    {'title': 'Home', 'icon': CupertinoIcons.home},
    {'title': 'Home', 'icon': CupertinoIcons.folder},
    {'title': 'Home', 'icon': CupertinoIcons.mail},
  ];

  List<Nav> _nav;

  @override
  void initState() {
    super.initState();
    _nav = tabBar.map((item) => Nav.fromMap(item)).toList();
    print(_nav);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: _nav.map((item) {
          return BottomNavigationBarItem(
            title: Text(item.title),
            icon: Icon(item.icon),
          );
        }).toList(),
      ),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return HomeView();
            break;
          case 1:
            return FilesView();
            break;
          case 2:
            return EmailView();
            break;
        }
      },
    );
  }
}

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _isPaid = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: <Widget>[
        if (_isPaid) Text('Successful'),
        CupertinoButton(
            color: CupertinoColors.activeBlue,
            child: Text('Button'),
            onPressed: () {
              showCupertinoModalPopup(
                  context: context,
                  filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                  builder: (BuildContext context) {
                    return Material(
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        color: CupertinoColors.white,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              trailing: Text('200 rub'),
                              title: Text(
                                'SUM',
                              ),
                            ),
                            FlatButton(
                              child: Text('PAY'),
                              onPressed: () {
                                setState(() {
                                  _isPaid = true;
                                });
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            })
      ],
    ));
  }
}
//class HomeView extends StatelessWidget {
//  const HomeView({Key key}) : super(key: key);

//}

class FilesView extends StatelessWidget {
  const FilesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('FilesView'),
    );
  }
}

class EmailView extends StatelessWidget {
  const EmailView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('EmailView'),
    );
  }
}

class Nav {
  final String title;
  final IconData icon;

  Nav({this.title, this.icon});

  Nav.fromMap(Map<String, dynamic> json)
      : this(
          title: json['title'],
          icon: json['icon'],
        );
}
