import 'package:flutter/material.dart';

class RecordsScreen extends StatefulWidget {
  @override
  _RecordsScreenState createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  int selectedFilter = 0; // 0 = All, 1 = Excellent, 2 = Good, 3 = Fair

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
              // --------------------------
              // Title + Subtitle
              // --------------------------
              const Text(
                "Catch Records",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              const Text(
                "Local database of all scanned catches",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),

              const SizedBox(height: 20),

              // --------------------------
              // Search Bar
              // --------------------------
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search by species name...",
                    icon: Icon(Icons.search),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // --------------------------
              // Filter Chips
              // --------------------------
              Row(
                children: [
                  filterChip("All", 0),
                  filterChip("Excellent", 1),
                  filterChip("Good", 2),
                  filterChip("Fair", 3),
                ],
              ),

              const SizedBox(height: 20),

              // --------------------------
              // Stats Gradient Box
              // --------------------------
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [Color(0xff3d7bff), Color(0xff4c3aff)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    StatItem(title: "2", subtitle: "Scans"),
                    StatItem(title: "16", subtitle: "Fish"),
                    StatItem(title: "10", subtitle: "kg Total"),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // --------------------------
              // Export + Share Buttons
              // --------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  smallButton(Icons.download, "Export CSV"),
                  smallButton(Icons.share, "Share Data"),
                ],
              ),

              const SizedBox(height: 20),

              // --------------------------
              // THE CATCH CARD UI
              // --------------------------
              buildCatchCard(),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  // --------------------------------------------------------
  // FILTER CHIP UI
  // --------------------------------------------------------
  Widget filterChip(String label, int id) {
    bool selected = selectedFilter == id;

    return GestureDetector(
      onTap: () => setState(() => selectedFilter = id),
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  // --------------------------------------------------------
  // SMALL BUTTON
  // --------------------------------------------------------
  Widget smallButton(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 6),
          Text(text, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  // --------------------------------------------------------
  // MAIN CATCH CARD
  // --------------------------------------------------------
  Widget buildCatchCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --------------------------
          // Placeholder Image
          // --------------------------
          Stack(
            children: [
              Container(
                height: 180,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                  gradient: LinearGradient(
                    colors: [Color(0xffc3d9ff), Color(0xfff1f6ff)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: const Center(
                  child: Icon(Icons.image, size: 60, color: Colors.white70),
                ),
              ),

              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "2 species",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),

          // --------------------------
          // Weight + Fish count
          // --------------------------
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: const [
                Icon(Icons.fitness_center, size: 20),
                SizedBox(width: 4),
                Text("10"),

                SizedBox(width: 20),
                Icon(Icons.scale, size: 20),
                SizedBox(width: 4),
                Text("6.4 kg"),
              ],
            ),
          ),

          const Divider(),

          // --------------------------
          // DATE & LOCATION
          // --------------------------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("12/3/2025"),
                    Text("12:28 PM", style: TextStyle(color: Colors.black54)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("19.290°"),
                    Text("71.732°", style: TextStyle(color: Colors.black54)),
                  ],
                ),
              ],
            ),
          ),

          const Divider(),

          // --------------------------
          // SPECIES LIST
          // --------------------------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                speciesTile("Hilsa", "6 fish • 3.6 kg", "Excellent"),
                speciesTile("Pomfret", "4 fish • 2.8 kg", "Excellent"),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // --------------------------
          // DELETE BUTTON
          // --------------------------
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(12),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.delete),
              label: const Text("Delete Record"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.all(14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  // --------------------------------------------------------
  // SPECIES TILE
  // --------------------------------------------------------
  Widget speciesTile(String name, String info, String status) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(info, style: const TextStyle(color: Colors.black54)),
              ],
            ),
          ),

          // Status Chip
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: Colors.green.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --------------------------------------------------------
// STATS BOX ITEM
// --------------------------------------------------------
class StatItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const StatItem({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 14, color: Colors.white70),
        ),
      ],
    );
  }
}
