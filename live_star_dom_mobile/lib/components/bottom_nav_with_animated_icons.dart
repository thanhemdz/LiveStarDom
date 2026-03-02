import 'package:flutter/material.dart';
import 'package:live_star_dom_mobile/models/nav_item_model.dart';

const Color bottomNavColor = Colors.black;

class BottomNavWithAnimatedIcons extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  const BottomNavWithAnimatedIcons({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

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
          children: List.generate(bottomNavItems.length, (index) {
            final isSelected = index == currentIndex;
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => onTap(index),
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
          }),
        ),
      ),
    );
  }
}
