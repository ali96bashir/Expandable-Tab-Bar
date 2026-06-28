import 'package:flutter/material.dart';

import '../model/tab_item.dart';
import 'tab_icon.dart';

class PillTabBarContents extends StatelessWidget {
  final List<TabItem> tabs;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const PillTabBarContents({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final slotWidth = constraints.maxWidth / tabs.length;
        final indicatorLeft = slotWidth * selectedIndex + (slotWidth - 44) / 2;

        return Stack(
          alignment: Alignment.centerLeft,
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 430),
              curve: Curves.easeOutBack,
              left: indicatorLeft - 2,
              top: 2,
              width: 48,
              height: 40,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.025),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 360),
              curve: Curves.easeOutCubic,
              left: indicatorLeft,
              top: 0,
              width: 44,
              height: 44,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1C1E).withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Row(
              children: [
                for (int i = 0; i < tabs.length; i++)
                  SizedBox(
                    width: slotWidth,
                    child: Center(
                      child: TabIcon(
                        item: tabs[i],
                        selected: i == selectedIndex,
                        onTap: () => onTabSelected(i),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}
