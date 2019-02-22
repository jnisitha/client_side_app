import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: SearchBar());
            },
          )
        ],
      ),
      backgroundColor: Colors.lightBlue[50],
      body:
          Center(child: HomeBody()), //prolly a better way of doing this exists.
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
    return Container(
        child: Column(
      children: <Widget>[
        Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[requestServiceRentalButtons]),
        Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CommunityFeedList()]),
        //ListView()
      ],
    ));
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

class CommunityFeedList extends StatefulWidget {
  /* This is the list of all the favorited/liked communities of the current User.const
      Changes based on his/her interests and likes which can also change.
   */

  @override
  _CommunityFeedList createState() => _CommunityFeedList();
}

class _CommunityFeedList extends State<CommunityFeedList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 467.0,
        width: 300.0,
        child: Card(
            child: ListView.builder(
          padding: EdgeInsets.all(8.0),
          itemExtent: 20.0,
          itemBuilder: (BuildContext context, int index) {
            if (index.isOdd) return Divider();

            return CommunityFeedListTile();
          },
        )));
  }
}

class CommunityFeedListTile extends StatefulWidget {
  /*  This Widget displays an individual communities feed which is/can be related to the current users interests.
      It changes based on the postings in the Community page.
  */
  @override
  _CommunityFeedListTile createState() => _CommunityFeedListTile();
}

class _CommunityFeedListTile extends State<CommunityFeedListTile> {
  //consider cards.
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.accessibility_new),
      title: Text("This is A community and it's feed"),
      onTap: () {},
    );
  }
}
