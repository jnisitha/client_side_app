import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'CommunityHub', // used by the OS task switcher
    home: HomePage(),
  ));
}

class BottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 56.0,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(color: Colors.lightBlue),
        child: Row(
          children: <Widget>[
            Expanded(
              child: IconButton(
                icon: Icon(Icons.search),
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.favorite),
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.message),
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.supervisor_account),
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.add),
              ),
            ),
          ],
        ));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        leading:IconButton(
//          icon: Icon(Icons.menu),
//          tooltip: 'Navigation menu',
//          onPressed: null,
//        ),
//        title: Text("Example"),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.search),
//            tooltip: 'Search',
//            onPressed: null,
//          ),
//        ],
//      ),
      body: Center(
        child: Counter(),
      ),
      bottomNavigationBar: BottomAppBar(),
//      floatingActionButton: FloatingActionButton(
//        tooltip: 'Add',
//        child: Icon(Icons.add),
//        onPressed: null,
//      ),
    );
  }
}

class Counter extends StatefulWidget {
  // This class is the configuration for the state. It holds the
  // values (in this case nothing) provided by the parent and used by the build
  // method of the State. Fields in a Widget subclass are always marked "final".

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      // This call to setState tells the Flutter framework that
      // something has changed in this State, which causes it to rerun
      // the build method below so that the display can reflect the
      // updated values. If we changed _counter without calling
      // setState(), then the build method would not be called again,
      // and so nothing would appear to happen.
      _counter++;
      print('in setState');
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance
    // as done by the _increment method above.
    // The Flutter framework has been optimized to make rerunning
    // build methods fast, so that you can just rebuild anything that
    // needs updating rather than having to individually change
    // instances of widgets.
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
            child: RaisedButton(
                onPressed: _increment,
                child: Text('Increment'),
                color: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 10.0))),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0)
        ),
        Text('Count: $_counter', textAlign: TextAlign.center),
      ],
    );
  }
}
