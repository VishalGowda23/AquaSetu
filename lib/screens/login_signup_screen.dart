import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';
import 'inspector_bottom_nav.dart'; // <-- Correct inspector navigation

class LoginSignupScreen extends StatefulWidget {
  final String? selectedRole;

  const LoginSignupScreen({super.key, this.selectedRole});

  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isLogin = true;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController(
    text: "demo@fishid.com",
  );
  TextEditingController passwordController = TextEditingController(
    text: "******",
  );

  String selectedRole = "Fisherman";

  @override
  void initState() {
    super.initState();
    if (widget.selectedRole != null) {
      selectedRole = widget.selectedRole!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            /// LOGIN / SIGNUP SWITCH
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  toggleButton("Login", true),
                  toggleButton("Sign Up", false),
                ],
              ),
            ),

            const SizedBox(height: 25),

            Expanded(child: isLogin ? loginForm() : signupForm()),
          ],
        ),
      ),
    );
  }

  /// Toggle Button
  Widget toggleButton(String text, bool loginMode) {
    bool active = isLogin == loginMode;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => isLogin = loginMode),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: active ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: active ? Colors.black : Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  // --------------------------------------------------------------
  //                          LOGIN FORM
  // --------------------------------------------------------------

  Widget loginForm() {
    return ListView(
      children: [
        fieldLabel("Email"),
        inputField(emailController, Icons.email),

        fieldLabel("Password"),
        inputField(passwordController, Icons.lock),

        const SizedBox(height: 20),

        mainButton("Sign In", onTap: handleLogin),
      ],
    );
  }

  // --------------------------------------------------------------
  //                          SIGNUP FORM
  // --------------------------------------------------------------

  Widget signupForm() {
    return ListView(
      children: [
        fieldLabel("Full Name"),
        inputField(fullNameController, Icons.person),

        fieldLabel("Email"),
        inputField(emailController, Icons.email),

        fieldLabel("Password"),
        inputField(passwordController, Icons.lock),

        fieldLabel("Role"),

        /// ROLE DROPDOWN
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedRole,
              items: const [
                DropdownMenuItem(value: "Fisherman", child: Text("Fisherman")),
                DropdownMenuItem(value: "Buyer", child: Text("Buyer")),
                DropdownMenuItem(value: "Inspector", child: Text("Inspector")),
              ],
              onChanged: (value) {
                setState(() {
                  selectedRole = value!;
                });
              },
            ),
          ),
        ),

        const SizedBox(height: 25),

        mainButton("Create Account", onTap: handleSignup),
      ],
    );
  }

  // --------------------------------------------------------------
  //                         NAVIGATION LOGIC
  // --------------------------------------------------------------

  void handleLogin() {
    if (selectedRole == "Inspector") {
      // Inspector → Inspector Mode UI
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => InspectorBottomNav()),
      );
    } else {
      // Fisherman / Buyer → Normal App
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => BottomNav()),
      );
    }
  }

  void handleSignup() {
    handleLogin(); // Same logic for now
  }

  // --------------------------------------------------------------
  //                          UI HELPERS
  // --------------------------------------------------------------

  Widget fieldLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6, top: 14),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }

  Widget inputField(TextEditingController controller, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(icon, color: Colors.grey.shade600),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget mainButton(String text, {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [Colors.blue, Colors.deepPurple],
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
