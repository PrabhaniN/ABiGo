import 'package:flutter/material.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'chatPage.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _phonenumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isCheckedDeaf = false;
  bool isCheckedbBlind = false;
  bool isCheckedMute = false;
  bool agreed = false;
  String radioValue = 'Mute';

  void handleRadioValueChanged(String value) {
    setState(() {
      radioValue = value;
    });
  }

  // Widget _buildDropdownItem(Country country) => Container(
  // child: Row(
  // children: <Widget>[
  // CountryPickerUtils.getDefaultFlagImage(country),
  // SizedBox(
  // width: 8.0,
  // ),
  // Text("+${country.phoneCode}(${country.isoCode})"),
  // ],
  // ),
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Sign-Up'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 50.0),
          ),
          Column(
            children: <Widget>[
              ListTile(
                title: TextFormField(
                  cursorColor: Colors.blue[900],
                  controller: _emailController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Field cannot be empty';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    labelText: 'Email',
                    contentPadding: EdgeInsets.all(15.0),
                  ),
                ),
              ),
              ListTile(
                title: TextFormField(
                  cursorColor: Colors.blue[900],
                  controller: _passwordController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Field cannot be empty';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter a password',
                    labelText: 'Password',
                    contentPadding: EdgeInsets.all(15.0),
                  ),
                  obscureText: true,
                ),
              ),
              ListTile(
                title: TextFormField(
                  cursorColor: Colors.blue[900],
                  controller: _firstnameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Field cannot be empty';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your first name',
                    labelText: 'First Name',
                    contentPadding: EdgeInsets.all(15.0),
                  ),
                ),
              ),
              ListTile(
                title: TextFormField(
                  cursorColor: Colors.blue[900],
                  controller: _lastnameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Field cannot be empty';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your last name',
                    labelText: 'Last Name',
                    contentPadding: EdgeInsets.all(15.0),
                  ),
                ),
              ),
              ListTile(
                title: TextFormField(
                  controller: _usernameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Field cannot be empty';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter a Username',
                    labelText: 'Username',
                    contentPadding: EdgeInsets.all(15.0),
                  ),
                ),
              ),
              ListTile(
                title: TextFormField(
                  cursorColor: Colors.blue[900],
                  controller: _phonenumberController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Field cannot be empty';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Guardian\'s Phone Number',
                    labelText: 'Guardian\'s Phone Number',
                    contentPadding: EdgeInsets.all(15.0),
                  ),
                ),
                // dense: true,
                // title: CountryPickerDropdown(
                // initialValue: 'tr',
                // itemBuilder: _buildDropdownItem,
                // onValuePicked: (Country country) {
                // print("${country.name}");
                // },
                // ),
              ),
              ListTile(
                contentPadding: EdgeInsets.only(
                    left: 30.0), //expantion panel with disabilities
                title: Text('Disability'),
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                  ),
                  Radio<String>(
                    value: 'Mute',
                    groupValue: radioValue,
                    onChanged: handleRadioValueChanged,
                    activeColor: Colors.blue[900],
                  ),
                  Text('Mute'),
                  Radio<String>(
                    value: 'Deaf',
                    groupValue: radioValue,
                    onChanged: handleRadioValueChanged,
                    activeColor: Colors.blue[900],
                  ),
                  Text('Deaf'),
                  Radio<String>(
                    value: 'Blind',
                    groupValue: radioValue,
                    onChanged: handleRadioValueChanged,
                    activeColor: Colors.blue[900],
                  ),
                  Text('Blind'),
                  ],
                )
              ),

              ListTile(
                title: Row(
                  children: <Widget>[
                    Checkbox(
                      activeColor: Colors.blue[900],
                      value: agreed,
                      onChanged: (value) {
                        setState(() {
                          agreed = value;
                        });
                      },
                    ),
                    Text('I agree to the terms and conditions')
                  ],
                )
              ),

              ListTile(
                title: RaisedButton(

                  color: Colors.blue[900],
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                    ),
                  ),
                  onPressed: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => ChatPage())
                    );
                  },
                ),
              )

            ],
          ),
        ],
      ),
    );
  }
}
