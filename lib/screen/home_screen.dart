import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: Text("Hi, Guest", style: TextStyle(
          fontSize: 14
        ),),
        centerTitle: false,
        actions: [
          Icon(Icons.notifications),
          Icon(Icons.more_vert)
        ],
      ),
      body: SafeArea(child: Center(child: Text("Home"),)),
    );
  }
}
