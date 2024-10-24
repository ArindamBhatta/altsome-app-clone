import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final String containerText;
  final int index;
  final VoidCallback onButtonPressed;
  final bool flag;

  const NavigationButton({
    super.key,
    required this.flag,
    required this.index,
    required this.containerText,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onButtonPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        backgroundColor: flag ? Colors.blue[800] : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Text(
        containerText,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 10,
          color: flag ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
