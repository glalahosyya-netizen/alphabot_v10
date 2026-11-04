import 'package:flutter/material.dart';

class IntelligenceCenterScreen extends StatelessWidget {
  const IntelligenceCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مركز الذكاء')),
      body: const Center(
        child: Text('شاشة مركز الذكاء شغالة!', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
