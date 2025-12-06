import 'package:aqua_setu/utils/app_text-styles.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aqua Setu"),
        backgroundColor: AppColors.primary,
      ),
      body: Center(
        child: Text("Welcome to Aqua Setu", style: AppTextStyles.heading),
      ),
    );
  }
}
