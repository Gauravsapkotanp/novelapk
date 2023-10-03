// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, camel_case_types, must_be_immutable, use_key_in_widget_constructors, duplicate_ignore, prefer_typing_uninitialized_variables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Carousel_Slider extends StatefulWidget {
  const Carousel_Slider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<Carousel_Slider> createState() => _Carousel_SliderState();
}

// ignore: camel_case_types
class _Carousel_SliderState extends State<Carousel_Slider> {
  int currentIndex = 0;
  int itemCount = 5;

  List<String> images = [
    "https://assets-prd.ignimgs.com/2022/08/17/top25animecharacters-blogroll-1660777571580.jpg",
    "https://static1.colliderimages.com/wordpress/wp-content/uploads/2023/06/luffy-from-one-piece-goku-from-dragon-ball-z-and-saitama-from-one-punch-man.jpg",
    "https://cdn.animenewsnetwork.com/thumbnails/crop900x350g2O/cms/convention/199754/ragna-crimson-key-visual-2000x3000.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290,
      width: widget.size.width,
      child: Column(
        children: [
          CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (context, index, pageIndex) {
                return SizedBox(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(images[index]),
                              fit: BoxFit.cover),
                          color: Colors.blue,
                        ),
                      ),
                      Positioned(
                        top: 118,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 100,
                          width: 310,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 2,
                                    blurRadius: 3),
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "War Time",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                "Last Updated At",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                    color: Colors.green),
                              ),
                              Container(
                                height: 38,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icons_and_texts(
                                      icon: Icons.star,
                                      name: "4.5",
                                      color: Colors.blue,
                                    ),
                                    Icons_and_texts(
                                      icon: Icons.chat,
                                      name: "12 Comments",
                                      color: Colors.orange,
                                    ),
                                    Icons_and_texts(
                                      icon: Icons.favorite,
                                      name: "23",
                                      color: Colors.red,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  currentIndex = index;
                  setState(() {});
                },
                height: 220,
                aspectRatio: 16 / 8,
                viewportFraction: 0.8,
                enlargeCenterPage: true,
                autoPlay: true,
              )),
          const SizedBox(
            height: 20,
          ),
          DotsIndicator(
            position: currentIndex.toInt(),
            dotsCount: images.length,
            decorator: const DotsDecorator(
              activeColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

class Icons_and_texts extends StatelessWidget {
  IconData icon;
  String name;
  var color;
  Icons_and_texts({
    required this.icon,
    required this.name,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        Text(
          name,
        )
      ],
    );
  }
}
