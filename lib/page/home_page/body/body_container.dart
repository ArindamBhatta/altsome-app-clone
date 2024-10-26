import 'package:flutter/material.dart';
import '../app_bar/child_navigation.dart';
import 'top_data_in_page_view/widget/specification_page_view.dart';
import 'ten_button/navigation_icons.dart';
import 'fear_and_green_indicator/fear_and_greed_controller.dart';
import 'top_two_data_container/both_card.dart';
import 'four_card_with_graph/all_four_card.dart';

class BodyContainer extends StatefulWidget {
  const BodyContainer({super.key});

  @override
  State<BodyContainer> createState() {
    return _BodyContainerState();
  }
}

class _BodyContainerState extends State<BodyContainer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 248, 245, 245),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  const SizedBox(height: 12.0),
                  const ChildNavigation(),
                  const SizedBox(height: 12.0),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      MCapCard(),
                      FearAndGreedIndex(),
                      BothCard(),
                      NavigationIcons(),
                      const SizedBox(height: 6.0),
                      SpecificationPageView(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
