import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LiveSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTapSearch;
  final bool simple;
  final String hintText;
  final double height;
  final Color buttonColor;
  final Color wedgeColor;
  final Color underlayColor;
  final double underlayOffset;
  final double underlayDy;
  final double underlayScale;
  final double wedgeFactor;
  final Color borderColor;
  final Color backgroundColor;

  const LiveSearchBar({
    super.key,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onTapSearch,
    this.simple = true,
    this.hintText = 'Search ...',
    this.height = 44,
    this.buttonColor = const Color(0xD938BDF8),
    this.wedgeColor = const Color(0x990EA5E9),
    this.underlayColor = const Color(0x660EA5E9),
    this.underlayOffset = 8,
    this.underlayDy = 2,
    this.underlayScale = 1.08,
    this.wedgeFactor = 1.0,
    this.borderColor = const Color(0x33FFFFFF),
    this.backgroundColor = const Color(0x10000000),
  });

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(height / 2);
    final buttonWidth = height + 28;
    final wedgeWidth = height * wedgeFactor;
    if (simple) {
      return Container(
        height: height,
        padding: const EdgeInsets.only(left: 12, right: 2),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: radius,
          border: Border.all(color: borderColor, width: 1.2),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                onSubmitted: onSubmitted,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 14,
                  ),
                  isCollapsed: true,
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: onTapSearch,
              behavior: HitTestBehavior.opaque,
              child: Container(
                width: height - 6,
                height: height - 6,
                decoration: BoxDecoration(
                  color: buttonColor,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Iconsax.search_normal,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: radius,
        border: Border.all(color: borderColor, width: 1.2),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: controller,
                      onChanged: onChanged,
                      onSubmitted: onSubmitted,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        hintText: hintText,
                        hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 14,
                        ),
                        isCollapsed: true,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: buttonWidth + underlayOffset),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: onTapSearch,
              behavior: HitTestBehavior.opaque,
              child: SizedBox(
                width: buttonWidth + underlayOffset,
                height: height,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      right: 0,
                      top: underlayDy,
                      child: Container(
                        width: buttonWidth * underlayScale,
                        height: height * underlayScale,
                        decoration: BoxDecoration(
                          color: underlayColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular((height * underlayScale) / 2),
                            bottomRight: Radius.circular((height * underlayScale) / 2),
                          ),
                        ),
                      ),
                    ),
                    // Wedge overlay protruding to the left of the button
                    Positioned(
                      right: underlayOffset + buttonWidth,
                      top: 0,
                      child: ClipPath(
                        clipper: _ApexLeftWedgeClipper(),
                        child: Container(
                          width: wedgeWidth,
                          height: height,
                          color: wedgeColor,
                        ),
                      ),
                    ),
                    // Button (pill with vertical left edge and rounded right edge)
                    Positioned(
                      right: underlayOffset,
                      top: 0,
                      child: ClipPath(
                        clipper: _ButtonWithDiagonalClipper(cut: wedgeWidth),
                        child: Container(
                          width: buttonWidth,
                          height: height,
                          color: buttonColor,
                          child: Center(
                            child: Container(
                              width: height * 0.72,
                              height: height * 0.72,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                              child: const Center(
                                child: Icon(
                                  Iconsax.search_normal,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LeftWedgeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _ApexLeftWedgeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // Apex at left center, base vertical at the right
    final path = Path();
    path.moveTo(0, size.height / 2);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _ButtonWithDiagonalClipper extends CustomClipper<Path> {
  final double cut;
  _ButtonWithDiagonalClipper({required this.cut});

  @override
  Path getClip(Size size) {
    final r = size.height / 2;
    final w = size.width;
    final h = size.height;
    final double c = cut.clamp(0.0, w).toDouble();
    final path = Path();
    // Start at top-left after cut
    path.moveTo(c, 0);
    // Top straight to before right arc
    path.lineTo(w - r, 0);
    // Right arc
    path.arcToPoint(
      Offset(w - r, h),
      radius: Radius.circular(r),
      clockwise: true,
    );
    // Bottom straight back to cut position
    path.lineTo(c, h);
    // Diagonal back to middle-left point to create the wedge cut
    path.lineTo(0, h / 2);
    // Close back to start
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
