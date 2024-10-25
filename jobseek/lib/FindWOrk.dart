import 'package:flutter/material.dart';

import 'package:flutter_application_1/FindTalent.dart';
import 'package:flutter_application_1/HomePage.dart';
import 'package:flutter_application_1/Login_cep.dart';
import 'package:flutter_application_1/MessageScreen.dart';
import 'package:flutter_application_1/Profile.dart';
import 'package:flutter_application_1/SubmitProposalScreen.dart';

class FindWorkScreen extends StatefulWidget {
  const FindWorkScreen({super.key});

  @override
  _FindWorkScreenState createState() => _FindWorkScreenState();
}

class _FindWorkScreenState extends State<FindWorkScreen> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FindWorkScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FindTalentScreen()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MessageScreen()),
        );
        break;
    }
  }

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MessageScreen()),
                    );
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Projects Section
              const Text(
                'Freelancers Projects',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildProjectCard(
                'Web Development Project',
                'Budget: \$500 - \$1000',
                'Duration: 4 Weeks',
                'HTML, CSS, JavaScript, React.js',
                'We need a web developer for a responsive website.',
              ),
              const SizedBox(height: 20),
              _buildProjectCard(
                'App Development',
                'Budget: \$300 - \$600',
                'Duration: 2 Weeks',
                'Photoshop, Illustrator, Branding',
                'A graphic designer is needed for a marketing campaign.',
              ),
              const SizedBox(height: 20),
              _buildProjectCard(
                'Graphic Design Campaign',
                'Budget: \$300 - \$600',
                'Duration: 2 Weeks',
                'Photoshop, Illustrator, Branding',
                'A graphic designer is needed for a marketing campaign.',
              ),
              _buildProjectCard(
                'UI/UX Designing',
                'Budget: \$300 - \$600',
                'Duration: 2 Weeks',
                'Photoshop, Illustrator, Branding',
                'A graphic designer is needed for a marketing campaign.',
              ),
            ],
          ),
        ),
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

  Widget _buildProjectCard(
    String title,
    String budget,
    String duration,
    String skills,
    String description,
  ) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              budget,
              style: TextStyle(
                  color: Colors.green[700], fontWeight: FontWeight.w600),
            ),
            Text(duration),
            Text(
              'Skills Required: $skills',
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 10),
            Text(description),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SubmitProposalScreen(
                        projectTitle: title,
                        projectDescription: description,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5C2C91),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Apply Now',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
