import 'package:flutter/material.dart';
import 'intelligence_center_screen.dart';

class CentersScreen extends StatelessWidget {
  const CentersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المراكز')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('مركز الذكاء'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const IntelligenceCenterScreen()),
              );
            },
          ),
          const ListTile(title: Text('الأعمال والمشاريع')),
          const ListTile(title: Text('الإبداع والإنتاج')),
          const ListTile(title: Text('الأجهزة والشبكات')),
          const ListTile(title: Text('الأمان والخصوصية')),
          const ListTile(title: Text('الإعدادات والتطوير')),
        ],
      ),
    );
  }
}
