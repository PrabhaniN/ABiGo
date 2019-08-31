import 'package:flutter/material.dart';

import 'package:abigo_mobile/screens/voice/voice_chat/voice_chat_screen/voice_chat_screen.dart';

class VoiceChatList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VoiceChatListState();
}

class VoiceChatListState extends State<VoiceChatList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'ABiGo',
          ),
          backgroundColor: Color.fromRGBO(35, 153, 209, 1),
          actions: <Widget>[
            Icon(Icons.search),
            Padding(
              padding: EdgeInsets.only(left: 5.0),
            ),
            IconButton(
              icon: Icon(Icons.mic),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
        // body: GridView.count(
        //   padding: EdgeInsets.all(10.0),
        //   crossAxisCount: 1,
        //   childAspectRatio: 7.0 / 2.0,
        //   children: <Widget>[
        //     Card(
        //       child: Column(
        //         children: <Widget>[
        //           Padding(
        //             padding: EdgeInsets.only(top: 20.0, left: 20.0),
        //           ),
        //           ListTile(
        //             leading: Icon(
        //               Icons.add,
        //               size: 50.0,
        //               color: Colors.black87,
        //             ),
        //             title: Text('Start new conversation'),
        //           )
        //         ],
        //       ),
        //     ),
        //     Card(
        //       child: Column(
        //         children: <Widget>[
        //           Padding(
        //             padding: EdgeInsets.only(top: 20.0, left: 20.0),
        //           ),
        //           ListTile(
        //             leading: Icon(
        //               Icons.drafts,
        //               size: 50.0,
        //               color: Colors.black87,
        //             ),
        //             title: Text('View unread messages'),
        //           )
        //         ],
        //       ),
        //     ),
        //     Padding(
        //       padding: EdgeInsets.only(top: 50.0, bottom: 20.0),
        //     ),
        //     ListTile(
        //       leading: Icon(
        //         Icons.message,
        //         size: 30.0,
        //         color: Colors.black87,
        //       ),
        //       title: Text('Recent messages'),
        //     ),
        //     ListView(
        //       children: _buildListCards(10),
        //     ),
        //   ],
        // ),
        body: CustomScrollView(
          slivers: <Widget>[
            // SliverGrid.count(
            // crossAxisCount: 1,
            // ),
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
                        leading: Icon(
                          Icons.add,
                          size: 50.0,
                          color: Colors.black87,
                        ),
                        title: Text('Start new conversation'),
                      )
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
                        leading: Icon(
                          Icons.drafts,
                          size: 50.0,
                          color: Colors.black87,
                        ),
                        title: Text('View unread messages'),
                      )
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
                        leading: Icon(
                          Icons.message,
                          size: 50.0,
                          color: Colors.black87,
                        ),
                        title: Text('Recent messages'),
                      )
                    ],
                  ),
                ),
              ]),
            ),
            // SliverList(
            // delegate: SliverChildListDelegate([
            // ListTile(
            // title: Text(
            // 'Recent messages'
            // ),
            // leading: Icon(
            // Icons.message,
            // size: 30.0,
            // color: Colors.black87,
            // ),
            // )
            // ]),
            // ),
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Card(
                  child: _buildCard(),
                );
              }, childCount: 10),
            )
          ],
        ));
  }

  Widget _buildStack() => Stack(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/abigo_logo.png'),
            radius: 40.0,
          ),
        ],
      );

  Widget _buildCard() => SizedBox(
        height: 80.0,
        child: Card(
          child: ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => VoiceChatScreen()));
            },
            title: Text(
              'Name',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text('Sample Text'),
            leading: _buildStack(),
            contentPadding: EdgeInsets.fromLTRB(5.0, 6.0, 5.0, 2.0),
          ),
        ),
      );

  // List<Card> _buildListCards(int count){
  // List<Card> card =List.generate(
  // count,
  // (int index) => Card(
  // child: _buildCard(),
  // )
  // );
  // return card;
  // }
}
