import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    title: 'CommunityHub', // used by the OS task switcher
    home: HomePage(),
  ));
}


class BottomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Container (
      height: 56.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(color: Colors.blue),
      child: Row (
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
      )
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build (BuildContext context){
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
        child: Text('Hello World'),
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