// TODO Implement this library.
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double sheetHeight = MediaQuery.of(context).size.height * 0.52;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          const HeroBackground(imagePath: 'assets/images/home_bg2.jpg'),
          Positioned(
            top: 20,
            right: 18,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    AssetImage('assets/icons/icon_share.png'),
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    AssetImage('assets/icons/icon_bookmark.png'),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 22,
            top: 80,
            right: 80,
            child: Text(
              'Catch Analysis',
              style: TextStyle(
                fontFamily: 'Georgia',
                fontSize: 38,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: sheetHeight,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 30,
                    offset: Offset(0, -10),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 48,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Catch's photos",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_horiz),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 120,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/images/fish1.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: _smallThumb(
                                          'assets/images/fish2.jpg',
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      Expanded(
                                        child: _smallThumb(
                                          'assets/images/fish3.jpg',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        Image.asset(
                                          'assets/images/fish4.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                        Container(
                                          color: Colors.black26,
                                          child: const Center(
                                            child: Text(
                                              '+223 more',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Icon(Icons.place_outlined, color: Colors.black54),
                        const SizedBox(width: 8),
                        const Text(
                          'Geo: 18.9200 N, 72.8300 E',
                          style: TextStyle(color: Colors.black54),
                        ),
                        const Spacer(),
                        const Text(
                          'Batch Weight: 23.4 kg',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 88,
                      child: Row(
                        children: [
                          expandedStat(
                            'Species Detected',
                            'Pomfret\nx 12',
                            Colors.blue.shade50,
                            Colors.blue,
                          ),
                          const SizedBox(width: 10),
                          expandedStat(
                            'Freshness',
                            'Grade A\n92%',
                            Colors.green.shade50,
                            Colors.green,
                          ),
                          const SizedBox(width: 10),
                          expandedStat(
                            'Confidence',
                            '89%',
                            Colors.orange.shade50,
                            Colors.orange,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.save_alt),
                            label: const Text('Save Record'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF3A6E95),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.share),
                            label: const Text('Share'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _smallThumb(String path) => ClipRRect(
    borderRadius: BorderRadius.circular(8),
    child: Image.asset(path, fit: BoxFit.cover),
  );

  static Widget expandedStat(
    String title,
    String value,
    Color bg,
    Color accent,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 12, color: Colors.black54),
            ),
            const Spacer(),
            Text(
              value,
              style: TextStyle(fontWeight: FontWeight.w800, color: accent),
            ),
          ],
        ),
      ),
    );
  }
}

class HeroBackground extends StatelessWidget {
  final String imagePath;

  const HeroBackground({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
    );
  }
}
