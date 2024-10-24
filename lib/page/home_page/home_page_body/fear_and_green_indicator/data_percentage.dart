import 'package:flutter/material.dart';

class DataPercentage extends StatelessWidget {
  const DataPercentage({
    super.key,
    required this.title,
    required this.textData,
    required this.percentageData,
    required this.defineColor,
  });

  final String title;
  final String textData;
  final String percentageData;
  final Color defineColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              textData,
              style: TextStyle(color: defineColor),
            ),
            Text(
              percentageData,
              style: TextStyle(color: defineColor),
            ),
          ],
        ),
      ],
    );
  }
}
