import 'package:altsome_app/page/home_page/app_bar/parent_navigation.dart';
import 'package:flutter/material.dart';
import 'body/body_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ParentNavigation(),
        const SizedBox(height: 16),
        const BodyContainer(),
      ],
    );
  }
}
