import 'package:flutter/material.dart';

enum Page { home, planning, settings, account }

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 5,

      onTap: _onItemTapped,
      currentIndex: _selectedIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.dashboard_rounded,
          ),
          label: "Dashboard",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.calendar_month_rounded,
          ),
          label: "Plan",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Settings",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle_rounded,
          ),
          label: "Account",
        ),
      ],
      // showUnselectedLabels: true,
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    );
  }
}
