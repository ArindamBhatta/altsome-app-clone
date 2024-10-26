import 'package:flutter/material.dart';

class ChildNavigation extends StatelessWidget {
  const ChildNavigation({super.key});
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
                fontSize: 12,
              ),
            ),
          ),
          const Text(
            'ORM',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
          const Text(
            'Listings',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
          const Text(
            'Unlocks',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
