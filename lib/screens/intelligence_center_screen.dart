import "package:flutter/material.dart";
import "alpha_core_screen.dart";

class IntelligenceCenterScreen extends StatelessWidget {
  const IntelligenceCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF05070D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1220),
        title: const Text("مركز الذكاء", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.blueAccent),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildModule(context, Icons.memory, "Alpha Core - العقل المركزي", true),
          _buildModule(context, Icons.lightbulb_outline, "Alpha Think - التفكير والتحليل", false),
          _buildModule(context, Icons.alt_route, "Alpha Decision - اتخاذ القرار", false),
          _buildModule(context, Icons.groups, "Alpha Team - فريق المساعدين", false),
          _buildModule(context, Icons.psychology, "Alpha Memory Plus - الذاكرة", false),
          _buildModule(context, Icons.auto_awesome, "Alpha Ideas - توليد الأفكار", false),
          _buildModule(context, Icons.record_voice_over, "Alpha Live - المحادثة المباشرة", false),
        ],
      ),
    );
  }

  Widget _buildModule(BuildContext context, IconData icon, String title, bool isCore) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF0B1220),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E2A44)),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent, size: 28),
        title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600)),
        trailing: const Icon(Icons.arrow_back_ios_new, color: Colors.grey, size: 16),
        onTap: () {
          if (isCore) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AlphaCoreScreen()));
          }
        },
      ),
    );
  }
}
