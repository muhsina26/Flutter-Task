import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task 9',
      home: PaintingMaterialList(),
    );
  }
}

class PaintingMaterialList extends StatelessWidget {
  final List<Map<String, String>> paintingMaterials = [
    {
      'image': 'assets/images/painting_material_0.jpg',
      'title': 'Acrylic Paint Set 1',
      'subtitle': 'Premium Quality for Smooth Finishes',
      'description':
          'This acrylic paint set provides vibrant colors, perfect for canvas art. Great for beginners and professionals alike. Each tube contains 75ml of paint, ensuring long-lasting usage.',
    },
    {
      'image': 'assets/images/painting_material_1.jpg',
      'title': 'Oil Paint Set 2',
      'subtitle': 'Ideal for Canvas Painting',
      'description':
          'This set includes 12 vibrant oil paints, perfect for canvas painting. The paints have rich pigment quality and are easy to blend.',
    },
    {
      'image': 'assets/images/painting_material_2.jpg',
      'title': 'Watercolor Paint Set 3',
      'subtitle': 'Best for Fluid Artworks',
      'description':
          'This watercolor paint set includes 24 colors with smooth mixing capabilities, perfect for fluid and detailed watercolor artworks.',
    },
    {
      'image': 'assets/images/painting_material_3.jpg',
      'title': 'Brush Set 4',
      'subtitle': 'Fine Brushes for Every Detail',
      'description':
          'A set of premium brushes for oil, acrylic, and watercolor painting. Includes various sizes for precision detailing.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Painting Materials'),
      ),
      body: ListView.builder(
        itemCount: paintingMaterials.length,
        itemBuilder: (context, index) {
          return CustomCard(
            imageUrl: paintingMaterials[index]['image']!,
            title: paintingMaterials[index]['title']!,
            subtitle: paintingMaterials[index]['subtitle']!,
            description: paintingMaterials[index]['description']!,
          );
        },
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String description;

  CustomCard({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () {
          print('Card tapped');
        },
        splashColor: Colors.blue.withAlpha(30),
        highlightColor: Colors.blue.withAlpha(60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(imageUrl,
                  width: double.infinity, height: 180, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                subtitle,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
