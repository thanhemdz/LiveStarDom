import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF133558), Color(0xFF2873BE)],
          ),
        ),
        child: const SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(24, 8, 24, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Search',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
