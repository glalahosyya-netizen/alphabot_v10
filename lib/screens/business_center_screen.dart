import "package:flutter/material.dart";

class BusinessCenterScreen extends StatelessWidget {
  const BusinessCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الأعمال والمشاريع")),
      body: const Center(child: Text("شاشة الأعمال شغالة!")),
    );
  }
}
