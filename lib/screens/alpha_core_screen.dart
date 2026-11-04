import "package:flutter/material.dart";

class AlphaCoreScreen extends StatefulWidget {
  const AlphaCoreScreen({super.key});

  @override
  State<AlphaCoreScreen> createState() => _AlphaCoreScreenState();
}

class _AlphaCoreScreenState extends State<AlphaCoreScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [
    {"role": "bot", "text": "أهلاً بك في Alpha Core. كيف يمكنني مساعدتك؟"}
  ];

  String _getBotResponse(String userText) {
    final text = userText.toLowerCase().trim();

    if (text.contains("سلام") || text.contains("مرحبا") || text.contains("هلا")) {
      return "وعليكم السلام ورحمة الله وبركاته! كيف حالك اليوم؟";
    }
    if (text.contains("اسمك") || text.contains("من انت") || text.contains("مين انت")) {
      return "أنا ألفا بوت، مساعدك الذكي الشخصي. الإصدار العاشر (V10).";
    }
    if (text.contains("اركان الاسلام") || text.contains("أركان الإسلام")) {
      return "أركان الإسلام خمسة: الشهادتان، الصلاة، الزكاة، صوم رمضان، وحج البيت لمن استطاع إليه سبيلاً.";
    }
    if (text.contains("صلاه") || text.contains("صلاة")) {
      return "الصلاة عماد الدين. هل تريد معرفة مواقيت الصلاة اليوم؟";
    }
    if (text.contains("شكرا") || text.contains("مشكور")) {
      return "العفو! أنا دائماً في خدمتك.";
    }
    if (text.contains("كيف حالك") || text.contains("اخبارك")) {
      return "أنا بخير، شكراً لسؤالك! كيف يمكنني خدمتك اليوم؟";
    }

    return "لقد استلمت رسالتك: \"$userText\". (أنا نسخة تجريبية، وسأتعلم المزيد قريباً!)";
  }

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;
    
    final userText = _controller.text;
    setState(() {
      _messages.add({"role": "user", "text": userText});
      _messages.add({"role": "bot", "text": _getBotResponse(userText)});
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF05070D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1220),
        title: const Text("Alpha Core - العقل المركزي", style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.blueAccent),
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
                    child: Text(
                      msg["text"]!,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
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
                      hintText: "اكتب رسالتك هنا...",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blueAccent),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
