import "package:flutter/material.dart";
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

  void _toggleMic() {
    setState(() {
      if (_paused) _paused = false;
      _listening = !_listening;
      _status = _listening ? "يستمع إليك الآن..." : "جاهز للاستماع";
      
      if (_listening) {
        // هنا نضيف تنبيه بسيط (محاكاة للاستماع)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("جاري الاستماع إلى صوتك... (وضع تجريبي)"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    });
  }

  void _togglePause() {
    setState(() {
      _paused = !_paused;
      if (_paused) {
        _listening = false;
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
