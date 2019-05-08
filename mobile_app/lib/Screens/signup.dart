import 'package:flutter/material.dart';
// import 'package:country_pickers/country_pickers.dart';
import 'package:Abigo/Screens/chatPage.dart';
import 'package:Abigo/Screens/signup_bloc.dart';
import 'package:Abigo/Model/user.dart';
import 'package:Abigo/Bloc/bloc_provider.dart';

class SignupPage extends StatefulWidget {
  final String id;
  final bool edit;

  final SignUpBloc _bloc = SignUpBloc();

  SignupPage({Key key, this.id, this.edit}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState(id);
}

class _SignupPageState extends State<SignupPage> {
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _phonenumberController = TextEditingController();
  bool isCheckedDeaf = false;
  bool isCheckedbBlind = false;
  bool isCheckedMute = false;
  bool agreed = false;
  String radioValue = 'Mute';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  User _user;

  _SignupPageState(String id) {
    this._user = User(id);
  }

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
    return BlocProvider (
      bloc: widget._bloc,
      child: Form(
        key: _formKey,
        child: Scaffold(
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
                      // onSaved: (value) {
                        // this._user.phoneNo = value;
                      // },
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
        )
      )
    );
  }
}
