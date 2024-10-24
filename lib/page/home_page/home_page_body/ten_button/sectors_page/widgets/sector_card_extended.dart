import 'package:flutter/material.dart';

class SectorCardExtended extends StatelessWidget {
  const SectorCardExtended({
    super.key,
    required this.marketCap,
    required this.volume,
    required this.gainers,
    required this.topGainer,
    required this.gainerPercentage,
    required this.looser,
    required this.loserPercentage,
    required this.dominance,
  });

  final String marketCap;
  final String volume;
  final String gainers;
  final String topGainer;
  final String gainerPercentage;
  final String loserPercentage;
  final String looser;
  final String dominance;

  TextStyle labelStyle() {
    return const TextStyle(
      fontSize: 14.0,
      color: Color.fromARGB(255, 57, 55, 55),
    );
  }

  TextStyle valueStyle() {
    return const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    );
  }

  Widget textHeading() {
    return Container(
      width: 8.0,
      height: 36,
      decoration: BoxDecoration(
        color: const Color.fromARGB(126, 145, 143, 143),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.values[3],
        children: [
          // First Column
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1st Column 1st row
                Row(
                  children: [
                    textHeading(),
                    const SizedBox(width: 8.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('M.Cap', style: labelStyle()),
                        Text(marketCap, style: valueStyle()),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                // 1st Column 2nd row
                Row(
                  children: [
                    textHeading(),
                    const SizedBox(width: 8.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Dominance', style: labelStyle()),
                        Text(dominance, style: valueStyle()),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                // 1st Column 3rd row
                Row(
                  children: [
                    textHeading(),
                    const SizedBox(width: 8.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Gainers', style: labelStyle()),
                        Row(
                          children: [
                            Text(gainers),
                            Text(' ▲ $gainerPercentage',
                                style: const TextStyle(
                                  color: Colors.green,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Middle Column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 2nd Column 1st row
              Row(
                children: [
                  textHeading(),
                  const SizedBox(width: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Volume', style: labelStyle()),
                      Text(volume, style: valueStyle()),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              // 2nd Column 2nd row
              Row(
                children: [
                  textHeading(),
                  const SizedBox(width: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Top Gainers', style: labelStyle()),
                      Row(
                        children: [
                          Text(topGainer, style: valueStyle()),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              // 2nd Column 3rd row
              Row(
                children: [
                  textHeading(),
                  const SizedBox(width: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Loser %', style: labelStyle()),
                      Row(
                        children: [
                          Text(looser),
                          Text('  ▼  $loserPercentage',
                              style: const TextStyle(
                                color: Color.fromARGB(255, 237, 5, 5),
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          // 3rd column
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 90.0,
                color: Colors.white,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.download),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
