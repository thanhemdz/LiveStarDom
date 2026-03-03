import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:live_star_dom_mobile/screens/notifications/notifications_screen.dart';
import 'package:live_star_dom_mobile/components/search_bar.dart';
import 'package:live_star_dom_mobile/components/live_avatar.dart';
import 'package:live_star_dom_mobile/components/home_carousel.dart';
import 'package:live_star_dom_mobile/components/game_card.dart';
import 'package:live_star_dom_mobile/components/live_event_card.dart';
import 'package:live_star_dom_mobile/components/featured_streamer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _refreshKey = GlobalKey<RefreshIndicatorState>();

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 800));
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF133558),
              Color(0xFF2873BE),
            ],
          ),
        ),
        child: SafeArea(
          child: RefreshIndicator(
            key: _refreshKey,
            onRefresh: _onRefresh,
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 100),
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'LIVESTARDOM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () async {
                            _refreshKey.currentState?.show();
                            await _onRefresh();
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.06),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.white24),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.refresh_rounded,
                                size: 22,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const NotificationsScreen(),
                              ),
                            );
                          },
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.06),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.white24),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Iconsax.notification,
                                    size: 22,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 4,
                                top: 4,
                                child: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    color: Colors.redAccent,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                const Text(
                  'Live streams, real moments',
                  style: TextStyle(
                    color: Color(0xCCFFFFFF),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 12),
                const LiveSearchBar(),
                const SizedBox(height: 16),
                const Text(
                  'Live',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                LiveList(
                  items: [
                    LiveItem(
                      image: const NetworkImage(
                        'https://images.unsplash.com/photo-1527980965255-d3b416303d12?w=200',
                      ),
                      isLive: true,
                    ),
                    const LiveItem(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=200',
                      ),
                      isLive: true,
                    ),
                    const LiveItem(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1542909168-82c3e7fdca5c?w=200',
                      ),
                    ),
                    const LiveItem(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?w=200',
                      ),
                    ),
                    const LiveItem(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=200',
                      ),
                      isLive: true,
                    ),
                  ],
                  itemSize: 64,
                  spacing: 18,
                ),
                const SizedBox(height: 24),
                const Text(
                  'Popular Games',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                HomeCarousel(
                  items: const [
                    CarouselItem(image: NetworkImage('https://picsum.photos/id/1011/800/600')),
                    CarouselItem(image: NetworkImage('https://picsum.photos/id/1015/800/600')),
                    CarouselItem(image: NetworkImage('https://picsum.photos/id/1016/800/600')),
                    CarouselItem(image: NetworkImage('https://picsum.photos/id/1020/800/600')),
                  ],
                  height: 240,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Trending Now',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                GameRow(
                  items: const [
                    GameItem(
                      title: 'Valorant',
                      image: NetworkImage('https://picsum.photos/id/1039/400/300'),
                      live: true,
                      viewers: 12400,
                    ),
                    GameItem(
                      title: 'Apex Legends',
                      image: NetworkImage('https://picsum.photos/id/1041/400/300'),
                      viewers: 8200,
                    ),
                    GameItem(
                      title: 'Fortnite',
                      image: NetworkImage('https://picsum.photos/id/1043/400/300'),
                      live: true,
                      viewers: 15200,
                    ),
                    GameItem(
                      title: 'PUBG',
                      image: NetworkImage('https://picsum.photos/id/1045/400/300'),
                      viewers: 6400,
                    ),
                  ],
                  cardWidth: 140,
                  cardHeight: 180,
                ),
                const SizedBox(height: 20),
                LiveEventCard(
                  data: const LiveEventData(
                    title: 'Live game at 1h ago',
                    subtitle: 'UFC 4',
                    image: NetworkImage('https://picsum.photos/id/1050/200/200'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Featured Streamers',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                FeaturedStreamerRow(
                  items: const [
                    StreamerItem(
                      name: 'Nova',
                      tagLine: 'FPS • Rank Immortal',
                      avatar: NetworkImage('https://picsum.photos/id/1005/200/200'),
                      isLive: true,
                      viewers: 4200,
                    ),
                    StreamerItem(
                      name: 'Panda',
                      tagLine: 'Just Chatting',
                      avatar: NetworkImage('https://picsum.photos/id/1025/200/200'),
                      viewers: 2300,
                    ),
                    StreamerItem(
                      name: 'Shadow',
                      tagLine: 'RPG • Cozy stream',
                      avatar: NetworkImage('https://picsum.photos/id/1012/200/200'),
                      isLive: true,
                      viewers: 1800,
                    ),
                    StreamerItem(
                      name: 'Kira',
                      tagLine: 'Music • Covers',
                      avatar: NetworkImage('https://picsum.photos/id/1013/200/200'),
                    ),
                  ],
                  cardWidth: 220,
                  cardHeight: 88,
                ),
              ],
            ),
          ),
          ),
        ),
      ),
    );
  }
}
