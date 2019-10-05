import 'package:abigo_mobile/state/input_method_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:abigo_mobile/data/pref.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    InputMethodState inputMethodState = Provider.of<InputMethodState>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          Image.asset(
            'assets/images/abigo_logo.png',
            width: 250.0,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '\"Hello\"',
            style: TextStyle(fontSize: 40.0, color: Colors.black87),
          ),
          SizedBox(
            height: 35,
          ),
          Text(
            'Select an input type',
            style: TextStyle(fontSize: 20.0, color: Colors.black87),
          ),
          Center(
            child: ButtonBar(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                OutlineButton.icon(
                  padding: EdgeInsets.all(10.0),
                  icon: const Icon(
                    Icons.mic,
                    size: 20.0,
                    color: Colors.black87,
                  ),
                  label: const Text(
                    'Voice',
                    style: TextStyle(fontSize: 20.0, color: Colors.black87),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  borderSide: BorderSide(
                      color: Color.fromRGBO(35, 153, 209, 1), width: 1.5),
                  onPressed: () =>
                      inputMethodState.setInputMethod(Pref.INPUT_METHOD_VOICE),
                ),
                OutlineButton.icon(
                  padding: EdgeInsets.all(10.0),
                  icon: const Icon(
                    Icons.text_fields,
                    size: 20.0,
                    color: Colors.black87,
                  ),
                  label: const Text(
                    'Text',
                    style: TextStyle(fontSize: 20.0, color: Colors.black87),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  borderSide: BorderSide(
                      color: Color.fromRGBO(35, 153, 209, 1), width: 1.5),
                  onPressed: () => inputMethodState
                      .setInputMethod(Pref.INPUT_METHOD_KEYBOARD),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
