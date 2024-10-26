import 'package:flutter/material.dart';

class PageBar extends StatelessWidget {
  const PageBar({super.key});

  Widget sectorsLogoWidget() {
    return ClipOval(
      child: Image.asset(
        'assets/images/sectors_logo.png',
        width: 30,
        height: 30,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        sectorsLogoWidget(),
        const SizedBox(width: 16.0),
        const Text(
          "Sectors",
          style: TextStyle(
            fontSize: 26.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
        ),
      ],
    );
  }
}
