import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ContactListState();
}

class ContactListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Contact'),
        actions: <Widget>[
          Icon(Icons.search),
          Icon(Icons.more_vert)
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int indext) {
                return Card(
                  child: _buildCard(),
                );
              }
            ),
          )
        ],
      )
    );
  }

  Widget _buildStack() => Stack(
    children: <Widget>[
      CircleAvatar(
        backgroundImage: AssetImage('assets/images/abigo_logo.png'),
        radius: 30.0,
      )
    ],
  );

  Widget _buildCard() => SizedBox(
    height: 80.0,
    child: Card(
      child: ListTile(
        onTap: () {},
        title: Text('Name'),
        leading: _buildStack(),
        contentPadding: EdgeInsets.fromLTRB(5.0, 6.0, 5.0, 2.0),
      ),
    ),
  );
}