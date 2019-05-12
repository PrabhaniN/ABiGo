import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Abigo/model/user.dart';
import 'package:Abigo/nav/nav.dart';
import 'package:Abigo/utils/auth.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  final userCollection = Firestore.instance.collection("user");
  bool isSignInVisible = false;
  bool isLoading = false;

  @override
  void initState () {
    FirebaseAuth.instance.currentUser().then((user) async {
      if(user !=null){
        var snapshot = await userCollection.document(user.uid).get();
        if(snapshot.exists){
          final User _user = User.fromSnapshot(snapshot);
          setCurrentUser(_user);
        } else {
          // print('New User');
          _gotoSignupPage(user.uid);
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
      if (isLoading) {
        print('loading');
        // return LoadingProgress(
          // color: Theme.of(context).accentColor
        // );
      } else {
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
              _signInWithGoogle();
            },
          )
        );
      }
    } else {
    return Container();
    }
  }

  void _signInWithGoogle() {
    setState(() {
      isLoading = true;
    });
    signInWithGoogle().then((user) async {
      final DocumentReference userRef = userCollection.document(user.uid);
      final DocumentSnapshot snapshot = await userRef.get();
      if (!snapshot.exists) {
        _gotoSignupPage(user.uid);
      } else {
        final User _user =User.fromSnapshot(snapshot);
        setCurrentUser(_user);
      }
    }).catchError((error) {
      setState(() {
        isLoading =false;
      });
    });
  }

  void _gotoSignupPage(String id) {
    Nav.of(context).navigateTo(context, 'signup/$id', clearStack: true, replace: true);
  }
}