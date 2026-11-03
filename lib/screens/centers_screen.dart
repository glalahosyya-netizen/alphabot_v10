import 'package:flutter/material.dart';
import 'intelligence_center_screen.dart';

class CentersScreen extends StatelessWidget {
  const CentersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المراكز الرئيسية'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.psychology),
            title: const Text('مركز الذكاء'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const IntelligenceCenterScreen()),
              );
            },
          ),
          const ListTile(
            leading: Icon(Icons.work),
            title: Text('الأعمال والمشاريع'),
          ),
          const ListTile(
            leading: Icon(Icons.palette),
            title: Text('الإبداع والإنتاج'),
          ),
          const ListTile(
            leading: Icon(Icons.devices),
            title: Text('الأجهزة والشبكات'),
          ),
          const ListTile(
            leading: Icon(Icons.security),
            title: Text('الأمان والخصوصية'),
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('الإعدادات والتطوير'),
          ),
        ],
      ),
    );
  }
}
