import 'package:flutter/material.dart';
import '../home_page_app_bar/home_page_navigation.dart';
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
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 12.0),
                    HomePageNavigation(),
                    SizedBox(height: 12.0),
                    MCapCard(),
                    FearAndGreedIndex(),
                    BothCard(),
                    NavigationIcons(),
                  ],
                ),
              ),
              SizedBox(height: 6.0),
              SpecificationPageView(),
            ],
          ),
        ),
      ),
    );
  }
}
