import 'dart:ui';

import 'package:flutter/material.dart';

import '../model/action_item.dart';
import '../model/tab_item.dart';
import 'action_grid.dart';
import 'pill_tab_bar_contents.dart';

class ExpandableSurface extends StatelessWidget {
  final List<TabItem> tabs;
  final List<ActionItem> actions;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;
  final ValueChanged<String> onActionTap;
  final double t;
  final double rawT;

  const ExpandableSurface({
    super.key,
    required this.tabs,
    required this.actions,
    required this.selectedIndex,
    required this.onTabSelected,
    required this.onActionTap,
    required this.t,
    required this.rawT,
  });

  @override
  Widget build(BuildContext context) {
    final tabOpacity = (1 - rawT * 2.8).clamp(0.0, 1.0);
    final radius = lerpDouble(28, 24, t)!;
    final blur = lerpDouble(16, 28, t)!;
    final offset = lerpDouble(6, 14, t)!;

    return Container(
      height: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: lerpDouble(0.9, 0.96, t)!),
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: lerpDouble(0.08, 0.11, t)!),
            blurRadius: blur,
            offset: Offset(0, offset),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned.fill(
            child: IgnorePointer(
              ignoring: rawT < 0.6,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
                child: ActionGrid(
                  actions: actions,
                  t: rawT,
                  onTap: onActionTap,
                ),
              ),
            ),
          ),
          Positioned(
            left: 6,
            right: 6,
            bottom: 6,
            height: 44,
            child: IgnorePointer(
              ignoring: rawT > 0.15,
              child: Opacity(
                opacity: tabOpacity,
                child: Transform.translate(
                  offset: Offset(0, -8 * rawT),
                  child: PillTabBarContents(
                    tabs: tabs,
                    selectedIndex: selectedIndex,
                    onTabSelected: onTabSelected,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
