import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageGridScreen(),
      title: 'Flutter Demo',
    );
  }
}

class ImageGridScreen extends StatelessWidget {
  final List<String> imageUrls = [
    "https://images.unsplash.com/photo-1580477667995-2b94f01c9516?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1615592389070-bcc97e05ad01?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1578632767115-351597cf2477?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1575540325855-4b5d285a3845?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ];

  final List<String> assetImages = [
    "assets/images/img1.jpg",
    "assets/images/img2.jpg",
    "assets/images/img3.jpg",
    "assets/images/img4.jpg",
    "assets/images/img5.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    List<String> allImages = [...imageUrls, ...assetImages];
    return Scaffold(
      appBar: AppBar(title: Text("Lab Task 7")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            crossAxisSpacing: 10, 
            mainAxisSpacing: 10, 
            childAspectRatio: 1.0, 
          ),
          itemCount: allImages.length,
          itemBuilder: (context, index) {
            String imagePath = allImages[index];
            bool isNetworkImage = imagePath.startsWith("http");

            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: isNetworkImage
                  ? Image.network(
                      imagePath,
                      fit: BoxFit.cover, 
                      width: double.infinity,
                      height: double.infinity,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(child: CircularProgressIndicator());
                      },
                    )
                  : Image.asset(
                      imagePath,
                      fit: BoxFit.cover, 
                      width: double.infinity,
                      height: double.infinity,
                    ),
            );
          },
        ),
      ),
    );
  }
}
