import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int index = 0;

  final screens = [
    Center(child: Text("Records Page")),
    Center(child: Text("Camera Page")),
    Center(child: Text("Settings Page")),
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
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Records"),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: "Camera",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserInfoSection(),
            SizedBox(height: 16.0),
            _buildSystemStatusSection(),
            SizedBox(height: 16.0),
            _buildAIModelConfigurationSection(),
            SizedBox(height: 16.0),
            _buildDataAndStorageSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfoSection() {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Icon(Icons.person)),
        title: Text('Demo User'),
        subtitle: Text('demo@fishid.com\nfisherman'),
      ),
    );
  }

  Widget _buildSystemStatusSection() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              'System Status',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Chip(
              label: Text('Operational'),
              backgroundColor: Colors.green,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('AI Models Loaded'),
                Text('Local DB Ready'),
                Text('GPS Active'),
                Text('Encrypted'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAIModelConfigurationSection() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              'AI Model Configuration',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Model Quality'),
                    DropdownButton<String>(
                      value: 'Balanced',
                      items: [
                        DropdownMenuItem(
                          value: 'Balanced',
                          child: Text(
                            'Balanced (YOLOv8-Tiny, EfficientNet-Lite)',
                          ),
                        ),
                      ],
                      onChanged: (value) {},
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Confidence Threshold'),
                    Slider(
                      value: 0.75,
                      onChanged: (value) {},
                      min: 0.0,
                      max: 1.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataAndStorageSection() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              'Data & Storage',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SwitchListTile(
            title: Text('Offline Mode'),
            subtitle: Text('Run entirely on device with local storage'),
            value: true,
            onChanged: (value) {},
          ),
          SwitchListTile(
            title: Text('GPS Geotagging'),
            subtitle: Text('Add location data to all scans'),
            value: true,
            onChanged: (value) {},
          ),
          SwitchListTile(
            title: Text('Auto Cloud Sync'),
            subtitle: Text('Sync when internet is available'),
            value: true,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
