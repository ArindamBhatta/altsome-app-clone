import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'sector_card_extended.dart';
import '../provider/provider.dart';

class SectorCard extends StatelessWidget {
  SectorCard({
    required this.index,
    required this.containerName,
    required this.avgChange,
    required this.avgChangePositive,
    required this.marketCap,
    required this.volume,
    required this.gainers,
    required this.topGainer,
    required this.gainerPercentage,
    required this.looser,
    required this.loserPercentage,
    required this.dominance,
    super.key,
  }) {
    print("SectorCard constructor called $index");
  }

  final int index;
  final String containerName;
  final String avgChange;
  final bool avgChangePositive;
  final String marketCap;
  final String volume;
  final String gainers;
  final String topGainer;
  final String gainerPercentage;
  final String looser;
  final String loserPercentage;
  final String dominance;

  @override
  Widget build(BuildContext context) {
    print("called before watch $index");
    final int? unfoldedCardIndex =
        context.select((ToggleProvider provider) => provider.unfoldedCardIndex);
    bool unfold = index == unfoldedCardIndex;
    print("print bool value $unfoldedCardIndex $index ${unfold.toString()}");

    return Card(
      elevation: 1.5,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: const BorderSide(
          color: Color.fromARGB(255, 13, 13, 13),
          width: 0.5,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.sports_soccer_rounded,
                        size: 34.0,
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Text(
                          containerName,
                          softWrap: false,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10.0),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              avgChangePositive
                                  ? Icons.arrow_upward
                                  : Icons.arrow_downward,
                              color:
                                  avgChangePositive ? Colors.green : Colors.red,
                              size: 16.0,
                            ),
                            const SizedBox(width: 2.0),
                            Text(
                              avgChange,
                              style: TextStyle(
                                color: avgChangePositive
                                    ? Colors.green
                                    : Colors.red,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'Avg. % Chg',
                          style: TextStyle(fontSize: 12.0, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8.0),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: unfold ? Colors.blue[800] : Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: unfold ? 1.0 : 0.5,
                        ),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                        ),
                        onPressed: () {
                          context
                              .read<ToggleProvider>()
                              .toggleVisibility(index);
                        },
                        child: Center(
                          child: Text(
                            unfold ? '-' : '+',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: unfold ? Colors.white : Colors.black,
                              fontWeight:
                                  unfold ? FontWeight.normal : FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 4.0),
          if (unfold)
            Column(
              children: [
                const SizedBox(
                  width: double.infinity,
                  child: Divider(
                    color: Color.fromARGB(150, 158, 158, 158),
                    thickness: 2.0,
                  ),
                ),
                SectorCardExtended(
                  marketCap: marketCap,
                  volume: volume,
                  gainers: gainers,
                  topGainer: topGainer,
                  gainerPercentage: gainerPercentage,
                  looser: looser,
                  loserPercentage: loserPercentage,
                  dominance: dominance,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
