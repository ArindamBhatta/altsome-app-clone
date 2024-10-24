import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

class FoodOrder extends StatelessWidget {
  FoodOrder({super.key});

  final List<String> meals = [
    'Ice Cream',
    'Rice',
    'Fish',
    'Chicken',
    'Pizza',
    'Pasta',
    'Burger',
    'Salad',
    'Noodles',
    'Cake',
  ];

  final List<String> mealImages = [
    "https://images.pexels.com/photos/1294943/pexels-photo-1294943.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/11789292/pexels-photo-11789292.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/229789/pexels-photo-229789.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/1769279/pexels-photo-1769279.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/825661/pexels-photo-825661.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/1437267/pexels-photo-1437267.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/327158/pexels-photo-327158.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/406152/pexels-photo-406152.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/2098135/pexels-photo-2098135.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/1291712/pexels-photo-1291712.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  ];

  final ordersUrls = [
    "https://minus30.co/products/strawberry-vegan-sf?gad_source=1&gclid=Cj0KCQjwmt24BhDPARIsAJFYKk0q4GpukOtpbuLIn0SVcv24pu-WbzIhI3C3HQXBbVeDFd9GoZuNaYcaAnLUEALw_wcB",
    "https://minus30.co/products/strawberry-vegan-sf?gad_source=1&gclid=Cj0KCQjwmt24BhDPARIsAJFYKk0q4GpukOtpbuLIn0SVcv24pu-WbzIhI3C3HQXBbVeDFd9GoZuNaYcaAnLUEALw_wcB",
    "https://minus30.co/products/strawberry-vegan-sf?gad_source=1&gclid=Cj0KCQjwmt24BhDPARIsAJFYKk0q4GpukOtpbuLIn0SVcv24pu-WbzIhI3C3HQXBbVeDFd9GoZuNaYcaAnLUEALw_wcB",
    "https://minus30.co/products/strawberry-vegan-sf?gad_source=1&gclid=Cj0KCQjwmt24BhDPARIsAJFYKk0q4GpukOtpbuLIn0SVcv24pu-WbzIhI3C3HQXBbVeDFd9GoZuNaYcaAnLUEALw_wcB",
    "https://minus30.co/products/strawberry-vegan-sf?gad_source=1&gclid=Cj0KCQjwmt24BhDPARIsAJFYKk0q4GpukOtpbuLIn0SVcv24pu-WbzIhI3C3HQXBbVeDFd9GoZuNaYcaAnLUEALw_wcB",
    "https://minus30.co/products/strawberry-vegan-sf?gad_source=1&gclid=Cj0KCQjwmt24BhDPARIsAJFYKk0q4GpukOtpbuLIn0SVcv24pu-WbzIhI3C3HQXBbVeDFd9GoZuNaYcaAnLUEALw_wcB",
    "https://minus30.co/products/strawberry-vegan-sf?gad_source=1&gclid=Cj0KCQjwmt24BhDPARIsAJFYKk0q4GpukOtpbuLIn0SVcv24pu-WbzIhI3C3HQXBbVeDFd9GoZuNaYcaAnLUEALw_wcB",
    "https://minus30.co/products/strawberry-vegan-sf?gad_source=1&gclid=Cj0KCQjwmt24BhDPARIsAJFYKk0q4GpukOtpbuLIn0SVcv24pu-WbzIhI3C3HQXBbVeDFd9GoZuNaYcaAnLUEALw_wcB",
    "https://minus30.co/products/strawberry-vegan-sf?gad_source=1&gclid=Cj0KCQjwmt24BhDPARIsAJFYKk0q4GpukOtpbuLIn0SVcv24pu-WbzIhI3C3HQXBbVeDFd9GoZuNaYcaAnLUEALw_wcB",
    "https://minus30.co/products/strawberry-vegan-sf?gad_source=1&gclid=Cj0KCQjwmt24BhDPARIsAJFYKk0q4GpukOtpbuLIn0SVcv24pu-WbzIhI3C3HQXBbVeDFd9GoZuNaYcaAnLUEALw_wcB",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (
          BuildContext context,
          bool innerBoxIsScrolled,
        ) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: const Text(
                  "Expanded App bar",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                background: Image.asset(
                  "assets/images/header.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            scrollBehavior: const ScrollBehavior(),
            slivers: [
              //* Grid
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Stack(
                      children: [
                        CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: mealImages[index],
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.transparent,
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                                colorFilter: const ColorFilter.mode(
                                  Color.fromARGB(255, 254, 189, 184),
                                  BlendMode.colorBurn,
                                ),
                              ),
                            ),
                          ),
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(
                            strokeWidth: 2.0,
                            color: Colors.black,
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        Positioned(
                          bottom: 6,
                          right: 10,
                          left: 10,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(120, 0, 0, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            onPressed: () async {
                              await launchUrl(Uri.parse(ordersUrls[index]));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  meals[index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                                const Icon(
                                  Icons.open_in_new,
                                  size: 16.0,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  childCount: meals.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  childAspectRatio: 0.75,
                ),
              ),

              //* List
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return ListTile(
                      title: Text('List Item ${index + 1}'),
                    );
                  },
                  childCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
