import 'package:flutter/material.dart';

class LiveItem {
  final ImageProvider? image;
  final bool isLive;
  const LiveItem({this.image, this.isLive = false});
}

class LiveAvatar extends StatelessWidget {
  final LiveItem item;
  final double size;
  final double ringWidth;
  final Color liveColor;
  final Color idleColor;

  const LiveAvatar({
    super.key,
    required this.item,
    this.size = 64,
    this.ringWidth = 3,
    this.liveColor = const Color(0xFFFF3D3D),
    this.idleColor = const Color(0xFF9AA7B6),
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = item.isLive ? liveColor : idleColor.withOpacity(0.8);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: ringWidth),
      ),
      child: Padding(
        padding: EdgeInsets.all(ringWidth),
        child: ClipOval(
          child: item.image != null
              ? Image(
                  image: item.image!,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(color: Colors.black26),
                )
              : Container(color: Colors.black26),
        ),
      ),
    );
  }
}

class LiveList extends StatelessWidget {
  final List<LiveItem> items;
  final double itemSize;
  final double spacing;
  final EdgeInsets padding;
  const LiveList({
    super.key,
    required this.items,
    this.itemSize = 64,
    this.spacing = 16,
    this.padding = const EdgeInsets.symmetric(horizontal: 0),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: itemSize,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: padding,
        itemBuilder: (_, i) => LiveAvatar(item: items[i], size: itemSize),
        separatorBuilder: (_, __) => SizedBox(width: spacing),
        itemCount: items.length,
      ),
    );
  }
}
