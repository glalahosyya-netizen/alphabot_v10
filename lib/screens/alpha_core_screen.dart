import "package:flutter/material.dart";
import "dart:convert";
import "package:shared_preferences/shared_preferences.dart";
import "package:url_launcher/url_launcher.dart";

class AlphaCoreScreen extends StatefulWidget {
  final String? initialMessage;
  const AlphaCoreScreen({super.key, this.initialMessage});

  @override
  State<AlphaCoreScreen> createState() => _AlphaCoreScreenState();
}

class _AlphaCoreScreenState extends State<AlphaCoreScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> _messages = [
    {"role": "bot", "text": "أهلاً بك في Alpha Core. يمكنك سؤالي أو طلب فتح تطبيق (مثلاً: افتح يوتيوب)."}
  ];

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    await _loadMessages();
    if (widget.initialMessage != null && widget.initialMessage!.isNotEmpty) {
      _processUserMessage(widget.initialMessage!);
    }
  }

  Future<void> _saveMessages() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("alpha_chat_history", jsonEncode(_messages));
  }

  Future<void> _loadMessages() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString("alpha_chat_history");
    if (saved != null) {
      final decoded = jsonDecode(saved) as List;
      setState(() {
        _messages = decoded.map((e) => Map<String, String>.from(e)).toList();
      });
    }
  }

  // دالة معالجة الرسائل وتنفيذ الأوامر
  void _processUserMessage(String userText) async {
    setState(() {
      _messages.add({"role": "user", "text": userText});
    });
    _controller.clear();
    _saveMessages();

    final text = userText.toLowerCase().trim();
    String botResponse = "";
    bool isAction = false;

    // التحقق من الأوامر
    if (text.contains("افتح جوجل") || text.contains("open google")) {
      botResponse = "جاري فتح جوجل...";
      isAction = true;
      _openUrl("https://www.google.com");
    } else if (text.contains("افتح يوتيوب") || text.contains("open youtube")) {
      botResponse = "جاري فتح يوتيوب...";
      isAction = true;
      _openUrl("https://www.youtube.com");
    } else if (text.contains("بحث عن")) {
      final query = text.replaceAll("بحث عن", "").trim();
      botResponse = "جاري البحث عن: $query";
      isAction = true;
      _openUrl("https://www.google.com/search?q=$query");
    } else if (text.contains("سلام") || text.contains("مرحبا") || text.contains("هلا")) {
      botResponse = "وعليكم السلام ورحمة الله وبركاته! كيف حالك اليوم؟";
    } else if (text.contains("اسمك") || text.contains("من انت")) {
      botResponse = "أنا ألفا بوت، مساعدك الذكي الشخصي. الإصدار العاشر (V10).";
    } else if (text.contains("شكرا") || text.contains("مشكور")) {
      botResponse = "العفو! أنا دائماً في خدمتك.";
    } else {
      botResponse = "لقد استلمت رسالتك: \"$userText\". (أنا نسخة تجريبية، وسأتعلم المزيد قريباً!)";
    }

    // إضافة رد الروبوت
    setState(() {
      _messages.add({"role": "bot", "text": botResponse});
    });
    _saveMessages();
  }

  Future<void> _openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("alpha_chat_history");
    setState(() {
      _messages = [{"role": "bot", "text": "تم مسح الذاكرة. أهلاً بك من جديد!"}];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF05070D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1220),
        title: const Text("Alpha Core", style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.blueAccent),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep, color: Colors.redAccent),
            onPressed: _clearHistory,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                final isUser = msg["role"] == "user";
                return Align(
                  alignment: isUser ? Alignment.centerLeft : Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blueAccent.withOpacity(0.2) : const Color(0xFF0B1220),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: isUser ? Colors.blueAccent : const Color(0xFF1E2A44)),
                    ),
                    child: Text(msg["text"]!, style: const TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: const Color(0xFF0B1220),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: "اكتب رسالتك هنا... (مثلاً: افتح يوتيوب)",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                    onSubmitted: (value) => _processUserMessage(value),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blueAccent),
                  onPressed: () => _processUserMessage(_controller.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
