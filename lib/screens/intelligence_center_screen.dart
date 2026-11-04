
import "package:flutter/material.dart";

class IntelligenceCenterScreen extends StatelessWidget {
  const IntelligenceCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF05070D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1220),
        title: const Text(
          "مركز الذكاء",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.blueAccent),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildModule(Icons.memory, "Alpha Core - العقل المركزي"),
          _buildModule(Icons.lightbulb_outline, "Alpha Think - التفكير والتحليل"),
          _buildModule(Icons.alt_route, "Alpha Decision - اتخاذ القرار"),
          _buildModule(Icons.groups, "Alpha Team - فريق المساعدين"),
          _buildModule(Icons.psychology, "Alpha Memory Plus - الذاكرة"),
          _buildModule(Icons.auto_awesome, "Alpha Ideas - توليد الأفكار"),
          _buildModule(Icons.record_voice_over, "Alpha Live - المحادثة المباشرة"),
        ],
      ),
    );
  }

  Widget _buildModule(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF0B1220),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E2A44)),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent, size: 28),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
        ),
        trailing: const Icon(Icons.arrow_back_ios_new, color: Colors.grey, size: 16),
        onTap: () {},
      ),
    );
  }
}
