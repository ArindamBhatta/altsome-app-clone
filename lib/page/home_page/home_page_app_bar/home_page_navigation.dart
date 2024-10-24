import 'package:flutter/material.dart';

class HomePageNavigation extends StatelessWidget {
  const HomePageNavigation({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(12, 2, 12, 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.blue[800],
            ),
            child: const Text(
              'Highlights',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const Text(
            'ORM',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          const Text(
            'Listings',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          const Text(
            'Unlocks',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
