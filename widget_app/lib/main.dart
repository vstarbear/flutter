import 'package:flutter/material.dart';

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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> tabBarNav = [
    {'title': Text('PHOTO'), 'icon': Icon(Icons.home)},
    {'title': Text('CHAT'), 'icon': Icon(Icons.chat)},
    {'title': Text('ALBOMS'), 'icon': Icon(Icons.album)},
  ];

  TabController _tabController;
  int _currentTabIndex = 0;
  bool _isPain = false;

  void initState() {
    super.initState();
    _tabController = TabController(
      length: tabBarNav.length,
      vsync: this,
      initialIndex: 0,
    );
    _tabController.addListener(_tabListener);
  }

  _tabListener() {
    setState(() {
      _currentTabIndex = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.red,
                    backgroundImage: NetworkImage('https://picsum.photos/200'),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_forward),
              title: Text('Home'),
              onTap: () {
                print('ON TAP');
              },
              onLongPress: () {
                print('ON LONGPRESS');
              },
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Container(
            color: Colors.green,
            child: Center(child: _isPain ? Text("SUCSESFULL") : null),
          ),
          Container(
            color: Colors.purple,
          ),
          Container(
            color: Colors.grey,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          print(index);
          setState(() {
            _tabController.index = index;
            _currentTabIndex = index;
          });
        },
        currentIndex: _currentTabIndex,
        items: tabBarNav
            .map(
              (item) => BottomNavigationBarItem(
                icon: item['icon'],
                title: item['title'],
              ),
            )
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 200,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.payment),
                      title: Text('SUM'),
                      trailing: Text('200rub'),
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(
                          () {
                            _isPain = true;
                          },
                        );
                        Navigator.of(context).pop();
                      },
                      child: Text('PAY'),
                    )
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.plus_one),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
