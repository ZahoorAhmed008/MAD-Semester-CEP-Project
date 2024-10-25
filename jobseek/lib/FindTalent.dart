import 'package:flutter/material.dart';
import 'package:flutter_application_1/FindWOrk.dart';
import 'package:flutter_application_1/HomePage.dart';
import 'package:flutter_application_1/Login_cep.dart';
import 'package:flutter_application_1/MessageScreen.dart';
import 'package:flutter_application_1/Profile.dart';

class FindTalentScreen extends StatefulWidget {
  const FindTalentScreen({super.key});

  @override
  _FindTalentScreenState createState() => _FindTalentScreenState();
}

class _FindTalentScreenState extends State<FindTalentScreen> {
  int _selectedIndex = 2;

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
      body: FindTalentSection(),
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

class FindTalentSection extends StatelessWidget {
  final List<Talent> talents = [
    Talent(
        'Zahoor Ahmed', 'Expert in Web Development', 'Assets/Zahoor_Ahmed.png'),
    Talent('Ogahi Zahoor', 'Graphic Designer & Illustrator',
        'Assets/Zahoor4.jpeg'),
    Talent('Muhammad Shayan', 'Data Scientist', 'Assets/Shayan.jpg'),
    Talent('Muhammad Usama', 'SEO Specialist', 'Assets/Usama.jpeg'),
    Talent('Qurban Khan', 'Digital Marketing Expert', 'Assets/Zahoor1.jpeg'),
    Talent('Mussawir Ali', 'Content Writer', 'Assets/Zahoor2.jpeg'),
    Talent('Sandeep Moorani', 'UX/UI Designer', 'Assets/Zahoor3.jpeg'),
    Talent('Abdul Basit', 'Mobile App Developer', 'Assets/Zahoor_Ahmed.png'),
    Talent('Wasim Akram', 'Cybersecurity Analyst', 'Assets/Zahoor_Ahmed.png'),
    Talent(
        'Danish Khan', 'Cloud Solutions Architect', 'Assets/Zahoor_Ahmed.png'),
    Talent('Wusat ullah', 'Graphic Designer', 'Assets/Zahoor_Ahmed.png'),
    Talent('Saddar din', 'Data Scientist', 'Assets/Zahoor_Ahmed.png'),
  ];

  FindTalentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Find the Perfect Talent for Your Needs',
            style: TextStyle(
                fontSize: 24,
                color: Color(0xFF6A0DAD),
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const SearchBar(),
          const SizedBox(height: 20),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 0.75,
            ),
            itemCount: talents.length,
            itemBuilder: (context, index) {
              return TalentCard(talent: talents[index]);
            },
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for talent...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color(0xFF6A0DAD)),
                ),
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6A0DAD),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: const Text(
            'Search',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class Talent {
  final String name;
  final String description;
  final String imagePath;

  Talent(this.name, this.description, this.imagePath);
}

class TalentCard extends StatelessWidget {
  final Talent talent;

  const TalentCard({super.key, required this.talent});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFE5CCFF),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Container(
                color: const Color(0xFF6A0DAD),
                child: ClipOval(
                  child: Image.asset(
                    talent.imagePath,
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              talent.name,
              style: const TextStyle(
                  color: Color(0xFF6A0DAD),
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 3),
            Text(
              talent.description,
              style: const TextStyle(color: Colors.black54, fontSize: 10),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'View Profile',
                style: TextStyle(
                  color: Color(0xFF6A0DAD),
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
