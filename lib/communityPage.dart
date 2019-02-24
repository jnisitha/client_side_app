import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class CardData {
  String _title, _description;
  CardData(this._title, this._description);

  String get title {
    return _title;
  }

  String get description {
    return _description;
  }
}

class CommunityPage extends StatefulWidget {
  @override
  CommunityPageState createState() => new CommunityPageState();
}

class CommunityPageState extends State<CommunityPage> {
  var cardDataList = <CardData>[];
  int toListView = 0;
  int upper = 0;

  @override
  void initState() {
    super.initState();
    fetchNext();
  }

  final String communityName = 'Birchmount Community Centre';
  final String communityDescription =
      'The Birchmount Community Centre is a multipurpose facility with programs & services offered through the Birchmount Bluffs Neighbourhood Centre.';

  Widget _buildCard(String title, String description) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.textsms),
        title: Text(title),
        subtitle: Text(description),
      ),
    );
  }

  fetchNext() async {
    String jsonCommunityDataResponse = await rootBundle.loadString('data/community.json');
    if (jsonCommunityDataResponse.isNotEmpty) {
      final jsonResult = json.decode(jsonCommunityDataResponse);

      if (toListView < jsonResult['requests'].length) {
          String title = jsonResult['requests'][toListView]['title'].toString();
          String description =
              jsonResult['requests'][toListView]['description'].toString();

          print("title=" + title);
          print("description=" + description);

          setState(() {
            cardDataList.add(new CardData(title, description));
            toListView += 1;
          });
      }
    } else {
      throw Exception('Failed to load JSON file');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(communityName),
        ),
        body: ListView.builder(
            itemCount: cardDataList.length + 1, // 2
            itemBuilder: (context, i) {
              // 0,1
              if (i == 0) {
                return Column(children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage("assets/birchmountCommunity.png"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      communityName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Text(
                      communityDescription,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
                    child: ButtonBar(
                        alignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () => {},
                            child: Text('Request',
                                style: TextStyle(color: Colors.white)),
                            color: Colors.red,
                          ),
                          RaisedButton(
                            onPressed: () => {},
                            child: Text('Service',
                                style: TextStyle(color: Colors.white)),
                            color: Colors.red,
                          ),
                          RaisedButton(
                            onPressed: () => {},
                            child: Text('Rental',
                                style: TextStyle(color: Colors.white)),
                            color: Colors.red,
                          ),
                        ]),
                  )
                ]);
              } else {
                if (i >= (cardDataList.length - 5)) {
                  print("cardDataList length=" + cardDataList.length.toString());
                  print("Current i=" + i.toString());
                  fetchNext();
                }

                return _buildCard(
                    cardDataList[i - 1].title, cardDataList[i - 1].description);
              }
            }));
  }
}
