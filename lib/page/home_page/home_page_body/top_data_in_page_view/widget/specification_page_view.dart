import 'package:flutter/material.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:provider/provider.dart';
import '../Provider/specification_provider.dart';
import 'dart:async';
import '../../../../../model/model_two.dart';
import '../../../../../repo/repo.dart';
import '../utils/navigation_button.dart';
import 'static_heading.dart';
import 'specification_list.dart';

class SpecificationPageView extends StatefulWidget {
  const SpecificationPageView({super.key});

  @override
  State<SpecificationPageView> createState() {
    return _SpecificationPageViewState();
  }
}

class _SpecificationPageViewState extends State<SpecificationPageView> {
  int? visibleBackground = 0;
  late Future<ModelTwo?> _dataFuture;

  PageController ctrl = PageController();

  Future<ModelTwo?> accessSecondApi() async {
    try {
      ModelTwo? resolvedData = await Repo.accessSecondApi();
      return resolvedData;
    } catch (error) {
      print("Error occurred: $error");
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _dataFuture = accessSecondApi();
  }

  void changeTapOrSwipe(int index) {
    setState(() {
      visibleBackground = (visibleBackground == index) ? null : index;
    });
  }

  List<String> navigationButtons = [
    'Top 10',
    'Gainers',
    'Losers',
    'Trending',
    'News'
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SpecificationProvider(),
        ),
      ],
      child: FutureBuilder<ModelTwo?>(
        future: _dataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final data = snapshot.data!; //* data and details both use in api
            print(data.data?.tt);
            final details = data.data?.details;
            return Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(155, 0, 0, 0),
                    spreadRadius: 4,
                    blurRadius: 3,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int index = 0;
                            index < navigationButtons.length;
                            index++)
                          NavigationButton(
                            index: index,
                            containerText: navigationButtons[index],
                            onButtonPressed: () {
                              ctrl.animateToPage(
                                index,
                                duration: const Duration(
                                  milliseconds: 100,
                                ),
                                curve: Curves.ease,
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                  //* Static Heading
                  const StaticHeading(),
                  //* PageView
                  ExpandablePageView(
                    onPageChanged: (scrollIndex) {
                      changeTapOrSwipe(scrollIndex);
                    },
                    controller: ctrl,
                    children: [
                      SpecificationList(
                        items: data.data?.tt,
                        details: details,
                      ),
                      SpecificationList(
                        items: data.data?.tg,
                        details: details,
                      ),
                      SpecificationList(
                        items: data.data?.tr,
                        details: details,
                      ),
                      SpecificationList(
                        items: data.data?.tl,
                        details: details,
                      ),
                      SpecificationList(
                        items: data.data?.rt,
                        details: details,
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text(
                'No data available',
              ),
            );
          }
        },
      ),
    );
  }
}


/* 
context.read<ProviderClass>().method(argument);
context.watch<ProviderClass>().method(argument);
assign = context.select((Class   instance) => instance.property);
*/