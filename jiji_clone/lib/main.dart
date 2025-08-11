import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jiji Clone',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {'name': 'Phones', 'icon': '📱'},
    {'name': 'Electronics', 'icon': '💻'},
    {'name': 'Cars', 'icon': '🚗'},
    {'name': 'Real Estate', 'icon': '🏠'},
    {'name': 'Fashion', 'icon': '👗'},
    {'name': 'Jobs', 'icon': '💼'},
  ];

  final List<Map<String, String>> listings = [
    {
      'title': 'iPhone 14 Pro Max',
      'price': '\$999',
      'location': 'Lagos, Nigeria',
      'image': 'https://via.placeholder.com/150'
    },
    {
      'title': 'Toyota Corolla 2018',
      'price': '\$15,000',
      'location': 'Abuja, Nigeria',
      'image': 'https://via.placeholder.com/150'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jiji Clone"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Categories
            Container(
              height: 100,
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 80,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(categories[index]['icon']!, style: TextStyle(fontSize: 24)),
                        SizedBox(height: 5),
                        Text(
                          categories[index]['name']!,
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Divider(),
            // Listings
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Latest Listings",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: listings.map((item) {
                return Card(
                  margin: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Image.network(item['image']!, width: 100, height: 100, fit: BoxFit.cover),
                      Expanded(
                        child: ListTile(
                          title: Text(item['title']!),
                          subtitle: Text(item['location']!),
                          trailing: Text(
                            item['price']!,
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
