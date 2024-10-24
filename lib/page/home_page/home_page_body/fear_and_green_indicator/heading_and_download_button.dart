import 'package:flutter/material.dart';

class HeadingAndDownloadButton extends StatelessWidget {
  const HeadingAndDownloadButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          Icons.currency_bitcoin,
          color: Colors.orange,
          size: 16,
        ),
        SizedBox(width: 8),
        Text(
          'Fear & Greed Index',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        SizedBox(width: 8),
        Icon(
          Icons.info_outline,
          color: Colors.grey,
        ),
        Spacer(),
        Icon(
          Icons.download,
          color: Colors.grey,
        ),
      ],
    );
  }
}
