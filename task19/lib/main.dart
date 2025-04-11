import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: CustomDrawerExample(),
    debugShowCheckedModeBanner: false,
  ));
}

class CustomDrawerExample extends StatefulWidget {
  @override
  _CustomDrawerExampleState createState() => _CustomDrawerExampleState();
}

class _CustomDrawerExampleState extends State<CustomDrawerExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(-1.0, 0.0), 
      end: Offset(0.0, 0.0),    
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void toggleDrawer() {
    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         
          SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: toggleDrawer,
                    ),
                    Text("Custom Drawer Task"),
                  ],
                ),
                Expanded(
                  child: Center(child: Text('Hi from Muhsina')),
                ),
              ],
            ),
          ),

         
          SlideTransition(
            position: _slideAnimation,
            child: SafeArea(
              child: Container(
                width: 250,
                color: Colors.blueGrey[900],
                child: ListView(
                  padding: EdgeInsets.all(20),
                  children: [
                    ListTile(
                      title: Text('Home', style: TextStyle(color: Colors.white)),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text('Profile', style: TextStyle(color: Colors.white)),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text('Settings', style: TextStyle(color: Colors.white)),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
