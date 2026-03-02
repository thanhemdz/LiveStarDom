import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:live_star_dom_mobile/screens/notifications/notifications_screen.dart';
import 'package:live_star_dom_mobile/components/search_bar.dart';
import 'package:live_star_dom_mobile/components/live_avatar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
