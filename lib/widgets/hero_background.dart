// TODO Implement this library.
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class HeroBackground extends StatelessWidget {
  final String imagePath;
  const HeroBackground({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Image.asset(imagePath, fit: BoxFit.cover)),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue.withOpacity(0.45),
                  Colors.teal.withOpacity(0.12),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 0.6, sigmaY: 0.6),
            child: Container(color: Colors.black.withOpacity(0)),
          ),
        ),
      ],
    );
  }
}
