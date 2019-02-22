
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
//import 'package:scoped_model/scoped_model.dart';

import 'home.dart';

void main() {
  //debugPaintSizeEnabled = true; //Shows visual debugging lines when enabled.
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'CommunityHub', // used by the OS task switcher
    home: HomePage(), //Need to create an app state so that relevant page can be shown.
  ));
}




