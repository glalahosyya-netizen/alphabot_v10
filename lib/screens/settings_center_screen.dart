import "package:flutter/material.dart";

class SettingsCenterScreen extends StatelessWidget {
  const SettingsCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الإعدادات والتطوير")),
      body: const Center(child: Text("شاشة الإعدادات شغالة!")),
    );
  }
}
