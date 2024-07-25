import 'package:flutter/material.dart';

class HotelDetailsPage extends StatelessWidget {
  final String title;
  final String location;
  final double price;
  final double rating;
  final String description;
  final String imageUrl;

  HotelDetailsPage({
    required this.title,
    required this.location,
    required this.price,
    required this.rating,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl), // Changed to AssetImage
                fit: BoxFit.cover,
              ),
            ),
          ),
          // AppBar with back button
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          // Page content
          DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.6,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title and Price
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,

                              ),
                            ),


                          ],
                        ),

                        SizedBox(height: 6),
                        // Location and Rating
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.purple),
                            SizedBox(width: 4),
                            Text(
                              location,
                              style: TextStyle(fontSize: 20),
                            ),
                            Spacer(),
                            Icon(Icons.star, color: Colors.amber),
                            SizedBox(width: 4),
                            Text(
                              '$rating',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Text(
                              'Rs.$price',
                              style: TextStyle(

                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 26),
                        // People
                        Text(
                          'People',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Number of people in your group',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(5, (index) {
                            return ChoiceChip(
                              label: Text('${index + 1}'),
                              selected: false,
                              onSelected: (selected) {
                                // Handle chip selection
                              },
                            );
                          }),
                        ),
                        SizedBox(height: 16),
                        // Description
                        Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          description,
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 16),
                        // Book Trip Now Button
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle continue button press
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              backgroundColor: Colors.redAccent,
                            ),
                            child: Text(
                              'Book Now',
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
