import 'package:flutter/material.dart';

class MessageListScreen extends StatelessWidget {
  MessageListScreen({Key key}) : super(key: key);

  /// builds out the appbar
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

  /// builds out each tile in list view
  Widget _buildTile(BuildContext context, int index) => ListTile(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
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
        onTap: () => Navigator.pushNamed(context, '/$index'),
      );

  /// builds out all the tiles in list view
  List<Widget> _buildListTile(BuildContext context) => ListTile.divideTiles(
        context: context,
        tiles: List<ListTile>.generate(
          100,
          (i) => _buildTile(context, i),
        ),
      ).toList();

  /// builds list view
  Widget _buildListView(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: _buildListTile(context),
    );
  }

  /// builds floating action btn
  Widget _buildFloatingActionBtn(BuildContext context) => FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      );

  /// builds out the screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildListView(context),
      floatingActionButton: _buildFloatingActionBtn(context),
    );
  }
}
