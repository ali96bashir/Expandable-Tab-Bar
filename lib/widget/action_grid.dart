import 'package:flutter/material.dart';

import '../model/action_item.dart';
import 'action_tile.dart';
import 'anim_helpers.dart';

class ActionGrid extends StatelessWidget {
  final List<ActionItem> actions;
  final double t;
  final ValueChanged<String> onTap;

  const ActionGrid({
    super.key,
    required this.actions,
    required this.t,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Wrap(
        spacing: 8,
        runSpacing: 6,
        children: [
          for (int i = 0; i < actions.length; i++)
            ActionTile(
              action: actions[i],
              t: interval(t, 0.28 + i * 0.035, 0.78 + i * 0.02),
              onTap: onTap,
            ),
        ],
      ),
    );
  }
}
