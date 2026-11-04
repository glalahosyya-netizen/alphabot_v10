import "package:flutter/material.dart";

class SecurityCenterScreen extends StatelessWidget {
  const SecurityCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF05070D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1220),
        title: const Text(
          "الأمان والخصوصية",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.redAccent),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildModule(Icons.privacy_tip, "Alpha Privacy - الخصوصية"),
          _buildModule(Icons.lock, "Alpha Vault - الخزنة"),
          _buildModule(Icons.vpn_key, "Alpha Permission - الصلاحيات"),
          _buildModule(Icons.shield, "Alpha Safe Mode - الوضع الآمن"),
          _buildModule(Icons.security, "Alpha Device Guard - حماية الجهاز"),
          _buildModule(Icons.backup, "Alpha Backup - النسخ الاحتياطي"),
          _buildModule(Icons.restore, "Alpha Recovery - الاستعادة"),
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
        leading: Icon(icon, color: Colors.redAccent, size: 28),
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
