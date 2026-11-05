import "package:flutter/material.dart";
import "package:speech_to_text/speech_to_text.dart" as stt;
import "../theme/app_theme.dart";
import "../widgets/command_input.dart";
import "../widgets/mic_button.dart";
import "../widgets/pause_button.dart";
import "../widgets/robot_face.dart";
import "../widgets/side_menu.dart";
import "../widgets/top_bar.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _listening = false;
  bool _paused = false;
  String _status = "جاهز للاستماع";
  
  final stt.SpeechToText _speech = stt.SpeechToText();
  String _recognizedText = "";

  void _toggleMic() async {
    if (!_listening) {
      // تهيئة الميكروفون
      bool available = await _speech.initialize(
        onStatus: (val) => print('Status: $val'),
        onError: (val) => print('Error: $val'),
      );
      
      if (available) {
        setState(() {
          _paused = false;
          _listening = true;
          _status = "يستمع إليك الآن...";
        });
        
        // بدء الاستماع باللغة العربية
        _speech.listen(
          onResult: (val) => setState(() {
            _recognizedText = val.recognizedWords;
            if (_recognizedText.isNotEmpty) {
              _status = _recognizedText;
            }
          }),
          localeId: "ar_SA",
        );
      } else {
        setState(() {
          _status = "تعذر تشغيل الميكروفون (تأكد من الصلاحيات)";
        });
      }
    } else {
      // إيقاف الاستماع
      setState(() {
        _listening = false;
        _status = _recognizedText.isEmpty ? "جاهز للاستماع" : _recognizedText;
      });
      _speech.stop();
    }
  }

  void _togglePause() {
    setState(() {
      _paused = !_paused;
      if (_paused) {
        _listening = false;
        _speech.stop();
        _status = "متوقف مؤقتًا";
      } else {
        _status = "جاهز للاستماع";
      }
    });
  }

  void _submitCommand(String value) {
    setState(() {
      _status = "الأمر: $value";
    });
  }

  Widget _buildStatus() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: Text(
        _status,
        key: ValueKey(_status),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: _paused ? AppColors.textMuted : AppColors.textPrimary.withOpacity(0.85),
          fontSize: 14,
          letterSpacing: 0.4,
        ),
      ),
    );
  }

  Widget _buildControls() {
    return Row(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: PauseButton(paused: _paused, onTap: _togglePause),
          ),
        ),
        MicButton(listening: _listening, onTap: _toggleMic),
        const Expanded(child: SizedBox()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: const SideMenu(),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -0.35),
            radius: 1.4,
            colors: [Color(0xFF0B1730), AppColors.background],
            stops: [0.0, 1.0],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 12),
            child: Column(
              children: [
                const TopBar(),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, c) {
                      final robotSize = (c.maxHeight * 0.58).clamp(120.0, 260.0);
                      return SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(minHeight: c.maxHeight),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RobotFace(
                                size: robotSize,
                                listening: _listening,
                                paused: _paused,
                              ),
                              const SizedBox(height: 22),
                              _buildStatus(),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
                CommandInput(onSubmit: _submitCommand),
                const SizedBox(height: 20),
                _buildControls(),
                const SizedBox(height: 6),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
