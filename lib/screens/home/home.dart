import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController = PageController();
  List banners = [
    {
      "title": "Big Sale",
      "subtitle": "Up to 50% OFF",
      "image": "assets/images/head.jpg",
      "color": Color(0xFFE53935),
    },
    {
      "title": "New Collection",
      "subtitle": "Latest Products",
      "image": "assets/images/head.jpg",
      "color": Color(0xFF1E88E5),
    },
    {
      "title": "Special Offer",
      "subtitle": "Buy 1 Get 1",
      "image": "assets/images/head.jpg",
      "color":Color(0xFF43A047),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Hi, Maaz",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Icon(Icons.notifications, color: Colors.white),
          SizedBox(width: 15),
          Icon(Icons.shopping_cart, color: Colors.white),
          SizedBox(width: 15),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF4B39EF), Color(0xFF6C63FF)],
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
///------------------ search bar -------------------------

                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search Product",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
            ),
///------------------ Banners -------------------------
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  SizedBox(
                    height: 220,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: banners.length,
                      itemBuilder: (context, index) {
                        final banner = banners[index];
                        return Container(
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: banner["color"],
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      banner["title"],
                                      style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      banner["subtitle"],
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Image.asset(
                                  banner["image"],
                                  height: 150,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                   SizedBox(height: 10),

                  SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    effect: const WormEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      activeDotColor: Color(0xFF4B39EF),
                    ),
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
