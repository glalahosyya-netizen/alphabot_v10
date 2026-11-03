import 'package:flutter/material.dart';
import 'intelligence_center_screen.dart';

class CentersScreen extends StatelessWidget {
  const CentersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF05070D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1220),
        title: const Text(
          'المراكز الرئيسية',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const IntelligenceCenterScreen()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF0B1220),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFF1E2A44)),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.psychology, size: 45, color: Colors.blueAccent),
                    SizedBox(height: 12),
                    Text('مركز الذكاء', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF0B1220),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF1E2A44)),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.work, size: 45, color: Colors.greenAccent),
                  SizedBox(height: 12),
                  Text('الأعمال والمشاريع', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF0B1220),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF1E2A44)),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.palette, size: 45, color: Colors.purpleAccent),
                  SizedBox(height: 12),
                  Text('الإبداع والإنتاج', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF0B1220),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF1E2A44)),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.devices, size: 45, color: Colors.orangeAccent),
                  SizedBox(height: 12),
                  Text('الأجهزة والشبكات', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF0B1220),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF1E2A44)),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.security, size: 45, color: Colors.redAccent),
                  SizedBox(height: 12),
                  Text('الأمان والخصوصية', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF0B1220),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF1E2A44)),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.settings, size: 45, color: Colors.tealAccent),
                  SizedBox(height: 12),
                  Text('الإعدادات والتطوير', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 
