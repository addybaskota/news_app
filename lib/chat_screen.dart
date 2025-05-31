import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String userName;
  const ChatScreen({super.key,required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userName),
      ),
    );


  }
}

