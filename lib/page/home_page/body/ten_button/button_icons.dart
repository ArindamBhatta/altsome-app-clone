import 'package:flutter/material.dart';

class ButtonIcons extends StatelessWidget {
  const ButtonIcons({
    super.key,
    required this.icon,
    required this.text,
    required this.onPress,
  });

  final IconData icon;
  final String text;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color.fromARGB(99, 255, 255, 255),
              width: 1.0,
            ),
          ),
          padding: const EdgeInsets.all(2.0),
          child: Icon(
            icon,
            color: Colors.white,
            size: 20.0,
          ),
        ),
        SizedBox(
          width: 65.0,
          child: TextButton(
            onPressed: onPress,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: const Size(40, 20),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              alignment: Alignment.center,
            ),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
