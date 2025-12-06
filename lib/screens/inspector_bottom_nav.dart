import 'package:aqua_setu/screens/records_screen.dart';
import 'package:aqua_setu/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'inspector_dashboard.dart';
import 'inspector_analytics.dart';

class InspectorBottomNav extends StatefulWidget {
  @override
  _InspectorBottomNavState createState() => _InspectorBottomNavState();
}

class _InspectorBottomNavState extends State<InspectorBottomNav> {
  int index = 0;

  final List<Widget> screens = [
    InspectorDashboard(),
    InspectorAnalytics(),
    RecordsScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Analytics",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Records"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
