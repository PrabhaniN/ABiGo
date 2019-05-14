import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:Abigo/screens/chatmessage/chatMessage.dart';
// import 'package:Abigo/Screens/chats/chatPage.dart';
import 'package:Abigo/widgets/drawer.dart';
import 'package:Abigo/utils/theme.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textEditingController = new TextEditingController();
  bool _isComposing =false;
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: _buildStack(),
        title: Text('Samanthi'),
        backgroundColor: ThemeColors.primary,
        elevation: Theme.of(context).platform ==TargetPlatform.android ? 4.0 : 0.0,
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
  Widget _buildTextComposer(){
    return IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textEditingController,
                onChanged: (String text) {
                  setState(() {
                    _isComposing = text.length > 0;
                  });
                },
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(
                  hintText: "Send Message"
                ),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: Theme.of(context).platform == TargetPlatform.iOS ?
              new CupertinoButton(
                child: new Text("Send"),
                onPressed: _isComposing
                  ? () => _handleSubmitted(_textEditingController.text)
                  : null,
              ) :
              new IconButton(
                color: ThemeColors.primary,
                icon: new Icon(Icons.send),
                onPressed: _isComposing
                ? () => _handleSubmitted(_textEditingController.text)
                : null,
              ),
            )
          ],
        ),
      )
    );
  }
  void _handleSubmitted(String text){
    _textEditingController.clear();
    setState(() {
      _isComposing = false;
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

  void dispose(){
    for (ChatMessage message in _messages)
      message.animationController.dispose();
    super.dispose();
  }
}