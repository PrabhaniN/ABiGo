import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:Abigo/screens/chatmessage/chatMessage.dart';
// import 'package:Abigo/Screens/chats/chatPage.dart';
import 'package:Abigo/widgets/drawer.dart';
// import 'theme.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textEditingController = new TextEditingController();
  bool _isComposing =false;
  @override
  // void dispose(){
    // for (ChatMessage message in _messages)
      // message.animationController.dispose();
    // super.dispose();
  // }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: _buildStack(),
        title: Text('Samanthi'),
        backgroundColor: Colors.blue[900],
        // elevation: Theme.of(context).platform ==TargetPlatform.android ? 4.0 : 0.0,
      ),

      drawer: CustomDrawer(),
      
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
            Divider(height: 1.0),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
              ),
              child: _buildTextComposer(),
            ),
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
    );
  }
  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(
        color: Theme.of(context).accentColor
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        // height: 10.0,
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: TextEditingController(),
                onChanged: (String text) {
                  setState(() {
                    _isComposing = text.length > 0;
                  });
                },
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(
                  hintText: 'Send Message'
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: _isComposing
                ? () => _handleSubmitted(_textEditingController.text)
                :null,
              ),
              // child: Theme.of(context).platform == TargetPlatform.iOS
              // ? new CupertinoButton(
                // child: Text('Send'),
                // onPressed: _isComposing
                // ? () => _handleSubmitted(_textEditingController.text)
                // : null,
              // ):
              // new IconButton(
                // icon: new Icon(Icons.send),
                // onPressed: _isComposing
                // ? () => _handleSubmitted(_textEditingController.text)
                // : null,
              // ),
            ),
          ],
        ),
      ),
    );
  }
  void _handleSubmitted(String text) {
    _textEditingController.clear();
    setState(() {
      _isComposing =false;
    });
    ChatMessage message = new ChatMessage(
      text: text,
      animationController: new AnimationController(
        duration: new Duration(milliseconds: 400),
        vsync: this,
      ),
    );
    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }
}