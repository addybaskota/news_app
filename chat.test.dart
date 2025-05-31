


import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        hintColor: Colors.grey[400],
      ),
      home: const WhatsAppChatScreen(),
    );
  }
}

class WhatsAppChatScreen extends StatefulWidget {
  const WhatsAppChatScreen({super.key});

  @override
  State<WhatsAppChatScreen> createState() => _WhatsAppChatScreenState();
}

class _WhatsAppChatScreenState extends State<WhatsAppChatScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Chat> _chats = [
    Chat(
      name: 'Whitman Chat',
      lastMessage: 'Sarah: For the movie 🎬 or 🍿?',
      time: DateTime.now().subtract(const Duration(minutes: 5)),
      avatarUrl: 'https://via.placeholder.com/150/f0f0f0/000000?Text=W',
      unreadCount: 1,
    ),
    Chat(
      name: 'Jack Whitman',
      lastMessage: '🎬 Video',
      time: DateTime.now().subtract(const Duration(minutes: 30)),
      avatarUrl: 'https://via.placeholder.com/150/e0e0e0/000000?Text=J',
      unreadCount: 4,
    ),
    Chat(
      name: 'Jane Pearson',
      lastMessage: 'Dinner soon? 🍕🍷',
      time: DateTime.now().subtract(const Duration(hours: 1)),
      avatarUrl: 'https://via.placeholder.com/150/d0d0d0/000000?Text=JP',
    ),
    Chat(
      name: 'Thomas Stewart',
      lastMessage: '🖼️ GIF',
      time: DateTime.now().subtract(const Duration(hours: 2)),
      avatarUrl: 'https://via.placeholder.com/150/c0c0c0/000000?Text=TS',
      unreadCount: 2,
    ),
    Chat(
      name: 'Francis Whitman',
      lastMessage: '✔️✔️ pls tell me you follow SingleCare...',
      time: DateTime.now().subtract(const Duration(days: 1)),
      avatarUrl: 'https://via.placeholder.com/150/b0b0b0/000000?Text=FW',
    ),
    Chat(
      name: 'Alice Whitman',
      lastMessage: 'Mom: How was this 10 yrs ago??',
      time: DateTime.now().subtract(const Duration(days: 1)),
      avatarUrl: 'https://via.placeholder.com/150/a0a0a0/000000?Text=AW',
    ),
    Chat(
      name: 'Jane Whitman',
      lastMessage: 'Did you watch the game?',
      time: DateTime.now().subtract(const Duration(days: 1)),
      avatarUrl: 'https://via.placeholder.com/150/909090/000000?Text=JW',
    ),
    Chat(
      name: 'Victor Whitman',
      lastMessage: '✔️✔️ Let\'s chat about it another time.',
      time: DateTime.now().subtract(const Duration(days: 2)),
      avatarUrl: 'https://via.placeholder.com/150/808080/000000?Text=VW',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('WhatsApp'),
            actions: [
        IconButton(icon: const Icon(Icons.camera_alt_outlined), onPressed: () {}),
    IconButton(icon: const Icon(Icons.search), onPressed: () {}),
    PopupMenuButton<String>(
    onSelected: (value) {
    // Handle menu item selection
    },
    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
    const PopupMenuItem<String>(
    value: 'new_group',
    child: Text('New group'),
    ),
    const PopupMenuItem<String>(
    value: 'new_broadcast',
    child: Text('New broadcast'),
    ),
    const PopupMenuItem<String>(
    value: 'linked_devices',
      child: Text('Linked devices'),
    ),
      const PopupMenuItem<String>(
        value: 'starred_messages',
        child: Text('Starred messages'),
      ),
      const PopupMenuItem<String>(
        value: 'settings',
        child: Text('Settings'),
      ),
    ],
    ),
            ],
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Chats'),
              Tab(text: 'Updates'),
              Tab(text: 'Calls'),
            ],
          ),
        ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Chats Tab
          ListView.builder(
            itemCount: _chats.length,
            itemBuilder: (context, index) {
              final chat = _chats[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(chat.avatarUrl),
                  ),
                  title: Text(
                    chat.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    chat.lastMessage,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        DateFormat('h:mm a').format(chat.time),
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                      if (chat.unreadCount > 0)
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.teal[400],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 20,
                          ),
                          child: Center(
                            child: Text(
                              '${chat.unreadCount}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  onTap: () {
                    // Navigate to chat detail screen
                  },
                ),
              );
            },
          ),
          // Updates Tab (Placeholder)
          const Center(child: Text('Updates')),
          // Calls Tab (Placeholder)
          const Center(child: Text('Calls')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Start a new chat
        },
        child: const Icon(Icons.chat),
      ),
    );
  }
}

extension on DateFormat {
  String format(DateTime time) {}
}

class DateFormat {
  DateFormat(String s);

    
  
}

class Chat {
  final String name;
  final String lastMessage;
  final DateTime time;
  final String avatarUrl;
  final int unreadCount;

  Chat({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.avatarUrl,
    this.unreadCount = 0,
  });
}
