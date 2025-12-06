import 'package:flutter/material.dart';
import 'login_signup_screen.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// STATIC BACKGROUND IMAGE
          Positioned.fill(
            child: Image.asset(
              'assets/images/images/landing_bg.jpg', // <-- UPDATED PATH
              fit: BoxFit.cover,
            ),
          ),

          /// Dark overlay for readability
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.45)),
          ),

          /// Foreground content
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Aqua Setu",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 46,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.2,
                  ),
                ),

                SizedBox(height: 12),

                Text(
                  "Know Your Catch Instantly",
                  style: TextStyle(color: Color(0xFFB3E5FC), fontSize: 18),
                ),

                SizedBox(height: 40),

                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => LoginSignupScreen()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.18),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white24),
                      boxShadow: [
                        BoxShadow(color: Colors.black38, blurRadius: 12),
                      ],
                    ),
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
