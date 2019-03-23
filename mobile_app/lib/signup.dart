import 'package:flutter/material.dart';
import 'home.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _firstnameController =TextEditingController();
  final _lastnameController =TextEditingController();
  final _usernameController =TextEditingController();
  final _phonenumberController =TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isCheckedDeaf = false;
  bool isCheckedbBlind = false;
  bool isCheckedMute = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Sign-Up'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: _firstnameController,
              validator: (value) {
                if(value.isEmpty) {
                  return 'Enter a valid name';
                }
              },
              decoration: InputDecoration(
                hintText: 'Enter your First name',
                filled: true,
                contentPadding: EdgeInsets.all(10.0)
              ),
            ),
            SizedBox(
              height: 10.0,
            ),

            TextFormField(
              controller: _lastnameController,
              validator: (value) {
                if(value.isEmpty) {
                  return 'Enter a valid name';
                }
              },
              decoration: InputDecoration(
                hintText: 'Enter your Last name',
                filled: true,
                contentPadding: EdgeInsets.all(10.0)
              ),
            ),
            SizedBox(
              height: 10.0,
            ),

            TextFormField(
              controller: _usernameController,
              validator: (value) {
                if(value.isEmpty) {
                  return 'Enter a valid username';
                }
              },
              decoration: InputDecoration(
                hintText: 'Enter your username',
                filled: true,
                contentPadding: EdgeInsets.all(10.0)
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: _phonenumberController,
              validator: (value) {
                if(value.isEmpty) {
                  return 'Enter a valid phone number';
                }
              },
              decoration: InputDecoration(
                hintText: 'Enter Guardian\'s phone',
                filled: true,
                contentPadding: EdgeInsets.all(10.0)
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                    child: Text('Disability'),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  new Row(
                    children: <Widget>[
                      new Checkbox(
                        value: isCheckedbBlind,
                        onChanged: (value) {
                          setState(() {
                            isCheckedbBlind = value;
                          });
                        },
                      ),
                      new Text('Blind'),
                      SizedBox(
                        width: 60.0,
                      ),

                      new Checkbox(
                        value: isCheckedMute,
                        onChanged: (value) {
                          setState(() {
                            isCheckedMute = value;
                          });
                        },
                      ),
                      new Text('Mute'),
                      SizedBox(
                        width: 60.0,
                      ),
                      
                      new Checkbox(
                        value: isCheckedDeaf,
                        onChanged: (value) {
                          setState(() {
                            isCheckedDeaf = value;
                          });
                        },
                      ),
                      new Text('Deaf'),
                    ],
                  ),
                ],
              ),
            ),
            // SizedBox(
              // height: 10,
            // ),
            ButtonTheme(
              height: 35.0,
              minWidth: 105.0,
              buttonColor: Colors.blue[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)
              ),
              child: RaisedButton(
                textColor: Colors.white,
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Roboto'
                  ),
                ),
                onPressed: (){
                  if(_formKey.currentState.validate()){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                  }
                },
              ),
            ),
          ],
        ),
      ), 
    );
  }
}