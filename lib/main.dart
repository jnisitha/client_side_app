import 'package:flutter/material.dart';
import 'communityPage.dart';
import 'communityCreatePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
      routes: <String, WidgetBuilder> {
        "/CreateCommunityPage": (BuildContext context) => new CreateCommunityPage(),
        "/CommunityPage": (BuildContext context) => new CommunityPage()
      }
    );
  }
}

class MyHomePage extends StatelessWidget {
  void _goToCreateCommunityPage(BuildContext context) {
    Navigator.pushNamed(context, '/CreateCommunityPage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Communities Branch'),
      ),
      body: Center(
        child: Text('Create your first community')
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _goToCreateCommunityPage(context),
        tooltip: 'Create A Community',
        child: Icon(Icons.add),
      ),
    );
  }
}

