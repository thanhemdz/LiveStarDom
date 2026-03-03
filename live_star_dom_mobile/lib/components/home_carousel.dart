import 'dart:math';
import 'package:flutter/material.dart';

class CarouselItem {
  final ImageProvider image;
  final VoidCallback? onPlay;
  const CarouselItem({required this.image, this.onPlay});
}

class HomeCarousel extends StatefulWidget {
  final List<CarouselItem> items;
  final double height;
  final double borderRadius;
  final EdgeInsets padding;
  final bool loop;
  const HomeCarousel({
    super.key,
    required this.items,
    this.height = 220,
    this.borderRadius = 28,
    this.padding = const EdgeInsets.symmetric(horizontal: 0),
    this.loop = true,
  });

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  late final PageController _controller;
  double _page = 0.0;

  @override
  void initState() {
    super.initState();
    final initial = widget.loop ? 1000 * widget.items.length : 0;
    _controller = PageController(
      viewportFraction: 0.78,
      initialPage: initial,
    );
    _page = initial.toDouble();
    _controller.addListener(() {
      setState(() {
        _page = _controller.page ?? 0.0;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: widget.height,
          child: Padding(
            padding: widget.padding,
            child: PageView.builder(
              controller: _controller,
              padEnds: true,
              itemBuilder: (context, index) {
                final actualIndex =
                    widget.loop ? index % widget.items.length : index;
                final delta = (_page - index).abs();
                final scale = 1 - min(delta, 1) * 0.08;
                return Transform.scale(
                  scale: scale,
                  child: _CarouselCard(
                    item: widget.items[actualIndex],
                    borderRadius: widget.borderRadius,
                  ),
                );
              },
              itemCount: widget.loop ? null : widget.items.length,
            ),
          ),
        ),
        const SizedBox(height: 12),
        _Dots(
          controller: _controller,
          count: widget.items.length,
          loop: widget.loop,
        ),
      ],
    );
  }
}

class _CarouselCard extends StatelessWidget {
  final CarouselItem item;
  final double borderRadius;
  const _CarouselCard({required this.item, required this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image(image: item.image, fit: BoxFit.cover),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: GestureDetector(
                  onTap: item.onPlay,
                  child: Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.85),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.black.withOpacity(0.8),
                      size: 28,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Dots extends StatefulWidget {
  final PageController controller;
  final int count;
  final bool loop;
  const _Dots({required this.controller, required this.count, this.loop = true});

  @override
  State<_Dots> createState() => _DotsState();
}

class _DotsState extends State<_Dots> {
  double _page = 0.0;

  @override
  void initState() {
    super.initState();
    _page = widget.controller.initialPage.toDouble();
    widget.controller.addListener(_listener);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_listener);
    super.dispose();
  }

  void _listener() {
    setState(() {
      _page = widget.controller.page ?? 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(widget.count, (i) {
          final current = widget.loop
              ? (_page.round() % widget.count)
              : _page.round().clamp(0, widget.count - 1);
          final active = current == i;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: active ? 18 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: active ? Colors.white : Colors.white24,
              borderRadius: BorderRadius.circular(8),
            ),
          );
        }),
      ),
    );
  }
}
