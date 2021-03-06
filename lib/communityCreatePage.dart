import 'package:flutter/material.dart';

class CreateCommunityPage extends StatefulWidget {
  @override
  _CreateCommunityPageState createState () => new _CreateCommunityPageState();
}

class _CreateCommunityPageState extends State<CreateCommunityPage> {

  final createCommunityFormKey = GlobalKey<FormState>();
  String _name, _description;

  void _goToCommunityPage(BuildContext context) {
    Navigator.pushNamed(context, '/CommunityPage');
  }

  void _submit() {
    // If for validation pass, call form save
    // for save will call onSaved method for each TextFormField
    if(createCommunityFormKey.currentState.validate()) {
      createCommunityFormKey.currentState.save();
      // Make a post request to backend server
      // On success, navigate user to newly created community page
      print(_name);
      print(_description);
      _goToCommunityPage(context);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Community'),
      ),
      body: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Form(
            key: createCommunityFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new ListTile(
                  leading: const Icon(Icons.group_add),
                  title: new TextFormField(
                    decoration: new InputDecoration(
                      hintText: "Community Name",
                      border: OutlineInputBorder(),
                      labelText: 'Community Name',
                    ),
                    validator: (input) => input.isEmpty ? 'Community Name Is Required' : null,
                    onSaved: (input) => _name = input,
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.description),
                  title: new TextFormField(
                    decoration: new InputDecoration(
                      hintText: "Community Description",
                      border: OutlineInputBorder(),
                      labelText: 'Community Description',
                    ),
                    validator: (input) => input.isEmpty ? 'Community Description Is Required' : null,
                    onSaved: (input) => _description = input,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                  ),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: RaisedButton(
                        color: Colors.red,
                        onPressed: _submit,
                        child: Text(
                          'Create Community',
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      )
                    )
                  ],
                )
              ],
            )
          ),
        ),
      ) 
    );
  }
}
