import 'package:flutter/material.dart';

class InspectorDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0F1F), // Dark gradient background base
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Inspector Dashboard",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔵 TOP HEADER (Same vibe as Analytics)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0E1E46), Color(0xFF122859)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Today's Overview",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Real-time inspection summary",
                    style: TextStyle(color: Colors.white70, fontSize: 15),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            /// 🔥 Stats Row 1
            Row(
              children: [
                Expanded(
                  child: statCard(
                    title: "Inspections",
                    value: "128",
                    icon: Icons.fact_check,
                    glowColor: Colors.blue,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: statCard(
                    title: "Failed QC",
                    value: "12",
                    icon: Icons.error,
                    glowColor: Colors.redAccent,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            /// 🔥 Stats Row 2
            Row(
              children: [
                Expanded(
                  child: statCard(
                    title: "Approved",
                    value: "116",
                    icon: Icons.verified,
                    glowColor: Colors.greenAccent,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: statCard(
                    title: "Pending",
                    value: "09",
                    icon: Icons.access_time_filled,
                    glowColor: Colors.orangeAccent,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            /// 🔥 ALERTS SECTION
            const Text(
              "Recent Alerts",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 14),

            alertTile(
              msg: "Expired Catch Found",
              icon: Icons.error,
              color: Colors.redAccent,
            ),
            alertTile(
              msg: "Unverified Fisherman ID",
              icon: Icons.report_gmailerrorred,
              color: Colors.orangeAccent,
            ),
            alertTile(
              msg: "Low Health Score Detected",
              icon: Icons.health_and_safety,
              color: Colors.blueAccent,
            ),

            const SizedBox(height: 30),

            /// 🔮 ANALYTICS BUTTON
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/inspectorAnalytics");
                },
                child: const Text(
                  "View Full Analytics",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // -------------------------------------------------
  //  🔥 STAT CARD (Matches Analytics style exactly)
  // -------------------------------------------------
  Widget statCard({
    required String title,
    required String value,
    required IconData icon,
    required Color glowColor,
  }) {
    return Container(
      height: 130,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          colors: [glowColor.withOpacity(0.15), Colors.black.withOpacity(0.25)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: glowColor.withOpacity(0.4),
            blurRadius: 20,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: glowColor, size: 28),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // -------------------------------------------------
  //  🔥 ALERT TILE (dark theme)
  // -------------------------------------------------
  Widget alertTile({
    required String msg,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        border: Border.all(color: color.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, size: 26, color: color),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              msg,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
