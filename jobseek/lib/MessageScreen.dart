import 'package:flutter/material.dart';
import 'package:flutter_application_1/FindTalent.dart';
import 'package:flutter_application_1/FindWOrk.dart';
import 'package:flutter_application_1/HomePage.dart';
import 'package:flutter_application_1/Login_cep.dart';
import 'package:flutter_application_1/Profile.dart';

import 'ConversationScreen.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 3;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const FindWorkScreen()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const FindTalentScreen()),
        );
        break;
      case 3:
        // This is the current screen.
        break;
    }
  }

  final List<Map<String, String>> messages = List.generate(50, (index) {
    List<String> names = [
      "Zahoor",
      "Shayan",
      "Basit",
      "Wasim",
      "Ali",
      "Khan",
      "Omer",
      "Ahmad",
      "Usman",
      "Bilal",
      "Saad",
      "Adeel",
      "Tariq",
      "Zain",
      "Farhan",
      "Hasan",
      "Rehan",
      "Nashit",
      "Aariz",
      "Rayyan",
      "Hadi",
      "Samir",
      "Zeeshan",
      "Hamza",
      "Arsalan",
      "Aasim",
      "Zainul",
      "Fahad",
      "Nashit",
      "Shahbaz",
      "Salman",
      "Nashir",
      "Ehtisham",
      "Faris",
      "Rizwan",
      "Owais",
      "Wasiq",
      "Imran",
      "Tariq",
      "Yasir",
      "Jawad",
      "Mohtashim",
      "Khalid",
      "Kashif",
      "Mansoor",
      "Usama",
      "Furqan",
      "Kashan",
      "Ayman",
      "Ahsan",
      "Rafay"
    ];

    String sender = names[index % names.length];
    String message = "Sample message from $sender";
    String time =
        "${(8 + index % 12)}:${index % 60 < 10 ? '0' : ''}${index % 60} ${index % 2 == 0 ? 'AM' : 'PM'}";

    return {
      "sender": sender,
      "message": message,
      "time": time,
    };
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 40,
          child: Image.asset('Assets/Logo.png'),
        ),
        backgroundColor: const Color(0xFF5C2C91),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: PopupMenuButton<String>(
              offset: const Offset(0, 50),
              icon: const CircleAvatar(
                backgroundImage: AssetImage('Assets/Zahoor_Ahmed.png'),
              ),
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem<String>(
                    value: 'View Profile',
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text('View Profile'),
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Messages',
                    child: ListTile(
                      leading: Icon(Icons.message),
                      title: Text('Messages'),
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Settings',
                    child: ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Settings'),
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Log Out',
                    child: ListTile(
                      leading: Icon(Icons.logout),
                      title: Text('Log Out'),
                    ),
                  ),
                ];
              },
              onSelected: (String value) {
                switch (value) {
                  case 'View Profile':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreen()),
                    );
                    break;
                  case 'Messages':
                    break;
                  case 'Settings':
                    break;
                  case 'Log Out':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginCEP()),
                    );
                    break;
                }
              },
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white54,
          tabs: const [
            Tab(text: "All Messages"),
            Tab(text: "New Messages"),
          ],
          indicator: BoxDecoration(
            color: const Color(0xFF5C2C91),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text(messages[index]["sender"]![0]),
                ),
                title: Text(
                  messages[index]["sender"]!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(messages[index]["message"]!),
                trailing: Text(messages[index]["time"]!),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConversationScreen(
                        senderName: messages[index]["sender"]!,
                      ),
                    ),
                  );
                },
              );
            },
          ),
          const Center(
            child: Text("No New messages"),
          ),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color(0xFF5C2C91),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work),
              label: 'Find Work',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Find Talent',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Messages',
            ),
          ],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
