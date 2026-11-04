import "package:flutter/material.dart";

class DevicesCenterScreen extends StatelessWidget {
  const DevicesCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الأجهزة والشبكات")),
      body: const Center(child: Text("شاشة الأجهزة شغالة!")),
    );
  }
}
