import 'package:flutter/material.dart';
//import 'package:scoped_model/scoped_model.dart';
import 'login.dart';
import 'home.dart';
import 'signup.dart';
import 'communityPage.dart';
import 'communityCreatePage.dart';

void main() {
  //debugPaintSizeEnabled = true; //Shows visual debugging lines when enabled.
  runApp(MaterialApp(

      // Start the app with the "/" named route.
      initialRoute: '/',  //Should be login page for now.
      routes: {
        // When we navigate to the "/" route, build the FirstScreen Widget
        '/': (context) => LoginPage(),
        // When we navigate to the "/second" route, build the SecondScreen Widget
        '/signup': (context) => SignUpPage(),
        '/home' : (context) => HomePage(),
        '/CreateCommunityPage': (context) => CreateCommunityPage(),
        '/CommunityPage': (context) => CommunityPage()
      },

    debugShowCheckedModeBanner: false,
    title: 'CommunityHub', // used by the OS task switcher
    //home: FirstRoute(), //Need to create an app state so that relevant page can be shown.
  ));
}