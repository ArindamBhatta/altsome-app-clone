import 'package:flutter/material.dart';
import 'package:altsome_app/page/crud_operation/expense_tracker_main_page.dart';
import '../home_page/home_page_body/body_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
                      backgroundImage:
                          AssetImage("assets/images/avatar_logo.png"),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'ALTSOME',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExpenseTrackerMainPage(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.donut_small_rounded,
                    ),
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                    ),
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.logout,
                    ),
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(12, 2, 12, 2),
                child: const Text(
                  'Market',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Text(
                'NFTs',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                'News',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                'Jobs',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const BodyContainer(),
      ],
    );
  }
}
