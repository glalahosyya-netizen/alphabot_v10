import 'package:flutter/material.dart';

class CentersScreen extends StatelessWidget {
  const CentersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المراكز')),
      body: const Center(
        child: Text(
          'قيد الإنشاء',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
