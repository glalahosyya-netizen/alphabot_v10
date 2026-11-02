import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class PauseButton extends StatelessWidget {
  final bool paused;
  final VoidCallback onTap;

  const PauseButton({
    super.key,
    required this.paused,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 260),
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.surface,
          border: Border.all(
            color: paused ? AppColors.primary : AppColors.border,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 14,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Icon(
          paused ? Icons.play_arrow_rounded : Icons.pause_rounded,
          color: paused ? AppColors.primary : AppColors.textPrimary,
          size: 26,
        ),
      ),
    );
  }
}
