import 'package:aqua_setu/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:aqua_setu/screens/records_screen.dart';
import 'package:aqua_setu/screens/camera_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int index = 1; // CAMERA is highlighted by default

  final screens = [RecordsScreen(), CameraPage(), SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            navItem(Icons.history, "Records", 0),
            cameraButton(),
            navItem(Icons.settings, "Settings", 2),
          ],
        ),
      ),
    );
  }

  Widget navItem(IconData icon, String label, int i) {
    bool active = index == i;

    return GestureDetector(
      onTap: () => setState(() => index = i),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 28, color: active ? Colors.blue : Colors.grey),
          Text(
            label,
            style: TextStyle(
              color: active ? Colors.blue : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget cameraButton() {
    return GestureDetector(
      onTap: () => setState(() => index = 1),
      child: Container(
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.15),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.camera_alt,
          size: 32,
          color: index == 1 ? Colors.blue : Colors.grey,
        ),
      ),
    );
  }
}
