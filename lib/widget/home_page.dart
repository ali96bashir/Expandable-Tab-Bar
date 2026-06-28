import 'package:flutter/material.dart';

import '../model/action_item.dart';
import '../model/tab_item.dart';
import 'expandable_tab_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTab = 0;

  static const tabs = [
    TabItem(
      icon: Icons.home_outlined,
      filledIcon: Icons.home_filled,
      label: 'Home',
    ),
    TabItem(
      icon: Icons.inbox_outlined,
      filledIcon: Icons.inbox,
      label: 'Inbox',
    ),
    TabItem(
      icon: Icons.notifications_outlined,
      filledIcon: Icons.notifications,
      label: 'Notifications',
      showBadge: true,
    ),
    TabItem(
      icon: Icons.layers_outlined,
      filledIcon: Icons.layers,
      label: 'Layers',
    ),
  ];

  static const actions = [
    ActionItem(icon: Icons.content_cut, label: 'Trim'),
    ActionItem(icon: Icons.crop, label: 'Crop'),
    ActionItem(icon: Icons.auto_fix_high, label: 'Enhance'),
    ActionItem(icon: Icons.title, label: 'Text'),
    ActionItem(icon: Icons.music_note_outlined, label: 'Audio'),
    ActionItem(icon: Icons.speed, label: 'Speed'),
    ActionItem(icon: Icons.copy_outlined, label: 'Duplicate'),
    ActionItem(icon: Icons.undo, label: 'Undo'),
    ActionItem(icon: Icons.ios_share, label: 'Share'),
    ActionItem(icon: Icons.bookmark_border, label: 'Save'),
    ActionItem(icon: Icons.delete_outline, label: 'Delete'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  tabs[_selectedTab].label,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1C1C1E),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 24,
              child: ExpandableTabBar(
                tabs: tabs,
                actions: actions,
                selectedIndex: _selectedTab,
                onTabSelected: (i) => setState(() => _selectedTab = i),
                onActionTap: (label) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(milliseconds: 900),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: const Color(0xFF1C1C1E),
                      content: Text(
                        label,
                        style: const TextStyle(fontFamily: 'IBMPlexSans'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
