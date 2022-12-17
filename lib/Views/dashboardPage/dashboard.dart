import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_phase_one/Views/friendsScreen/friendsScreen.dart';
import 'package:project_phase_one/Widgets/avatar.dart';
import 'package:project_phase_one/Widgets/icon_buttons.dart';
import '../explorePage/exploreHome.dart';
import '../myProfile/myProfilePage.dart';

class DashboardHome extends StatefulWidget {
  const DashboardHome({Key? key}) : super(key: key);

  @override
  State<DashboardHome> createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  int _selectedIndex = 2;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'school stuff screen',
      style: optionStyle,
    ),
    ExploreHome(),
    Text(
      'homescreen',
      style: optionStyle,
    ),
    FriendsScreen(),
    MyProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<String> _titles = <String>[
    "School",
    "Explore",
    "UNISPHERE",
    "Friends",
    "My Profile"
  ];

  Color bgcol = Colors.grey.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.white,
        title: Text(_titles[_selectedIndex],
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, color: Colors.grey.shade800)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Avatar.small(
              url:
                  "https://www.pngitem.com/pimgs/m/219-2193218_avatar-clipart-png-transparent-png.png",
            ),
          ),
        ],
        leading: Align(
            alignment: Alignment.centerRight,
            child: IconBackground(
              icon: Icons.search,
              onTap: () {
                print("to do search!");
              },
            )),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Card(
        color: bgcol,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: BottomNavigationBar(
            elevation: 0,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'School',
                backgroundColor: bgcol,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: 'Explore',
                backgroundColor: bgcol,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: bgcol,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: 'Friends',
                backgroundColor: bgcol,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'My Profile',
                backgroundColor: bgcol,
              ),
            ],
            currentIndex: _selectedIndex,
            unselectedItemColor: Colors.grey.shade500,
            selectedItemColor: Colors.indigo.shade900,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
