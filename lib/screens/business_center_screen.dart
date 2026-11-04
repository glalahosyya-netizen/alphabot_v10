import "package:flutter/material.dart";

class BusinessCenterScreen extends StatelessWidget {
  const BusinessCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF05070D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1220),
        title: const Text(
          "الأعمال والمشاريع",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.greenAccent),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildModule(Icons.assignment, "Alpha Mission - تنفيذ المهام"),
          _buildModule(Icons.folder_shared, "إدارة المشاريع"),
          _buildModule(Icons.dashboard, "Alpha Workspace - مساحة العمل"),
          _buildModule(Icons.trending_up, "Alpha Progress - متابعة التقدم"),
          _buildModule(Icons.calendar_month, "الجدول والمواعيد"),
          _buildModule(Icons.account_tree, "Alpha Flow - الأتمتة"),
          _buildModule(Icons.description, "Alpha Docs - المستندات"),
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
        leading: Icon(icon, color: Colors.greenAccent, size: 28),
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
