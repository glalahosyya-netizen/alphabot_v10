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

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;
    
    setState(() {
      _messages.add({"role": "user", "text": _controller.text});
      // رد تجريبي من الروبوت (بدون ذكاء اصطناعي حقيقي حالياً)
      _messages.add({"role": "bot", "text": "استلمت طلبك: ${_controller.text}. جاري التحليل..."});
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
