import 'package:flutter/material.dart';
import 'package:flutter_application_1/FindTalent.dart';
import 'package:flutter_application_1/FindWOrk.dart';
import 'package:flutter_application_1/MessageScreen.dart';
import 'package:flutter_application_1/Profile.dart';
import 'package:flutter_application_1/auth_services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthServices authServices = AuthServices();
    return Scaffold(
      backgroundColor: Colors.white,
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const LoginCEP()),
                    // );
                    authServices.logout();
                    break;
                }
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              height: 300.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'Assets/nicole-avagliano-StCrWOWx2E8-unsplash.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Find the best freelancers for your project',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Post a job and hire the top talent for your project.',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'What are you looking for?',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF7E57C2),
                            ),
                            child: const Text(
                              'Search',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Categories Section
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Explore Job Categories',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _buildCategoryCard(
                          'Design & Creative', 'Assets/Designing.jpg'),
                      _buildCategoryCard(
                          'Development & IT', 'Assets/Development.jpg'),
                      _buildCategoryCard('Sales & Marketing',
                          'Assets/Sales and Marketing.jpg'),
                      _buildCategoryCard(
                          'Content Writing', 'Assets/Translator.jpg'),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Featured Jobs',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      _buildJobCard('Front-end Developer',
                          'Build a responsive website for a growing company.'),
                      _buildJobCard('Graphic Designer',
                          'Design marketing materials for a new product launch.'),
                      _buildJobCard('Content Writer',
                          'Create compelling blog posts for a tech startup.'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color(0xFF5C2C91),
        ),
        child: BottomNavigationBar(
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
          onTap: (index) {
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FindWorkScreen()),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FindTalentScreen()),
              );
            } else if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MessageScreen()),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String title, String imagePath) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: 100,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJobCard(String jobTitle, String jobDescription) {
    return Card(
      elevation: 5,
      child: ListTile(
        title: Text(jobTitle),
        subtitle: Text(jobDescription),
      ),
    );
  }
}
