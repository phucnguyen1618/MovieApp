import 'package:flutter/material.dart';
import 'package:flutter_movie_app/pages/home_page.dart';
import 'package:flutter_movie_app/pages/my_rated_page.dart';
import 'package:flutter_movie_app/pages/profile_page.dart';
import 'package:flutter_movie_app/pages/upcoming_page.dart';
import 'package:flutter_movie_app/utils.dart' as color;

class ContainerPage extends StatefulWidget {
  const ContainerPage({Key? key}) : super(key: key);

  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  int _currentIndex = 0;

  final List<Widget> _listPages = [
    const HomePage(),
    const UpcomingPage(),
    const MyRatedPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5.0,
        currentIndex: _currentIndex,
        selectedItemColor: color.Utils.firstColor,
        unselectedItemColor: color.Utils.secondColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.upcoming,
            ),
            label: 'Upcoming',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
            ),
            label: 'My rated',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
            ),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: _listPages[_currentIndex],
    );
  }
}
