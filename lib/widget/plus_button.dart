import 'package:flutter/material.dart';

class PlusButton extends StatelessWidget {
  final double t;
  final VoidCallback onTap;

  const PlusButton({super.key, required this.t, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.9),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Center(
          child: Transform.rotate(
            angle:
                Curves.easeOut.transform((t / 0.55).clamp(0.0, 1.0)) *
                0.7853981633974483,
            child: Icon(Icons.add, size: 26, color: Color(0xFF1C1C1E)),
          ),
        ),
      ),
    );
  }
}
