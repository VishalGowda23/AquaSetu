import 'package:flutter/material.dart';
import 'login_signup_screen.dart';

class RoleSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Choose Your Role",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            roleCard(
              context,
              icon: Icons.people,
              title: "Buyer & Fisherman",
              subtitle: "Scan, upload, track & manage fish records",
              role: "Fisherman", // default role for this option
            ),

            SizedBox(height: 20),

            roleCard(
              context,
              icon: Icons.verified_user,
              title: "Inspector",
              subtitle: "Verify catch quality, compliance & audits",
              role: "Inspector",
            ),
          ],
        ),
      ),
    );
  }

  Widget roleCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required String role,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => LoginSignupScreen(selectedRole: role),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
        ),
        child: Row(
          children: [
            Icon(icon, size: 45, color: Colors.blue),
            SizedBox(width: 20),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ),

            Icon(Icons.arrow_forward_ios, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
