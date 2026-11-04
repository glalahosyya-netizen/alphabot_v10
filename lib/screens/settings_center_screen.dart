import "package:flutter/material.dart";

class SettingsCenterScreen extends StatelessWidget {
  const SettingsCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF05070D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1220),
        title: const Text(
          "الإعدادات والتطوير",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.tealAccent),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildModule(Icons.settings, "إعدادات التطبيق"),
          _buildModule(Icons.attach_money, "Alpha Costs - التكلفة"),
          _buildModule(Icons.update, "Alpha Updates - التحديثات"),
          _buildModule(Icons.store, "Alpha Store - المتجر"),
          _buildModule(Icons.analytics, "Analytics - التحليلات"),
          _buildModule(Icons.school, "مركز التعلم"),
          _buildModule(Icons.record_voice_over, "إعدادات الشخصية والصوت"),
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
        leading: Icon(icon, color: Colors.tealAccent, size: 28),
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
