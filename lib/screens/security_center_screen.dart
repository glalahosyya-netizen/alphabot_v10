import "package:flutter/material.dart";

class SecurityCenterScreen extends StatelessWidget {
  const SecurityCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الأمان والخصوصية")),
      body: const Center(child: Text("شاشة الأمان شغالة!")),
    );
  }
}
