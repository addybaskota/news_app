import 'package:flutter/material.dart';
import 'package:project1/chat_screen.dart';

class chats extends StatelessWidget {
  chats({super.key});

  final List<Map> user = [
    {
      "name": "rofida mo",
      "massage": "how are you",
      "time": "12:12 bm",
    },
    {
      "name": "anas youssef",
      "massage": "hello mamy",
      "time": "01:01 am",
    },
    {
      "name": "youssef",
      "massage": "how are you",
      "time": "12:16 bm",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3, child:Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("MY chats"),
        bottom: TabBar(tabs: [
          Tab( text: "Updates",),

          Tab( text: "Calls",),
        ],),
      ),
      body: TabBarView(children: [
      ListView.builder(
      padding: EdgeInsets.all(20.0),
        itemCount: user.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=> ChatScreen(userName: user[index]["name"],))
              );
            },
            child: Card(
              child: ListTile(
                leading: Image(image: AssetImage("assets/images/photo.jpg")),
                title: Text(user[index]["name"]),
                subtitle: Text(user[index]["massage"]),
                trailing: Text(user[index]["time"]),
              ),
            ),
          );}
            ),
      ])
    ),
    );  }
}
