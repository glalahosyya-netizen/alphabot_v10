import "package:flutter/material.dart";

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
          _buildModule(Icons.phone_android, "Alpha Control - التحكم بالهاتف"),
          _buildModule(Icons.computer, "التحكم بكمبيوتر Windows"),
          _buildModule(Icons.cast, "مشاركة الشاشة"),
          _buildModule(Icons.wifi, "Alpha Net - الشبكات"),
          _buildModule(Icons.audiotrack, "Alpha Audio - الصوت"),
          _buildModule(Icons.offline_bolt, "المهام المحلية دون إنترنت"),
          _buildModule(Icons.copy_all, "Alpha Twin - البيئة التجريبية"),
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
        leading: Icon(icon, color: Colors.orangeAccent, size: 28),
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
