import 'package:flutter/material.dart';
import 'intelligence_center_screen.dart';

class CentersScreen extends StatelessWidget {
  const CentersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF05070D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1220),
        title: const Text('المراكز الرئيسية', style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCard(context, 'مركز الذكاء', Icons.psychology, Colors.blueAccent, true),
          _buildCard(context, 'الأعمال والمشاريع', Icons.work, Colors.greenAccent, false),
          _buildCard(context, 'الإبداع والإنتاج', Icons.palette, Colors.purpleAccent, false),
          _buildCard(context, 'الأجهزة والشبكات', Icons.devices, Colors.orangeAccent, false),
          _buildCard(context, 'الأمان والخصوصية', Icons.security, Colors.redAccent, false),
          _buildCard(context, 'الإعدادات والتطوير', Icons.settings, Colors.tealAccent, false),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, IconData icon, Color color, bool isCenter) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: () {
          if (isCenter) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const IntelligenceCenterScreen()),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF0B1220),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF1E2A44)),
          ),
          child: Row(
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(width: 16),
              Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
