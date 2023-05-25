import 'package:flutter/material.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:moageet/screens/favorite.dart';
import '../utils/styles.dart';
import 'package:moageet/screens/booking.dart';
import 'package:moageet/screens/home/home.dart';
import 'package:moageet/screens/profile.dart';
import 'package:moageet/screens/search.dart';

// ignore: must_be_immutable
class BottomBar extends StatefulWidget {
  int currentIndex;
  BottomBar({super.key, required this.currentIndex});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const Search(),
    const Favorite(),
    const Booking(),
    const Profile(),
  ];

  void onItemTapped(int index) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => _widgetOptions[index]));
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: onItemTapped,
        elevation: 10,
        currentIndex: widget.currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Styles.primaryColor,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined),
              activeIcon: Icon(Icons.favorite, color: Colors.red),
              label: 'Favorite'),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_app_folder_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_app_folder_filled),
              label: 'Bookings'),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
              label: 'Profile'),
        ]);
  }
}
