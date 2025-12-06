import 'package:flutter/material.dart';
// import 'package:camera/camera.dart'; // uncomment after adding camera plugin

class CameraScaffold extends StatefulWidget {
  const CameraScaffold({super.key});

  @override
  State<CameraScaffold> createState() => _CameraScaffoldState();
}

class _CameraScaffoldState extends State<CameraScaffold> {
  // CameraController? controller;

  @override
  void initState() {
    super.initState();
    // init camera in real app:
    // availableCameras().then((list) {
    //   controller = CameraController(list.first, ResolutionPreset.high);
    //   controller!.initialize().then((_) => setState(() {}));
    // });
  }

  @override
  void dispose() {
    // controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Camera (scaffold)')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: 300,
              color: Colors.grey.shade200,
              child: const Center(child: Text('Camera preview placeholder')),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Capture (mock)'),
            ),
          ],
        ),
      ),
    );
  }
}
