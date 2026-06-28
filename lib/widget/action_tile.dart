import 'dart:ui';

import 'package:flutter/material.dart';

import '../model/action_item.dart';

class ActionTile extends StatelessWidget {
  final ActionItem action;
  final double t;
  final ValueChanged<String> onTap;

  const ActionTile({
    super.key,
    required this.action,
    required this.t,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 53.5,
      child: Opacity(
        opacity: t,
        child: Transform.translate(
          offset: Offset(0, 10 * (1 - t)),
          child: Transform.scale(
            scale: lerpDouble(0.84, 1, t)!,
            child: GestureDetector(
              onTap: () => onTap(action.label),
              behavior: HitTestBehavior.opaque,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 43,
                    height: 43,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F2F3),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      action.icon,
                      size: 20,
                      color: const Color(0xFF1C1C1E),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    action.label,
                    style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF3A3A3C),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
