import 'package:bottom_navbar_riverpod/app_states/nav_states/nav_notifier.dart';
import 'package:bottom_navbar_riverpod/screens/home_screen.dart';
import 'package:bottom_navbar_riverpod/screens/profile_screen.dart';
import 'package:bottom_navbar_riverpod/screens/search_screen.dart';
import 'package:bottom_navbar_riverpod/screens/ticket_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomBar extends ConsumerStatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  ConsumerState<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends ConsumerState<BottomBar> {
  static final List<Widget> _widgetOptions = [
    const HomeScreen(),
    const SearchScreen(),
    const TicketScreen(),
    const ProfileScreen()
  ];




  @override
  Widget build(BuildContext context) {
    var navIndex = ref.watch(navProvider);
    return Scaffold(
      body: Center(
        child: _widgetOptions[navIndex.index],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navIndex.index,
        onTap: (value){
          ref.read(navProvider.notifier).onIndexChanged(value);
        },
        elevation: 10,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: Colors.deepPurple,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.greenAccent,
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.home),activeIcon: Icon(Icons.home_outlined),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search),activeIcon: Icon(Icons.search_outlined),label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.airplane_ticket),activeIcon: Icon(Icons.airplane_ticket),label: 'Ticket'),
          BottomNavigationBarItem(icon: Icon(Icons.people_alt),activeIcon: Icon(Icons.people),label: 'Profile'),
        ],
      ),
    );
  }
}
