import 'package:flutter/material.dart';
import 'package:live_star_dom_mobile/components/bottom_nav_with_animated_icons.dart';
import 'package:live_star_dom_mobile/screens/discover/discover_screen.dart';
import 'package:live_star_dom_mobile/screens/home/home_screen.dart';
import 'package:live_star_dom_mobile/screens/search/search_screen.dart';
import 'package:live_star_dom_mobile/screens/settings/settings_screen.dart';

class RootShell extends StatefulWidget {
  const RootShell({super.key});

  @override
  State<RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<RootShell> {
  int _index = 0;

  final _pages = const [
    HomeScreen(),
    DiscoverScreen(),
    SearchScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _index,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavWithAnimatedIcons(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
      ),
    );
  }
}
