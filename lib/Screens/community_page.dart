import 'package:flutter/material.dart';

import 'chat_screen.dart';
class CommunityPage extends StatefulWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text("Community"),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(),
                    ));
              },
              icon: Icon(Icons.message))
        ],
      ),
    );
  }
}
