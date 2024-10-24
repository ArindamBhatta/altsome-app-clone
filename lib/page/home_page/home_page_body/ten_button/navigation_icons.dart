import 'package:altsome_app/page/home_page/home_page_body/top_data_in_page_view/Provider/specification_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'sectors_page/widgets/sectors_page.dart';
import 'button_icons.dart';

class NavigationIcons extends StatefulWidget {
  const NavigationIcons({super.key});
  @override
  State<NavigationIcons> createState() => _NavigationButtonState();
}

class _NavigationButtonState extends State<NavigationIcons> {
  String? activeScreen;

  void changePage() {
    if (activeScreen == 'Sectors') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SectorsPage()),
      ).then(
        (value) {
          print("reset the specification provider");
          Provider.of<SpecificationProvider>(context, listen: false).reset();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[800],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonIcons(
                  icon: Icons.dashboard,
                  text: 'Sectors',
                  onPress: () {
                    setState(() {
                      activeScreen = 'Sectors';
                    });
                    changePage();
                  },
                ),
                ButtonIcons(
                  icon: Icons.language,
                  text: 'Eco system',
                  onPress: () {},
                ),
                ButtonIcons(
                  icon: Icons.group,
                  text: 'Investors',
                  onPress: () {},
                ),
                ButtonIcons(
                  icon: Icons.rocket_launch_sharp,
                  text: 'Launchpads',
                  onPress: () {},
                ),
                ButtonIcons(
                  icon: Icons.verified_user_sharp,
                  text: 'Team',
                  onPress: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonIcons(
                  icon: Icons.folder_shared,
                  text: 'Glossary',
                  onPress: () {},
                ),
                ButtonIcons(
                  icon: Icons.layers,
                  text: 'Reserves',
                  onPress: () {},
                ),
                ButtonIcons(
                  icon: Icons.toggle_off_rounded,
                  text: 'M.cap of',
                  onPress: () {},
                ),
                ButtonIcons(
                  icon: Icons.lan_rounded,
                  text: 'Converter',
                  onPress: () {},
                ),
                ButtonIcons(
                  icon: Icons.luggage,
                  text: 'Drops',
                  onPress: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
