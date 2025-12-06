import 'package:flutter/material.dart';

class CameraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f7ff),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // GPS LOCATION CARD
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xffe8fff1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xff9be7b4),
                    width: 1.2,
                  ),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.location_on, color: Colors.green, size: 28),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "GPS Location Active\nAll captures will be geotagged for traceability",
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // MAIN CAPTURE BOX
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 40),
                decoration: BoxDecoration(
                  color: const Color(0xffeef5ff),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xffd0dcff)),
                ),
                child: Column(
                  children: const [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Color(0xffdce8ff),
                      child: Icon(
                        Icons.camera_alt,
                        color: Color(0xff2979ff),
                        size: 40,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Capture Your Catch",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Take a photo or upload an image to begin AI\nanalysis",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // OPEN CAMERA BUTTON — GRADIENT
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  gradient: const LinearGradient(
                    colors: [Color(0xff2979ff), Color(0xff5f2eea)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Open Camera",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    // TODO: connect actual camera
                  },
                ),
              ),

              const SizedBox(height: 14),

              // UPLOAD FROM GALLERY BUTTON
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.upload_rounded, color: Colors.black87),
                    SizedBox(width: 8),
                    Text(
                      "Upload from Gallery",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // EDGE AI PROCESSING BOX (OPTIONAL)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xffffe9f4),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Row(
                      children: [
                        Icon(Icons.bolt, color: Colors.purple),
                        SizedBox(width: 8),
                        Text(
                          "Edge AI Processing",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text("• YOLOv8-Tiny for real-time detection"),
                    Text("• EfficientNet-Lite for classification"),
                    Text("• CNN health assessment model"),
                    Text("• ARCore depth sensing for volume"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
