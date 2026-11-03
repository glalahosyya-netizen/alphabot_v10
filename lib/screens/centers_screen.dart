import 'package:flutter/material.dart';

class CentersScreen extends StatelessWidget {
  const CentersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المراكز الرئيسية'),
        backgroundColor: Colors.blueGrey,
      ),
      body: const Center(
        child: Text(
          'المراكز قيد الإنشاء',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
      backgroundColor: const Color(0xFF05070D),
    );
  }
}
