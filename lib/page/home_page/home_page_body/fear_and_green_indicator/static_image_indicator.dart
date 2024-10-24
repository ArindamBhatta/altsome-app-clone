import 'package:flutter/material.dart';

class StaticImageIndicator extends StatelessWidget {
  const StaticImageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: SizedBox(
          width: 150.0,
          height: 150.0,
          child: Image.asset('assets/images/indicator_image.png'),
        ),
      ),
    );
  }
}
