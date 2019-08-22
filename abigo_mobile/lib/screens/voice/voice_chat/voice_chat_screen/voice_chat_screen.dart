import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:abigo_mobile/screens/voice/voice_chat/voice_chat_message/voice_chat_message.dart';

class VoiceChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VoiceChatScreenState();
}

class VoiceChatScreenState extends State<VoiceChatScreen> with TickerProviderStateMixin {
  final List<VoiceChatMessage> _messages = <VoiceChatMessage>[];
  // final TextEditingController _textEditingController = new TextEditingController();
  // bool _isComposing = false;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sample Name'
        ),
        leading: Icon(Icons.account_circle), //TODO add avatar
        backgroundColor: Color.fromRGBO(35, 153, 209, 1),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            Flexible(
              child: new ListView.builder(
                padding: EdgeInsets.all(8.0),
                itemBuilder: (_, int index) => _messages[index],
                itemCount: _messages.length,
                reverse: true,
              ),
            ),
            // Divider(height: 1.0),
            // Container(
              // decoration: BoxDecoration(
                // color: Theme.of(context).cardColor,
              // ),
              // child: _buildTextComposer(),
            // ),
          ],
        ),
        decoration: Theme.of(context).platform == TargetPlatform.iOS
        ? new BoxDecoration(
          border: new Border(
            top: BorderSide(
              color: Colors.grey[200],
            )
          )
        ) 
        : null
      ),
      bottomNavigationBar: new BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () {}, 
              icon: Icon(Icons.volume_up),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.send),
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: Icon(Icons.mic),
        backgroundColor: Color.fromRGBO(35, 153, 209, 1), 
        onPressed: () {},
      ),
      floatingActionButtonLocation:
        FloatingActionButtonLocation.centerDocked,
    );
  }

  // Widget _buildTextComposer(){
  //   return IconTheme(
  //     data: new IconThemeData(color: Color.fromRGBO(35, 153, 209, 1)),
  //     child: new Container(
  //       margin: const EdgeInsets.symmetric(horizontal: 8.0),
  //       child: Row(
  //         children: <Widget>[
  //           Flexible(
  //             child: TextField(
  //               controller: _textEditingController,
  //               onChanged: (String text) {
  //                 setState(() {
  //                   _isComposing = text.length > 0;
  //                 });
  //               },
  //               onSubmitted: _handleSubmitted,
  //               decoration: InputDecoration.collapsed(
  //                 hintText: "Send Message"
  //               ),
  //             ),
  //           ),
  //           new Container(
  //             margin: new EdgeInsets.symmetric(horizontal: 4.0),
  //             child: Theme.of(context).platform == TargetPlatform.iOS ?
  //             new CupertinoButton(
  //               child: new Text("Send"),
  //               onPressed: _isComposing
  //                 ? () => _handleSubmitted(_textEditingController.text)
  //                 : null,
  //             ) :
  //             new IconButton(
  //               color: Color.fromRGBO(35, 153, 209, 1),
  //               icon: new Icon(Icons.send),
  //               onPressed: _isComposing
  //               ? () => _handleSubmitted(_textEditingController.text)
  //               : null,
  //             ),
  //           )
  //         ],
  //       ),
  //     )
  //   );
  // }

  // void _handleSubmitted(String text){
  //   _textEditingController.clear();
  //   setState(() {
  //     _isComposing = false;
  //   });
  //   VoiceChatMessage message = new VoiceChatMessage(
  //     text: text,
  //     animationController: new AnimationController(
  //       duration: new Duration(milliseconds: 400),
  //       vsync: this,
  //     ),
  //   );
  //   setState(() {
  //     _messages.insert(0, message);
  //   });
  //   message.animationController.forward();
  // }

  // void dispose(){
    // for (VoiceChatMessage message in _messages)
      // message.animationController.dispose();
    // super.dispose();
  // }
}