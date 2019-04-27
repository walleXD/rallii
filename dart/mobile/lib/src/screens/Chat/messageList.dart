import 'package:flutter/material.dart';

class MessageListScreen extends StatelessWidget {
  MessageListScreen({Key key}) : super(key: key);

  Widget _buildAppBar(BuildContext context) => AppBar(
        title: Text(
          "Chats",
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.people),
            onPressed: () => Navigator.pushNamed(context, '/contact'),
          )
        ],
      );

  Widget _buildTile(BuildContext context, index) => ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            "https://randomuser.me/api/portraits/thumb/men/$index.jpg",
          ),
        ),
        title: Text(
          "hello $index",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('A strong animal $index'),
        trailing: Icon(Icons.check_circle),
        onTap: () {},
      );

  List<Widget> _buildListTile(BuildContext context) => ListTile.divideTiles(
        context: context,
        tiles: List<ListTile>.generate(
          100,
          (i) => _buildTile(context, i),
        ),
      ).toList();

  Widget _buildListView(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: _buildListTile(context),
    );
  }

  Widget _buildFloatingActionBtn(BuildContext context) => FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildListView(context),
      floatingActionButton: _buildFloatingActionBtn(context),
    );
  }
}
