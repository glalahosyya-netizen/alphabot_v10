import "package:flutter/material.dart";

class CreativityCenterScreen extends StatelessWidget {
  const CreativityCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF05070D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1220),
        title: const Text(
          "الإبداع والإنتاج",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.purpleAccent),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildModule(Icons.brush, "Alpha Studio - الاستوديو"),
          _buildModule(Icons.web, "Alpha Web - المواقع"),
          _buildModule(Icons.code, "Alpha Code - البرمجة"),
          _buildModule(Icons.apps, "Alpha Apps - التطبيقات"),
          _buildModule(Icons.article, "Alpha Content - المحتوى"),
          _buildModule(Icons.publish, "Alpha Publish - النشر"),
          _buildModule(Icons.translate, "Alpha Language - اللغة"),
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
        leading: Icon(icon, color: Colors.purpleAccent, size: 28),
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
