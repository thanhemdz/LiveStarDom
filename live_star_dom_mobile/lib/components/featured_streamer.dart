import 'package:flutter/material.dart';

class StreamerItem {
  final String name;
  final String tagLine;
  final ImageProvider avatar;
  final bool isLive;
  final int? viewers;
  final VoidCallback? onTap;

  const StreamerItem({
    required this.name,
    required this.tagLine,
    required this.avatar,
    this.isLive = false,
    this.viewers,
    this.onTap,
  });
}

class FeaturedStreamerCard extends StatelessWidget {
  final StreamerItem item;
  final double width;
  final double height;
  final double radius;
  const FeaturedStreamerCard({
    super.key,
    required this.item,
    this.width = 220,
    this.height = 88,
    this.radius = 22,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: InkWell(
        onTap: item.onTap,
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.10),
                Colors.white.withOpacity(0.06),
              ],
            ),
            border: Border.all(color: Colors.white24),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: (height - 28) / 2,
                    backgroundImage: item.avatar,
                  ),
                  if (item.isLive)
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.viewers != null
                          ? '${item.tagLine} • ${item.viewers} watching'
                          : item.tagLine,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.12),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white54),
                ),
                child: const Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeaturedStreamerRow extends StatelessWidget {
  final List<StreamerItem> items;
  final double spacing;
  final EdgeInsets padding;
  final double cardWidth;
  final double cardHeight;
  const FeaturedStreamerRow({
    super.key,
    required this.items,
    this.spacing = 16,
    this.padding = const EdgeInsets.symmetric(horizontal: 0),
    this.cardWidth = 220,
    this.cardHeight = 88,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cardHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: padding,
        itemBuilder: (_, i) => FeaturedStreamerCard(
          item: items[i],
          width: cardWidth,
          height: cardHeight,
        ),
        separatorBuilder: (_, __) => SizedBox(width: spacing),
        itemCount: items.length,
      ),
    );
  }
}

