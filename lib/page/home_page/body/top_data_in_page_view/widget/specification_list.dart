import 'package:flutter/material.dart';
import 'specification_card.dart';

class SpecificationList extends StatelessWidget {
  final String cardSpecificKey;
  final List<dynamic> items;
  final Map<String, dynamic> details;

  SpecificationList({
    super.key,
    required this.cardSpecificKey,
    required this.items,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          for (int index = 0; index < items.length; index++)
            if (details[items[index].toString()]?.id != null &&
                details[items[index].toString()]?.id != 0)
              SpecificationCard(
                index: index,
                cardSpecificKey: cardSpecificKey,
                cardNumber: items[index].toString(),
                name: details[items[index].toString()]?.n ?? '',
                shortName: details[items[index].toString()]?.s ?? '',
                totalValue: details[items[index].toString()]?.l ?? '',
                currencyShort: details[items[index].toString()]?.ts ?? 0,
                conditionalValue: details[items[index].toString()]?.p1 ?? 0,
              ),
        ],
      ),
    );
  }
}
