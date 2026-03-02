import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NavItemModel {
  final String title;
  // final RiveModel riveModel;
  final IconData icon;

  NavItemModel({
    required this.title,
    // required this.riveModel,
    required this.icon,
  });
}

List<NavItemModel> bottomNavItems = [
  NavItemModel(title: 'Home', icon: Iconsax.home),
  NavItemModel(title: 'Discover', icon: Iconsax.discover),
  NavItemModel(title: 'Search', icon: Iconsax.search_normal),
  NavItemModel(title: 'Setting', icon: Iconsax.setting),

  // NavItemModel(
  //   title: 'Home',
  //   // riveModel: RiveModel(
  //   //   src: 'assets/icons/icon.riv',
  //   //   artboard: 'Home',
  //   //   stateMachineName: 'Home_Interactivity',
  //   // ),
  //   icon: Icons.home,

  // ),
  // NavItemModel(
  //   title: 'explore',

  //   icon: Icons.explore,

  // ),
  // NavItemModel(
  //   title: 'Search',

  //   icon: Icons.search,

  // ),
  // NavItemModel(
  //   title: 'Setting',

  //   icon: Icons.settings,

  // ),
  // NavItemModel(
  //   title: 'Discover',
  //   riveModel: RiveModel(
  //     src: 'assets/icons/icon.riv',
  //     artboard: 'Chat',
  //     stateMachineName: 'Discover_Interactivity',
  //   ),
  // ),
  // NavItemModel(
  //   title: 'Search',
  //   riveModel: RiveModel(
  //     src: 'assets/icons/icon.riv',
  //     artboard: 'Search',
  //     stateMachineName: 'Search_Interactivity',
  //   ),
  // ),
  // NavItemModel(
  //   title: 'Setting',
  //   riveModel: RiveModel(
  //     src: 'assets/icons/icon.riv',
  //     artboard: 'Setting',
  //     stateMachineName: 'Setting_Interactivity',
  //   ),
  // ),
];
