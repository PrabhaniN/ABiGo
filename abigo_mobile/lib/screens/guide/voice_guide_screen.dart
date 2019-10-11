import 'package:flutter/material.dart';
import 'package:abigo_mobile/screens/live/live_screen.dart';

class VoiceGuideScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VoiceGuideScreenState();
}

class VoiceGuideScreenState extends State<VoiceGuideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: false,
            expandedHeight: 250.0,
            backgroundColor: Color.fromRGBO(35, 153, 209, 1),
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
                child: Text('How to use',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                    )),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 7.0 / 2.0,
            ),
            delegate: SliverChildListDelegate([
              Card(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20.0, left: 20.0),
                    ),
                    ListTile(
                      title: Text(
                        'Send a new message',
                        style: TextStyle(fontSize: 25.0),
                      ),
                      leading: Icon(
                        Icons.add,
                        size: 50.0,
                        color: Colors.black87,
                      ),
                      // subtitle: Text('description if need'),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20.0, left: 20.0),
                    ),
                    ListTile(
                      title: Text(
                        'Read unread messages',
                        style: TextStyle(fontSize: 25.0),
                      ),
                      leading: Icon(
                        Icons.drafts,
                        size: 50.0,
                        color: Colors.black87,
                      ),
                      // subtitle: Text('description if need'),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20.0, left: 20.0),
                    ),
                    ListTile(
                      title: Text(
                        'Read conversations',
                        style: TextStyle(fontSize: 25.0),
                      ),
                      leading: Icon(
                        Icons.message,
                        size: 50.0,
                        color: Colors.black87,
                      ),
                      // subtitle: Text('description if need'),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LiveScreen(),
            ),
          );
        },
        label: Text(
          'Next',
          style: TextStyle(fontSize: 20.0),
        ),
        icon: Icon(
          Icons.navigate_next,
          size: 30.0,
        ),
        backgroundColor: Color.fromRGBO(35, 153, 209, 1),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
