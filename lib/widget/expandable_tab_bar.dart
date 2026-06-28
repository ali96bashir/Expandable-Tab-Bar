import 'dart:ui';

import 'package:flutter/material.dart';

import '../model/action_item.dart';
import '../model/tab_item.dart';
import 'anim_helpers.dart';
import 'expandable_surface.dart';
import 'plus_button.dart';

class ExpandableTabBar extends StatefulWidget {
  final List<TabItem> tabs;
  final List<ActionItem> actions;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;
  final ValueChanged<String> onActionTap;

  const ExpandableTabBar({
    super.key,
    required this.tabs,
    required this.actions,
    required this.selectedIndex,
    required this.onTabSelected,
    required this.onActionTap,
  });

  @override
  State<ExpandableTabBar> createState() => _ExpandableTabBarState();
}

class _ExpandableTabBarState extends State<ExpandableTabBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 440),
    reverseDuration: const Duration(milliseconds: 320),
  );

  late final Animation<double> _openCurve = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOutBack,
    reverseCurve: Curves.easeInCubic,
  );

  void _toggle() {
    if (_controller.isAnimating) return;
    if (_controller.value == 0) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final t = _openCurve.value;
          final rawT = _controller.value;
          final isClosing = _controller.status == AnimationStatus.reverse;
          final expandT = isClosing ? t : interval(rawT, 0.32, 1);
          final panelHeight = lerpDouble(56, 222, expandT)!.clamp(56.0, 222.0);
          final squeezeValue = squeeze(rawT, isClosing);
          final surfaceScaleX = 1 - squeezeValue * 0.5;
          final surfaceScaleY = 1 - squeezeValue * 0.3;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: panelHeight,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Transform.scale(
                      scaleX: surfaceScaleX,
                      scaleY: surfaceScaleY,
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 258,
                        child: ExpandableSurface(
                          tabs: widget.tabs,
                          actions: widget.actions,
                          selectedIndex: widget.selectedIndex,
                          onTabSelected: widget.onTabSelected,
                          onActionTap: (label) {
                            _controller.reverse();
                            widget.onActionTap(label);
                          },
                          t: t,
                          rawT: rawT,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    PlusButton(t: rawT, onTap: _toggle),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
