import "package:flutter/material.dart";
import "intelligence_center_screen.dart";
import "business_center_screen.dart";
import "creativity_center_screen.dart";
import "devices_center_screen.dart";
import "security_center_screen.dart";
import "settings_center_screen.dart";

class CentersScreen extends StatelessWidget {
  const CentersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF05070D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1220),
        title: const Text("المراكز الرئيسية", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
            _buildCard(context, "مركز الذكاء", Icons.psychology, Colors.blueAccent, 0),
            _buildCard(context, "الأعمال والمشاريع", Icons.work, Colors.greenAccent, 1),
            _buildCard(context, "الإبداع والإنتاج", Icons.palette, Colors.purpleAccent, 2),
            _buildCard(context, "الأجهزة والشبكات", Icons.devices, Colors.orangeAccent, 3),
            _buildCard(context, "الأمان والخصوصية", Icons.security, Colors.redAccent, 4),
            _buildCard(context, "الإعدادات والتطوير", Icons.settings, Colors.tealAccent, 5),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, IconData icon, Color color, int index) {
    return GestureDetector(
      onTap: () {
        if (index == 0) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const IntelligenceCenterScreen()));
        } else if (index == 1) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const BusinessCenterScreen()));
        } else if (index == 2) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CreativityCenterScreen()));
        } else if (index == 3) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const DevicesCenterScreen()));
        } else if (index == 4) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SecurityCenterScreen()));
        } else if (index == 5) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsCenterScreen()));
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0B1220),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFF1E2A44)),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 5))],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 45, color: color),
            const SizedBox(height: 12),
            Text(title, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
