import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class MicButton extends StatelessWidget {
  final bool listening;
  final VoidCallback onTap;

  const MicButton({
    super.key,
    required this.listening,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 260),
        curve: Curves.easeOut,
        width: 84,
        height: 84,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: listening
                ? const [Color(0xFF00E5FF), Color(0xFF0077FF)]
                : const [Color(0xFF1C2942), Color(0xFF0C1424)],
          ),
          border: Border.all(
            color: listening ? AppColors.primaryGlow : AppColors.border,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(listening ? 0.7 : 0.25),
              blurRadius: listening ? 45 : 22,
              spreadRadius: listening ? 8 : 2,
            ),
            const BoxShadow(
              color: Colors.black54,
              blurRadius: 18,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Icon(
          Icons.mic_rounded,
          size: 38,
          color: listening ? const Color(0xFF04121F) : AppColors.primary,
        ),
      ),
    );
  }
}
