import 'package:flutter/material.dart';
import 'signup.dart';

//class FirstRoute extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('First Route'),
//      ),
//      body: Center(
//        child: RaisedButton(
//          child: Text('Open route'),
//          // Within the `FirstRoute` widget
//          onPressed: () {
//            Navigator.push(
//              context,
//              MaterialPageRoute(builder: (context) => SecondRoute()),
//            );
//          },
//        ),
//      ),
//    );
//  }
//}

//NAMED ROUTE NAVIGATION ====================================
class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              color: Colors.lightBlueAccent,
              child: const Text('Login'),
              onPressed: () {
// Navigate to the second screen using a named route
                Navigator.pushNamed(context, '/home');
              }, //Route to other pages
            ),
            RaisedButton(
              color: Colors.lightBlueAccent,
              child: const Text('Sign Up'),
              onPressed: () {
// Navigate to the second screen using a named route
                Navigator.pushNamed(context, '/signup');
              },
            ),
          ],
        ),
      ),
    );
  }
}
