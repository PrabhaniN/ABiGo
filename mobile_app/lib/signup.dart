import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              ListTile(
                title: TextFormField(
                  controller: _firstnameController,
                  validator: (value){
                    if(value.isEmpty){
                      return 'Field cannot be empty';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your first name',
                    filled: true,
                    labelText: 'First Name',
                    contentPadding: EdgeInsets.all(15.0),
                  ),
                ),
              ),
              ListTile(
                title: TextFormField(
                  controller: _lastnameController,
                  validator: (value){
                    if(value.isEmpty){
                      return 'Field cannot be empty';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your last name',
                    filled: true,
                    labelText: 'Last Name',
                    contentPadding: EdgeInsets.all(15.0),
                  ),
                ),
              ),
              ListTile(
                title: TextFormField(
                  controller: _usernameController,
                  validator: (value){
                    if(value.isEmpty){
                      return 'Field cannot be empty';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter a Username',
                    filled: true,
                    labelText: 'Username',
                    contentPadding: EdgeInsets.all(15.0),
                  ),
                ),
              ),
              ListTile(
                title: TextFormField(
                  controller: _phonenumberController,
                  validator: (value){
                    if(value.isEmpty){
                      return 'Field cannot be empty';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Guardian\'s Phone Number',
                    filled: true,
                    labelText: 'Guardian\'s Phone Number',
                    contentPadding: EdgeInsets.all(15.0),
                  ),
                ),
                // dense: true,
              ),
              ListTile(
                title: Text('Disability'),
              ),
              ListTile(
                // title: DropdownMenuItem(
                  // 
                // ),
                // title: Column(
                  // children: <Widget>[
                    // Text('data')
                  //   Expanded(
                  //     child: CheckboxListTile(
                  //       value: isCheckedbBlind,
                  //       onChanged: (value) {
                  //         setState(() {
                  //           isCheckedbBlind = value;
                  //         });
                  //       },
                  //       title: Text('Blind'),
                  //     ),
                  //   ),
                  //   Expanded(
                  //     child: Checkbox(
                  //       value: isCheckedDeaf,
                  //       onChanged: (value) {
                  //         setState(() {
                  //           isCheckedbBlind = value;
                  //         });
                  //       },
                  //     ),
                  //   ),
                  // ],
                // ),X
                // dense: false,
              ),
            ],
          ),
        ],
      ), 
    );
  }
}