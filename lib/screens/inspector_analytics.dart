import 'package:flutter/material.dart';
import 'dart:ui';

class InspectorAnalytics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Inspector Analytics",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
        ),
      ),

      /// 🔥 Futuristic Gradient Background
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF001F3F), Color(0xFF001020), Color(0xFF021526)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16, 100, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔥 TOP GLASS METRICS WITH NEON GLOW
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  glowingStat(
                    title: "Total Inspections",
                    value: "128",
                    icon: Icons.fact_check,
                    glow: Colors.blueAccent,
                  ),
                  glowingStat(
                    title: "Unsynced Records",
                    value: "14",
                    icon: Icons.sync_problem,
                    glow: Colors.orangeAccent,
                  ),
                  glowingStat(
                    title: "Avg Health Score",
                    value: "8.6",
                    icon: Icons.health_and_safety,
                    glow: Colors.greenAccent,
                  ),
                  glowingStat(
                    title: "Total Weight (Tons)",
                    value: "42.3",
                    icon: Icons.scale,
                    glow: Colors.purpleAccent,
                  ),
                ],
              ),

              SizedBox(height: 30),

              /// SECTION HEADER
              sectionHeader("Top Species (Period)"),
              SizedBox(height: 12),
              futuristicList(),

              SizedBox(height: 30),

              /// ALERT BOX
              sectionHeader("Alerts (Last 7 Days)"),
              SizedBox(height: 12),
              alertCard(),
            ],
          ),
        ),
      ),
    );
  }

  // ----------------------------------------------------
  // 🔥 FUTURISTIC GLASS CARD WITH GLOW
  // ----------------------------------------------------
  Widget glowingStat({
    required String title,
    required String value,
    required IconData icon,
    required Color glow,
  }) {
    return Container(
      width: 170,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: glow.withOpacity(0.4),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: Colors.white24, width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, size: 32, color: glow),
                SizedBox(height: 10),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  value,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ----------------------------------------------------
  // 🔥 FUTURISTIC TOP SPECIES LIST
  // ----------------------------------------------------
  Widget futuristicList() {
    List<Map<String, dynamic>> fish = [
      {"name": "Tuna", "value": 32, "color": Colors.blueAccent},
      {"name": "Mackerel", "value": 27, "color": Colors.tealAccent},
      {"name": "Snapper", "value": 19, "color": Colors.amberAccent},
      {"name": "Salmon", "value": 14, "color": Colors.pinkAccent},
    ];

    return Column(
      children: fish.map((item) {
        return Container(
          margin: EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.white.withOpacity(0.06),
            border: Border.all(color: Colors.white24),
          ),
          child: ListTile(
            leading: Icon(Icons.pets, color: item["color"], size: 30),
            title: Text(
              item["name"],
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            trailing: Text(
              item["value"].toString(),
              style: TextStyle(
                color: item["color"],
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  // ----------------------------------------------------
  // 🔥 ALERT CARD WITH ANIMATED RED GLOW
  // ----------------------------------------------------
  Widget alertCard() {
    return Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.red.withOpacity(0.08),
        border: Border.all(color: Colors.redAccent.withOpacity(0.4)),
        boxShadow: [
          BoxShadow(
            color: Colors.redAccent.withOpacity(0.4),
            blurRadius: 18,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.warning_amber_rounded, size: 35, color: Colors.redAccent),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              "6 Alerts triggered in the last 7 days",
              style: TextStyle(color: Colors.white, fontSize: 16, height: 1.3),
            ),
          ),
        ],
      ),
    );
  }

  // ----------------------------------------------------
  // 🔥 SECTION TITLE
  // ----------------------------------------------------
  Widget sectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.6,
      ),
    );
  }
}
