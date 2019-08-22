import 'package:flutter/material.dart';

import 'package:abigo_mobile/screens/text/text_chats/text_chats_list/text_chats_list.dart';

class Signup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignupState();
}

class SignupState extends State<Signup> {
  final _nameController = TextEditingController();
  final _phoneNoController = TextEditingController();
  bool agreed =  false;
  String radioValue = 'Mute';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(35, 153, 209, 1),
        title: Text(
          'Sign Up with ABiGo',
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 50.0),
          ),
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 5.0, 10.0),
            title: TextFormField(
              cursorColor: Colors.blue[900],
              controller: _nameController,
              // validator: _validateValue,
              // onSaved: (value) {
              // this._user.name = value;
              // },
              //TODO color
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                // hintText: 'Enter a name',
                labelText: 'Name',
                contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 5.0, 10.0),
              ),
              keyboardType: TextInputType.text,
            ),
          ),

          ListTile(
            contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 5.0, 10.0),
            title: TextFormField(
              cursorColor: Color.fromRGBO(35, 153, 209, 1),
              controller: _phoneNoController,
              //TODO color
              decoration: InputDecoration(
                icon: Icon(Icons.phone),
                // hintText: 'Enter a username',
                labelText: 'Phone Number',
                contentPadding: EdgeInsets.all(15.0),
              ),
              keyboardType: TextInputType.number,
            ),
          ),

          ListTile(
            contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 5.0, 10.0),
            title: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                ),
                Radio<String>(
                  value: 'false',
                  groupValue: radioValue,
                  onChanged: handleRadioValueChanged,
                  activeColor: Color.fromRGBO(35, 153, 209, 1),
                ),
                Text('Mute'), //change to formal

                Radio<String>(
                  value: 'Deaf',
                  groupValue: radioValue,
                  onChanged: handleRadioValueChanged,
                  activeColor: Color.fromRGBO(35, 153, 209, 1),
                ),
                Text('Deaf'), //change to formal

                Radio<String>(
                  value: 'Blind',
                  groupValue: radioValue,
                  onChanged: handleRadioValueChanged,
                  activeColor: Color.fromRGBO(35, 153, 209, 1),
                ),
                Text('Blind'), //change to formal

              ],
            )
          ),

          ListTile(
            title: Row(
              children: <Widget>[
                Checkbox(
                  activeColor: Color.fromRGBO(35, 153, 209, 1),
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
              color: Color.fromRGBO(35, 153, 209, 1),
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                ),
              ),
              onPressed: (){
                // _submit();
                Navigator.push(context, MaterialPageRoute(builder: (context) => TextChatsList()));
              },
            ),
          )

        ],
      ),
    );
  }

  handleRadioValueChanged(String value) {
    setState(() {
      radioValue = value;
    });
  }
}
