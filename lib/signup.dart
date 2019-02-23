import 'package:flutter/material.dart';
import 'signup.dart';

//=============== TUTORIAL ================== //

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPage createState() => new _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  String _email;
  String _password;

  void _SignUp(){
    final loginForm = formKey.currentState;

    if(loginForm.validate()){
      loginForm.save();

      _performSignUp();
      Navigator.pushNamed(context, '/home');
    }
  }

  void _performSignUp(){
    final snackbar = SnackBar(
      content: Text("Email: $_email, password: $_password"),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text("Sign Up"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    //THIS ============== might just pass to firebase.
                    TextFormField(
                      decoration: InputDecoration(labelText: "Email"),
                      validator: (val)=> !val.contains('@')?'Invalid Email':null,
                      onSaved: (val)=> _email = val,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Password"),
                      validator: (val)=> val.length<6 ? 'Please enter a password longer than 6 characters':null,
                      onSaved: (val)=> _password = val,
                      obscureText: true,
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 15.0)
                    ),
                    RaisedButton(
                        color: Colors.lightBlue,

                        child: Text("Sign Up"),
                        onPressed: () {
                          //SIGN UP LOGIC HERE.
                          _SignUp();
                        }),

                  ],
                ))));
  }
}
