// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:novelapk/presentation/slider_part.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Top_App_Bar(size: size),
                const SizedBox(
                  height: 10,
                ),
                const Text_field(),
                Carousel_Slider(size: size),
                itemsTopic(
                  size: size,
                  name: "Popular Items",
                ),
                popularItems(),
                SizedBox(
                  height: 10,
                ),
                itemsTopic(
                  size: size,
                  name: "Recent Releases",
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        height: 150,
                        width: size.width,
                        child: Row(
                          children: [
                            Container(
                              height: 140,
                              width: MediaQuery.of(context).size.width * 0.35,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.red,
                                ),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      "https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2022/05/31/266829751.jpg",
                                    ),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            Container(
                              height: 120,
                              width: MediaQuery.of(context).size.width * 0.60,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: Offset(2, -2))
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class popularItems extends StatelessWidget {
  const popularItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            height: 190,
            width: 170,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(2, -2))
              ],
            ),
            child: Column(
              children: [
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://assets-prd.ignimgs.com/2022/08/17/top25animecharacters-blogroll-1660777571580.jpg"),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "War Time",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class itemsTopic extends StatelessWidget {
  final Size size;
  String name;
  itemsTopic({super.key, required this.size, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      height: 30,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          Text(
            "See All",
            style: TextStyle(
                fontSize: 13, fontWeight: FontWeight.w500, color: Colors.green),
          ),
        ],
      ),
    );
  }
}

class Text_field extends StatelessWidget {
  const Text_field({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            size: 35,
            color: Colors.black87,
          ),
          hintText: "Search You're looking for",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

class Top_App_Bar extends StatelessWidget {
  const Top_App_Bar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 50,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            color: Colors.green,
            size: 25,
          ),
          const Text(
            "Homepage",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_downward,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
