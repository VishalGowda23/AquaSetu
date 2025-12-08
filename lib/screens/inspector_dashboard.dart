import 'package:flutter/material.dart';

class InspectorDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A1630), // same dark theme as analytics
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF0A1630),
        title: const Text(
          "Inspector Dashboard",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ----------------------------------------------------------
            // HEADER TITLE
            // ----------------------------------------------------------
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Today's Overview",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ----------------------------------------------------------
            // TOP STAT CARDS (2x2 Grid)
            // ----------------------------------------------------------
            Row(
              children: [
                Expanded(child: statCard(
                  title: "Inspections",
                  value: "128",
                  icon: Icons.fact_check,
                  glowColor: Colors.blue,
                )),
                const SizedBox(width: 12),
                Expanded(child: statCard(
                  title: "Failed QC",
                  value: "12",
                  icon: Icons.warning_rounded,
                  glowColor: Colors.redAccent,
                )),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(child: statCard(
                  title: "Approved",
                  value: "116",
                  icon: Icons.verified_rounded,
                  glowColor: Colors.greenAccent,
                )),
                const SizedBox(width: 12),
                Expanded(child: statCard(
                  title: "Pending",
                  value: "09",
                  icon: Icons.access_time_filled,
                  glowColor: Colors.amber,
                )),
              ],
            ),

            const SizedBox(height: 30),

            // ----------------------------------------------------------
            // RECENT ALERTS SECTION
            // ----------------------------------------------------------
            alertsSection(),

            const SizedBox(height: 30),

            // ----------------------------------------------------------
            // ANALYTICS BUTTON
            // ----------------------------------------------------------
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
              onPressed: () {},
              child: const Text(
                "View Full Analytics",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==============================================================
  // ⭐ STAT CARD (Modern Glow Gradient + No Overflow)
  // ==============================================================
  Widget statCard({
    required String title,
    required String value,
    required IconData icon,
    required Color glowColor,
  }) {
    return Container(
      height: 150, // prevents overflow
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          colors: [
            glowColor.withOpacity(0.25),
            const Color(0xFF0A1630),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: glowColor.withOpacity(0.30),
            blurRadius: 18,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: glowColor),
          const SizedBox(height: 10),

          Text(
            value,
            style: TextStyle(
              color: glowColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white70,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ==============================================================
  // 🔥 ALERTS SECTION (Cleaner + Matches Dark UI)
  // ==============================================================
  Widget alertsSection() {
    List<Map<String, dynamic>> alerts = [
      {"msg": "Expired Catch Found", "color": Colors.red, "icon": Icons.error},
      {"msg": "Unverified Fisherman ID", "color": Colors.orange, "icon": Icons.report},
      {"msg": "Low Health Score Detected", "color": Colors.blue, "icon": Icons.health_and_safety},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Recent Alerts",
          style: TextStyle(
            fontSize: 22, 
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),

        ...alerts.map(
          (a) => Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: a["color"].withOpacity(0.15),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: a["color"].withOpacity(0.3)),
            ),
            child: Row(
              children: [
                Icon(a["icon"], color: a["color"], size: 26),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    a["msg"],
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
