import 'package:demo1/pages/container.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'hotel_details_page.dart';
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<String> carouselImages = [
    'images/img6.jpg',
    'images/img7.jpeg',
    'images/img10.jpg',
  ];

  final List<Map<String, dynamic>> recommendedItems = [
    {
      'image': 'images/h1.jpg',
      'title': 'The Leela Kovalam, a Raviz Hotel',
      'rating': 4.5,
      'location': 'Kovalam, Kerala',
      'price': 200.0,
      'description': 'This luxury beachfront resort near Lighthouse Beach offers daily housekeeping, a private beach, three restaurants, two bars, a full-service spa, three outdoor pools, and a free children’s club. Enjoy a health club, beach umbrellas, sun loungers, towels, a children’s pool, and a pool bar for a relaxing stay.'
    },
    {
      'image': 'images/h2.png',
      'title': 'Grand Hyatt Kochi Bolgatty',
      'rating': 5.0,
      'location': 'Kochi, Kerala',
      'price': 300.0,
      'description': 'The Grand Hyatt Kochi Bolgatty offers luxury with its private beach, multiple dining options, full-service spa, and outdoor pools. Enjoy modern amenities and a comfortable stay in a scenic location.'
    },
    {
      'image': 'images/h3.jpg',
      'title': 'Taj Malabar Resort & Spa',
      'rating': 4.8,
      'location': 'Kochi, Kerala',
      'price': 250.0,
      'description': 'Set on a private peninsula, the Taj Malabar Resort & Spa features breathtaking views of the backwaters. Enjoy elegant rooms, a full-service spa, outdoor pool, and multiple dining options.'
    },
    {
      'image': 'images/h4.jpg',
      'title': 'Kumarakom Lake Resort',
      'rating': 4.7,
      'location': 'Kumarakom, Kerala',
      'price': 270.0,
      'description': 'Kumarakom Lake Resort offers traditional Kerala architecture, scenic backwater views, and luxurious villas with private pools. Enjoy a spa, multiple dining options, and cultural experiences.'
    },
    {
      'image': 'images/h5.jpg',
      'title': 'VIVANTA by Taj - Bekal',
      'rating': 4.6,
      'location': 'Bekal, Kerala',
      'price': 230.0,
      'description': 'VIVANTA by Taj - Bekal features contemporary luxury with traditional touches. Enjoy spacious villas, a full-service spa, outdoor pools, and a variety of dining options amid lush surroundings.'
    },
    {
      'image': 'images/h6.jpg',
      'title': 'The Zuri Kumarakom',
      'rating': 4.5,
      'location': 'Kumarakom, Kerala',
      'price': 220.0,
      'description': 'The Zuri Kumarakom offers a serene retreat with beautiful backwater views. Experience well-appointed rooms, a spa, outdoor pool, and gourmet dining options in a tranquil setting.'
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InnVite'),
        backgroundColor: Colors.white,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 100,
              color: Color(0xFF41436A),
              child: DrawerHeader(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'InnVite',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                // Handle profile tap
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TravelSlider()),
                );
              },
            ),

          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(height: 300.0, autoPlay: true),
              items: carouselImages.map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(33),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recommended', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('View All', style: TextStyle(color: Colors.blue)),
                ],
              ),
            ),
            GridView.builder(
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: recommendedItems.length,
              itemBuilder: (context, index) {
                final item = recommendedItems[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HotelDetailsPage(
                          title: item['title'],
                          location: item['location'],
                          price: item['price'],
                          rating: item['rating'],
                          description: item['description'],
                          imageUrl: item['image'],
                        ),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(item['image']),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          color: Colors.black.withOpacity(0.5),
                          child: ListTile(
                            title: Text(
                              item['title'],
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              '${item['rating']} stars',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF41436A),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
