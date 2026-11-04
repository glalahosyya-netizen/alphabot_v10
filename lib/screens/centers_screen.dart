import "package:flutter/material.dart";
import "intelligence_center_screen.dart";

class CentersScreen extends StatelessWidget {
  const CentersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF05070D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1220),
        title: const Text(
          "المراكز الرئيسية",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.blueAccent),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildCard(context, "مركز الذكاء", Icons.psychology, Colors.blueAccent, true),
            _buildCard(context, "الأعمال والمشاريع", Icons.work, Colors.greenAccent, false),
            _buildCard(context, "الإبداع والإنتاج", Icons.palette, Colors.purpleAccent, false),
            _buildCard(context, "الأجهزة والشبكات", Icons.devices, Colors.orangeAccent, false),
            _buildCard(context, "الأمان والخصوصية", Icons.security, Colors.redAccent, false),
            _buildCard(context, "الإعدادات والتطوير", Icons.settings, Colors.tealAccent, false),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, IconData icon, Color color, bool isCenter) {
    return GestureDetector(
      onTap: () {
        if (isCenter) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const IntelligenceCenterScreen()),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0B1220),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFF1E2A44)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 45, color: color),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
