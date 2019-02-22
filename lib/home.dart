import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: HomeBody(), //prolly a better way of doing this exists.
      bottomNavigationBar: BottomAppBar(),
    );
  }
}

class HomeBody extends StatelessWidget {

  final requestServiceRentalButtons = ButtonBar(
    alignment: MainAxisAlignment.center,
    children: <Widget>[
      RaisedButton(
        color: Colors.lightBlueAccent,
        child: const Text('Request'),
        onPressed: () {}, //Route to other pages
      ),
      RaisedButton(
        color: Colors.lightBlueAccent,
        child: const Text('Service'),
        onPressed: () {},
      ),
      RaisedButton(
        color: Colors.lightBlueAccent,
        child: const Text('Rental'),
        onPressed: () {},
      ),
    ],
  );


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: SearchBar());
              },
            )
          ],
        ),
        requestServiceRentalButtons,
        //ListView()
      ],
    );
  }
}

class SearchBar extends SearchDelegate<String> {
  final communityNames = [
    "Fairview",
    "Fairbank",
    "Thatcher",
    "Colombus",
    "Bulbasaur",
    "Charmander"
  ];
  final recentCommunityNames = ["Fairbank", "Thatcher"];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //This should direct to whatever route the query gives.
    return Container(
        height: 100.0,
        width: 100.0,
        child: Card(
          color: Colors.red,
          child: Center(
            child: Text(query),
          ),
        ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentCommunityNames
        : communityNames.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
            onTap: () {
              showResults(context); //This takes you to build results.
            },
            leading: Icon(Icons.location_city),
            title: RichText(
                text: TextSpan(
                    text: suggestionList[index].substring(0, query.length),
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    children: [
                  TextSpan(
                      text: suggestionList[index].substring(query.length),
                      style: TextStyle(color: Colors.grey))
                ])),
          ),
      itemCount: suggestionList.length,
    );
  }
}

class BottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 56.0,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(color: Colors.lightBlue),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
            ),
            IconButton(
              icon: Icon(Icons.favorite),
            ),
            IconButton(
              icon: Icon(Icons.message),
            ),
            IconButton(
              icon: Icon(Icons.supervisor_account),
            ),
            IconButton(
              icon: Icon(Icons.add),
            ),
          ],
        ));
  }
}

class CommunityFeed extends StatefulWidget {

  @override
  _CommunityFeed createState() => _CommunityFeed();


}

class _CommunityFeed extends State<CommunityFeed> {

  @override
  Widget build(BuildContext context) {

  }
}