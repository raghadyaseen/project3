import 'package:flutter/material.dart';
import '../authentication/login.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> onboardingPages = [
    {
      "title": "مرحباً بك في تطبيقنا",
      "description":
          " نحن هنا لتقديم أفضل تجربة لتحويل لغة اﻹشارة إلى نص باستخدام أحدث التقنيات",
      "image": "assets/images/onbo.png",
    },
    {
      "title": "دقة وسرعة",
      "description":
          "نقدم لك تقنيتنا دقة متناهية وسرعة فائقة لتحويل إشاراتك إلى نصوص دقيقة",
      "image": "assets/images/onboard2.png",
    },
    {
      "title": "تجربة فريدة",
      "description":
          "استمتع بتجربة مريحة وسهلة مع واجهة المستخدم البسيطة والمباشرة",
      "image": "assets/images/onboard3.png",
    },
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // إضافة الألوان الجديدة
    final Color primaryColor = const Color.fromARGB(255, 121, 177, 90);
    final Color backgroundColor = const Color.fromRGBO(240, 248, 255, 1);
    final Color buttonColor = const Color.fromARGB(255, 121, 177, 90);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingPages.length,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, index) {
                return OnboardingPage(
                  title: onboardingPages[index]['title'],
                  description: onboardingPages[index]['description'],
                  image: onboardingPages[index]['image'],
                  primaryColor: primaryColor,
                );
              },
            ),
          ),
          PageIndicator(
            itemCount: onboardingPages.length,
            currentIndex: _currentPage,
            primaryColor: primaryColor,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentPage == onboardingPages.length - 1) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 121, 177, 90),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      _currentPage == onboardingPages.length - 1
                          ? "Get Started"
                          : "Next",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final Color primaryColor;

  const OnboardingPage({
    required this.title,
    required this.description,
    required this.image,
    required this.primaryColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height * 0.4,
              width: width * 0.8,
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 25),
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  final int itemCount;
  final int currentIndex;
  final Color primaryColor;

  const PageIndicator({
    required this.itemCount,
    required this.currentIndex,
    required this.primaryColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          itemCount,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 5),
            height: 10,
            width: currentIndex == index ? 20 : 10,
            decoration: BoxDecoration(
              color: currentIndex == index ? primaryColor : Colors.grey,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}
