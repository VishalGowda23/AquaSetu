import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String selectedModel = "Balanced (YOLOv8-Tiny, EfficientNet-Lite)";
  double confidence = 75;
  bool offlineMode = true;
  bool geotagging = true;
  bool cloudSync = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f7ff),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Settings", style: TextStyle(color: Colors.black)),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: _cardDecoration(),
              child: Row(
                children: const [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/user.png"),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Demo User",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "demo@fishid.com",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text("fisherman", style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // System Status
            _title("System Status"),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: _cardDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.circle, size: 12, color: Colors.green),
                      SizedBox(width: 8),
                      Text(
                        "Operational",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("AI Models Loaded"),
                      Text("Local DB Ready"),
                      Text("GPS Active"),
                      Text("Encrypted"),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // AI Model Configuration
            _title("AI Model Configuration"),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: _cardDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Model Quality",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 10),

                  // Dropdown
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButton<String>(
                      value: selectedModel,
                      isExpanded: true,
                      underline: const SizedBox(),
                      items:
                          [
                                "Balanced (YOLOv8-Tiny, EfficientNet-Lite)",
                                "High Accuracy (Slow • AI Model XL)",
                                "Low Power (Fast • Small Model)",
                              ]
                              .map(
                                (e) =>
                                    DropdownMenuItem(value: e, child: Text(e)),
                              )
                              .toList(),
                      onChanged: (val) {
                        setState(() => selectedModel = val!);
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Confidence Threshold",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${confidence.toInt()}%"),
                      const Text(
                        "Minimum confidence required to show results",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),

                  Slider(
                    value: confidence,
                    min: 1,
                    max: 100,
                    activeColor: Colors.blue,
                    onChanged: (value) {
                      setState(() => confidence = value);
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Data & Storage
            _title("Data & Storage"),
            _toggleCard(
              title: "Offline Mode",
              subtitle: "Run entirely on device with local storage",
              value: offlineMode,
              onChanged: (val) {
                setState(() => offlineMode = val);
              },
              icon: Icons.cloud_off,
              color: Colors.orange,
            ),
            _toggleCard(
              title: "GPS Geotagging",
              subtitle: "Add location data to all scans",
              value: geotagging,
              onChanged: (val) {
                setState(() => geotagging = val);
              },
              icon: Icons.location_on,
              color: Colors.green,
            ),
            _toggleCard(
              title: "Auto Cloud Sync",
              subtitle: "Sync when internet is available",
              value: cloudSync,
              onChanged: (val) {
                setState(() => cloudSync = val);
              },
              icon: Icons.sync,
              color: Colors.blue,
            ),

            const SizedBox(height: 20),

            // Species Database
            _title("Species Database"),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: _cardDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Local Species:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "52 Indian species",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Last updated:  Oct 14, 2025",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(double.infinity, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Update Species Database"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ----- Helper Widgets -----

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
    );
  }

  Widget _title(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _toggleCard({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.15),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(subtitle, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Switch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}
