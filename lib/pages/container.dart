import 'dart:async';
import 'package:demo1/main.dart';
import 'package:demo1/pages/Login.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo1/pages/Mainpage.dart';


class TravelSlider extends StatefulWidget {
  @override
  _TravelSliderState createState() => _TravelSliderState();
}

class _TravelSliderState extends State<TravelSlider> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 10), (Timer timer) {
      if (_currentPage < 1) { // Adjusted for the number of pages
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          SliderPage(
            imagePath: 'images/img1.png',
            title: 'Find Your Perfect Stay',
            description: 'Looking for the perfect place to stay? Let us help you find the ideal accommodation for your next trip.',
          ),
          SliderPage(
            imagePath: 'images/img3.png',
            title: 'Discover Your Perfect Stay',
            description: 'Discover comfort, convenience, and unforgettable experiences with just a few clicks! Book your ideal stay with us today.',
          ),
        ],
      ),
    );
  }
}

class SliderPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final bool isLastPage;

  SliderPage({
    required this.imagePath,
    required this.title,
    required this.description,
    this.isLastPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        Expanded(
          flex: 2,
          child: Stack(
            children: [
              CustomPaint(
                painter: WavePainter(),
                child: Container(
                  height: 600,
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'DancingScript',

                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginScreen()),
                            );
                          },
                          child: Text('Login to your Account'),
                        ),


                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(0xFF41436A)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.lineTo(0, 0);
    path.quadraticBezierTo(size.width / 3, 70, size.width / 2, 0);
    path.quadraticBezierTo(2 / 3 * size.width, -70, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


