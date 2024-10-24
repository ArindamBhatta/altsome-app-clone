import 'package:flutter/material.dart';

class StaticHeading extends StatelessWidget {
  const StaticHeading({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 72), //80 -8 = 72
          const Text(
            'Name',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 10,
            ),
          ),
          Spacer(),
          Text(
            'Price',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 10,
            ),
          ),
          SizedBox(width: 43),
        ],
      ),
    );
  }
}
