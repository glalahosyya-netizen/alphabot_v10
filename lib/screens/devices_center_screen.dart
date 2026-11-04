import "package:flutter/material.dart";
import "alpha_control_screen.dart";

class DevicesCenterScreen extends StatelessWidget {
  const DevicesCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF05070D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1220),
        title: const Text(
          "الأجهزة والشبكات",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.orangeAccent),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildModule(context, Icons.phone_android, "Alpha Control - التحكم بالهاتف", true),
          _buildModule(context, Icons.computer, "التحكم بكمبيوتر Windows", false),
          _buildModule(context, Icons.cast, "مشاركة الشاشة", false),
          _buildModule(context, Icons.wifi, "Alpha Net - الشبكات", false),
          _buildModule(context, Icons.audiotrack, "Alpha Audio - الصوت", false),
          _buildModule(context, Icons.offline_bolt, "المهام المحلية دون إنترنت", false),
          _buildModule(context, Icons.copy_all, "Alpha Twin - البيئة التجريبية", false),
        ],
      ),
    );
  }

  Widget _buildModule(BuildContext context, IconData icon, String title, bool isControl) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF0B1220),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E2A44)),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.orangeAccent, size: 28),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
        ),
        trailing: const Icon(Icons.arrow_back_ios_new, color: Colors.grey, size: 16),
        onTap: () {
          if (isControl) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AlphaControlScreen()),
            );
          }
        },
      ),
    );
  }
}
