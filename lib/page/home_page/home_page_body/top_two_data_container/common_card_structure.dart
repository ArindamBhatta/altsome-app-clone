import 'package:flutter/material.dart';

class CommonCardStructure extends StatelessWidget {
  CommonCardStructure({
    super.key,
    required this.cardTextName,
    required this.totalGain,
    required this.totalPercent,
    required this.value,
  });

  final String cardTextName;
  final String totalGain;
  final String totalPercent;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 4.0,
                ),
              ),
              child: const CircleAvatar(
                radius: 16.0,
                backgroundImage: AssetImage("assets/images/bit_coin.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cardTextName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        'P&L:',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        totalGain,
                        style: TextStyle(
                          color: value < 0 ? Colors.red : Colors.green,
                          fontSize: 10,
                        ),
                      ),
                      Icon(
                        value < 0
                            ? Icons.arrow_drop_down_sharp
                            : Icons.arrow_drop_up_sharp,
                        color: value < 0 ? Colors.red : Colors.green,
                        size: 16,
                      ),
                      Text(
                        '${totalPercent} %',
                        style: TextStyle(
                          color: value < 0 ? Colors.red : Colors.green,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
