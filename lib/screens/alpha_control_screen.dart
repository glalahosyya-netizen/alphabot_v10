import "package:flutter/material.dart";
import "package:url_launcher/url_launcher.dart";

class AlphaControlScreen extends StatelessWidget {
  const AlphaControlScreen({super.key});

  Future<void> _openSettings(BuildContext context) async {
    final Uri settingsUri = Uri.parse("app-settings:");
    
    try {
      if (await canLaunchUrl(settingsUri)) {
        await launchUrl(settingsUri);
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("لا يمكن فتح الإعدادات على هذا الجهاز.")),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("حدث خطأ أثناء محاولة فتح الإعدادات.")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF05070D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1220),
        title: const Text("Alpha Control - التحكم", style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.orangeAccent),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.settings, size: 80, color: Colors.orangeAccent),
            const SizedBox(height: 20),
            const Text(
              "التحكم بإعدادات الهاتف",
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              icon: const Icon(Icons.open_in_new, color: Colors.black),
              label: const Text("فتح الإعدادات", style: TextStyle(color: Colors.black, fontSize: 18)),
              onPressed: () => _openSettings(context),
            ),
          ],
        ),
      ),
    );
  }
} 
