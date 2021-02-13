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
      title: 'Flutter Navigation',
      initialRoute: '/',
      onUnknownRoute: (RouteSettings settingss) {
        return MaterialPageRoute(builder: (BuildContext context) {
          return NotFound();
        });
      },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case HomePage.routeName:
            return MaterialPageRoute(
              builder: (BuildContext context) {
                return HomePage();
              },
            );
            break;
          case BlogPage.routeName:
            return MaterialPageRoute(
              builder: (BuildContext context) {
                return BlogPage();
              },
            );
            break;
          case AboutPage.routeName:
            final args = settings.arguments as Map<String, dynamic>;
            //print(args);
            return MaterialPageRoute(
              builder: (BuildContext context) {
                if (args != null && args.containsKey('id')) {
                  return AboutPage(id: args['id']);
                }
                return AboutPage();
              },
            );
            break;
          default:
            return MaterialPageRoute(
              builder: (BuildContext context) {
                return NotFound();
              },
            );
            break;
        }
      },
      // routes: {
      //   '/': (BuildContext context) => HomePage(),
      //   '/about': (BuildContext context) => AboutPage(),
      //   '/blog': (BuildContext context) => BlogPage(),
      // },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  static const routeName = '/';
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              RaisedButton(
                child: Text('About'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/about');
                },
              ),
              RaisedButton(
                child: Text('Blog'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/blog');
                },
              ),
              RaisedButton(
                child: Text('Not'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/not');
                },
              ),
              RaisedButton(
                child: Text('With args about'),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    '/about',
                    arguments: {'id', 5234234242343},
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AboutPage extends StatefulWidget {
  static const routeName = '/about';
  AboutPage({Key key, this.id}) : super(key: key);
  final int id;

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: widget.id != null
            ? Text('About Page ${widget.id}')
            : Text('About Page '),
      ),
    );
  }
}

class BlogPage extends StatefulWidget {
  static const routeName = '/blog';
  BlogPage({Key key}) : super(key: key);

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //automaticallyImplyLeading: false,
          ),
      body: Center(
        child: Text('BlogPage'),
      ),
    );
  }
}

class NotFound extends StatelessWidget {
  const NotFound({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('NotFound'),
      ),
    );
  }
}
