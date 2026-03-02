import 'package:flutter/material.dart';
import 'package:live_star_dom_mobile/models/nav_item_model.dart';

const Color bottomNavColor = Colors.black;

class BottomNavWithAnimatedIcons extends StatefulWidget {
  const BottomNavWithAnimatedIcons({super.key});

  @override
  State<BottomNavWithAnimatedIcons> createState() =>
      _BottomNavWithAnimatedIconsState();
}

class _BottomNavWithAnimatedIconsState
    extends State<BottomNavWithAnimatedIcons> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 56,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: bottomNavColor.withOpacity(0.8),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: bottomNavColor.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            bottomNavItems.length,
            (index) {
              final isSelected = index == _selectedIndex;
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: SizedBox(
                  width: 52,
                  height: 32,
                  child: Center(
                    child: Icon(
                      bottomNavItems[index].icon,
                      size: 26,
                      color: isSelected ? Colors.white : Colors.white54,
                    ),
                  ),
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
