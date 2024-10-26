import 'package:flutter/material.dart';
import 'common_card_structure.dart';

class BothCard extends StatelessWidget {
  const BothCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: CommonCardStructure(
            cardTextName: "MicroStrategy Inc",
            totalGain: "4.89B",
            totalPercent: "58.51",
            value: 0,
          ),
        ),
        Expanded(
          child: CommonCardStructure(
            cardTextName: "El Salvador",
            totalGain: "46.8M",
            totalPercent: "37.20",
            value: -1,
          ),
        ),
      ],
    );
  }
}
