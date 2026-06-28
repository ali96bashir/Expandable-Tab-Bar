import 'package:flutter/material.dart';

import '../model/tab_item.dart';

class TabIcon extends StatelessWidget {
  final TabItem item;
  final bool selected;
  final VoidCallback onTap;

  const TabIcon({
    super.key,
    required this.item,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 260),
        curve: Curves.easeOutBack,
        scale: selected ? 1.06 : 1,
        child: SizedBox(
          width: 44,
          height: 44,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 180),
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeIn,
                child: Icon(
                  selected ? item.filledIcon : item.icon,
                  key: ValueKey('${item.label}-$selected'),
                  size: 22,
                  color: selected
                      ? const Color(0xFF1C1C1E)
                      : const Color(0xFF8E8E93),
                ),
              ),
              if (item.showBadge)
                Positioned(
                  top: 9,
                  right: 11,
                  child: Container(
                    width: 7,
                    height: 7,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF3B30),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
