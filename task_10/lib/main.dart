import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task 10',
      home: BottomNavScreen(),
    );
  }
}

class BottomNavScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(title: Text('Task 10')),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(), // Prevents swipe navigation
          children: [
            HomeScreen(),
            SearchScreen(),
            ProfileScreen(),
          ],
        ),
        bottomNavigationBar: TabBar(
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.transparent, // Removes indicator animation
          tabs: [
            Tab(icon: Icon(Icons.home), text: 'Home'),
            Tab(icon: Icon(Icons.search), text: 'Search'),
            Tab(icon: Icon(Icons.person), text: 'Profile'),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/home.jpg', width: 150),
          SizedBox(height: 10),
          Text('Welcome to Home Screen', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/search.jpg', width: 150),
          SizedBox(height: 10),
          Text('Search for anything!', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/profile.jpg', width: 150),
          SizedBox(height: 10),
          Text('This is your profile', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
