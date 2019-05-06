import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'user.dart';
import 'signup.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  final userCollection = Firestore.instance.collection("user");
  bool isSignInVisible = false;
  bool isLoading = false;
  User _currentUser;

  @override
  void initState () {
    FirebaseAuth.instance.currentUser().then((user) async {
      if(user !=null){
        var snapshot = await userCollection.document(user.uid).get();
        if(snapshot.exists){
          final User _user = User.fromSnapshot(snapshot);
          setCurrentUser(_user);
        } else {
          print('New User');
          // _gotoSignupPage(user.uid);
        }
      } else {
        setState(() {
          isSignInVisible = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold( 
      body: Center(
        child: Column(
          children:<Widget>[
            Padding(
              padding: EdgeInsets.only(top: 300.0),
            ),

            Image(
              image: AssetImage('images/abigo_logo.png'),
              width: 250.0,
            ),

            _buildSignInButton(),

          ]
        ),
      )
    );
  }
  _buildSignInButton() {
    if (isSignInVisible) {
      return ButtonTheme(
        minWidth: 50.0,
        height: 50.0,
        child: RaisedButton(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Image(
                width: 17.0,
                image: AssetImage('images/google.png'),
              ),
              Text(
                'Sign In',
                style: TextStyle(
                  // color: Colors.white
                ),
              )
            ],
          ),
          onPressed: (){
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => SignupPage())
            );
          },
        )
      );
    } else {
      print('Load Page');
    }
  }

  void setCurrentUser(User user){
    _currentUser = user;
  }

  // void _gotoSignupPage(String id) {
    // Nav.of(context).navigateTo(context, "/onboard/$id", clearStack: true, replace: true);
  // }
}