import 'package:flutter/material.dart';

class CardStructure extends StatelessWidget {
  final String title;
  final String value;
  final String change;

  const CardStructure({
    super.key,
    required this.title,
    required this.value,
    required this.change,
  });

  @override
  Widget build(BuildContext context) {
    double changeValue = double.tryParse(change) ?? 0;

    return Expanded(
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(6.0),
          ),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 12),
              ),
              Text(
                value,
                style: const TextStyle(fontSize: 12),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    changeValue > 0
                        ? Icons.arrow_drop_up_sharp
                        : Icons.arrow_drop_down_sharp,
                    color: changeValue > 0 ? Colors.green : Colors.red,
                    size: 16.0,
                  ),
                  Text(
                    change,
                    style: TextStyle(
                      color: changeValue > 0 ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
