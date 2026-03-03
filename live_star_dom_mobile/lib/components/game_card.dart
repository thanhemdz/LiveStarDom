import 'package:flutter/material.dart';

class GameItem {
  final String title;
  final ImageProvider image;
  final bool live;
  final int? viewers;

  const GameItem({
    required this.title,
    required this.image,
    this.live = false,
    this.viewers,
  });
}

class GameCard extends StatelessWidget {
  final GameItem item;
  final double width;
  final double height;
  final double radius;
  const GameCard({
    super.key,
    required this.item,
    this.width = 140,
    this.height = 180,
    this.radius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned.fill(
                    child: Image(image: item.image, fit: BoxFit.cover),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.0),
                            Colors.black.withOpacity(0.55),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (item.live)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.redAccent.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Text(
                              'LIVE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.8,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (item.viewers != null) ...[
            const SizedBox(height: 2),
            Text(
              '${item.viewers} watching',
              style: TextStyle(
                color: Colors.white.withOpacity(0.75),
                fontSize: 12,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class GameRow extends StatelessWidget {
  final List<GameItem> items;
  final double spacing;
  final EdgeInsets padding;
  final double cardWidth;
  final double cardHeight;
  const GameRow({
    super.key,
    required this.items,
    this.spacing = 16,
    this.padding = const EdgeInsets.symmetric(horizontal: 0),
    this.cardWidth = 140,
    this.cardHeight = 180,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cardHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: padding,
        itemBuilder: (_, i) => GameCard(
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
