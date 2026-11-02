import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CentersScreen extends StatelessWidget {
  const CentersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final centers = [
      {'title': 'مركز الذكاء', 'icon': Icons.psychology, 'color': Colors.blueAccent},
      {'title': 'الأعمال والمشاريع', 'icon': Icons.work, 'color': Colors.greenAccent},
      {'title': 'الإبداع والإنتاج', 'icon': Icons.palette, 'color': Colors.purpleAccent},
      {'title': 'الأجهزة والشبكات', 'icon': Icons.devices, 'color': Colors.orangeAccent},
      {'title': 'الأمان والخصوصية', 'icon': Icons.security, 'color': Colors.redAccent},
      {'title': 'الإعدادات والتطوير', 'icon': Icons.settings, 'color': Colors.tealAccent},
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'المراكز الرئيسية',
          style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.primary),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: centers.length,
          itemBuilder: (context, index) {
            final center = centers[index];
            return Container(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.border),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    center['icon'] as IconData,
                    size: 45,
                    color: center['color'] as Color,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    center['title'] as String,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
