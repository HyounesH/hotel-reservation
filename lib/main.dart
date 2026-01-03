import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const d_green = Color(0xFF54D3C2);
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotel Reservation',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HotelAppBar(),
      body: Container(
        color: d_green,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchSection(),
              HotelSectionV2(),
              // Additional sections can be added here
            ],
          ),
        ),
      ),
    );
  }
}

class HotelAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HotelAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.grey[800]),
        iconSize: 20,
        onPressed: null,
      ),
      title: const Text(
        'Explore',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          icon: Icon(Icons.favorite_outline_rounded, color: Colors.grey[800]),
          iconSize: 20,
          onPressed: null,
        ),
        IconButton(
          icon: Icon(Icons.place, color: Colors.grey[800]),
          iconSize: 20,
          onPressed: null,
        ),
      ],
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for city, hotel, or address',
                    hintStyle: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 15,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5),
              // add can add a search button here
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: d_green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: EdgeInsets.all(0),
                  ),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choose Date',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      '12 Dec - 24 Dec',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Number of Rooms',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      '1 Room - 2 Adults',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HotelSection extends StatelessWidget {
  final List<Map<String, dynamic>> hotelList = [
    {
      "name": "Grand Royl Hotel",
      "location": "City X",
      "distance": 2,
      "review": 35,
      "picture": "images/hotel_1.jpg",
      "price": 120,
    },
    {
      "name": "Sunny Side Inn",
      "location": "City X",
      "distance": 3,
      "review": 42,
      "picture": "images/hotel_2.jpg",
      "price": 95,
    },
    {
      "name": "Blue Horizon Hotel",
      "location": "City X",
      "distance": 1.5,
      "review": 50,
      "picture": "images/hotel_3.jpg",
      "price": 150,
    },
    {
      "name": "Royal Comfort Suites",
      "location": "City X",
      "distance": 4,
      "review": 28,
      "picture": "images/hotel_4.jpg",
      "price": 110,
    },
    {
      "name": "City Lights Hotel",
      "location": "City X",
      "distance": 2.8,
      "review": 37,
      "picture": "images/hotel_5.jpg",
      "price": 130,
    },
    {
      "name": "The Elegant Stay",
      "location": "City X",
      "distance": 3.5,
      "review": 45,
      "picture": "images/hotel_6.jpg",
      "price": 140,
    },
    {
      "name": "Sunset Paradise Inn",
      "location": "City X",
      "distance": 5,
      "review": 30,
      "picture": "images/hotel_7.jpg",
      "price": 100,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  " 550 Hotels Found",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Filter",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.filter_list, color: d_green),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Column(
            children: hotelList.map((hotel) {
              return Container(
                margin: EdgeInsets.only(bottom: 15),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        hotel['picture'],
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hotel['name'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '${hotel['location']} • ${hotel['distance']} km to city',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '${hotel['review']} reviews',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '\$${hotel['price']}/night',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: d_green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class HotelSectionV2 extends StatelessWidget {
  final List<Map<String, dynamic>> hotelList = [
    {
      "name": "Grand Royl Hotel",
      "location": "City X",
      "distance": 2,
      "review": 35,
      "picture": "images/hotel_1.jpg",
      "price": 120,
    },
    {
      "name": "Sunny Side Inn",
      "location": "City X",
      "distance": 3,
      "review": 42,
      "picture": "images/hotel_2.jpg",
      "price": 95,
    },
    {
      "name": "Blue Horizon Hotel",
      "location": "City X",
      "distance": 1.5,
      "review": 50,
      "picture": "images/hotel_3.jpg",
      "price": 150,
    },
    {
      "name": "Royal Comfort Suites",
      "location": "City X",
      "distance": 4,
      "review": 28,
      "picture": "images/hotel_4.jpg",
      "price": 110,
    },
    {
      "name": "City Lights Hotel",
      "location": "City X",
      "distance": 2.8,
      "review": 37,
      "picture": "images/hotel_5.jpg",
      "price": 130,
    },
    {
      "name": "The Elegant Stay",
      "location": "City X",
      "distance": 3.5,
      "review": 45,
      "picture": "images/hotel_6.jpg",
      "price": 140,
    },
    {
      "name": "Sunset Paradise Inn",
      "location": "City X",
      "distance": 5,
      "review": 30,
      "picture": "images/hotel_7.jpg",
      "price": 100,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  " 550 Hotels Found",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Filter",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.filter_list, color: d_green),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Column(
            children: hotelList.map((hotel) {
              return HotelCard(hotel: hotel);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final Map<String, dynamic> hotel;
  HotelCard({required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(18)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 4,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              image: DecorationImage(
                image: AssetImage(hotel['picture']),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.favorite_border,
                      color: d_green,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          hotel['name'],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              '${hotel['location']} • ${hotel['distance']} km to city',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(width: 3),
                            Icon(Icons.location_on, color: d_green, size: 14),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.star, color: d_green, size: 14),
                            Icon(Icons.star, color: d_green, size: 14),
                            Icon(Icons.star, color: d_green, size: 14),
                            Icon(Icons.star, color: d_green, size: 14),
                            Icon(
                              Icons.star_outline,
                              color: d_green,
                              size: 14,
                            ),
                            SizedBox(width: 5),
                            Text(
                              '${hotel['review']} reviews',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '\$${hotel['price']}/night',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: d_green,
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
