import 'package:flutter/material.dart';

import '../widgets/app_scaffold.dart';

class DetailScreen extends StatelessWidget {
  final String id;
  final String title;
  final String imagePath;
  final String genre;
  final String rating;
  final String totalEpisodes;
  final String description;

  const DetailScreen({
    super.key,
    this.id = '1',
    this.title = 'Black Clover',
    this.imagePath = 'assets/images/black_clover.jpg',
    this.genre = 'Action, Adventure, Fantasy',
    this.rating = '8.14',
    this.totalEpisodes = '170',
    this.description = "",
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return AppScaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: screenHeight * 0.3,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Container(
              margin: EdgeInsets.all(screenWidth * 0.02),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Background image
                  Image.asset(imagePath, fit: BoxFit.cover),
                  // Gradient overlay for better text visibility
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.3),
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.7),
                        ],
                        stops: const [0.0, 0.5, 1.0],
                      ),
                    ),
                  ),
                  // Title at the bottom of the image
                  Positioned(
                    bottom: screenHeight * 0.02,
                    left: screenWidth * 0.04,
                    right: screenWidth * 0.04,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.07,
                            fontWeight: FontWeight.w900,
                            shadows: [
                              Shadow(
                                offset: const Offset(0, 2),
                                blurRadius: 4,
                                color: Colors.black.withValues(alpha: 0.7),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        Text(
                          genre,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.9),
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.w500,
                            shadows: [
                              Shadow(
                                offset: const Offset(0, 1),
                                blurRadius: 2,
                                color: Colors.black.withValues(alpha: 0.7),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Rating and Episodes info
                  Row(
                    children: [
                      // Rating
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.03,
                          vertical: screenHeight * 0.01,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.3),
                              blurRadius: screenWidth * 0.02,
                              offset: Offset(0, screenHeight * 0.005),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(
                            screenWidth * 0.02,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: screenWidth * 0.04,
                            ),
                            SizedBox(width: screenWidth * 0.01),
                            Text(
                              rating,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.035,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.05),
                      // Total Episodes
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.03,
                          vertical: screenHeight * 0.01,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0b395e),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.3),
                              blurRadius: screenWidth * 0.02,
                              offset: Offset(0, screenHeight * 0.005),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(
                            screenWidth * 0.02,
                          ),
                        ),
                        child: Text(
                          '$totalEpisodes Episodes',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.035,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.05),
                      // Add to Favorites
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.03,
                          vertical: screenHeight * 0.01,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.3),
                              blurRadius: screenWidth * 0.02,
                              offset: Offset(0, screenHeight * 0.005),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(
                            screenWidth * 0.02,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: screenWidth * 0.04,
                            ),
                            SizedBox(width: screenWidth * 0.01),
                            Text(
                              'Add to Favorites',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.035,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  // Description
                  Text(
                    'Synopsis',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Text(
                    'Anime BLACK CLOVER ini mengikuti kisah Asta, seorang bocah laki-laki yang lahir tanpa memiliki kemampuan sihir di dunia di mana sihir adalah segalanya. Meskipun begitu, Asta bermimpi untuk menjadi Raja Sihir di Kerajaan Clover. Bersama rival dan sahabatnya, Yuno, yang sangat berbakat dalam sihir, Asta memulai perjalanan untuk membuktikan bahwa kerja keras dan tekad dapat mengatasi bakat alami.Cerita anime BLACK CLOVER ini berlatar di dunia grimoire sihir memilih pemiliknya, memberikan mereka mantra dan kemampuan unik. Yuno mendapatkan grimoire tiga daun yang langka, melambangkan potensi sihirnya yang luar biasa, sementara Asta tampaknya ditinggalkan tanpa grimoire sama sekali. Namun, dalam kejutan yang mengejutkan, ia akhirnya menerima grimoire berdaun lima. Tetapi sayang, grimoire berdaun lima ini dianggap sebagai tanda sihir gelap dan jahat, yang memungkinkannya menggunakan anti-magic, kekuatan yang dapat meniadakan dan memantulkan segala bentuk sihir. Sehingga membuatnya menjadi objek ejekan dari orang-orang di sekitarnya. Namun, Asta bukanlah tipe yang mudah menyerah dan bertekad untuk mengatasi kekurangan dan membuktikan dirinya layak.',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: screenWidth * 0.038,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
