import 'package:flutter/material.dart';
import 'package:mad/data/shared_pref_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String _fullName = "Guest";

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final sharedPrefManager = SharedPrefManager();
    String fullName = await sharedPrefManager.getSharedPref("fullName");
    setState(() {
      _fullName = fullName;
    });
  }

  @override
  Widget build(BuildContext context) {

    final title = Padding(padding: EdgeInsets.only(left: 16, right: 16), child: Text("Hi, $_fullName", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.red),),);
    final subTitle = Padding(padding: EdgeInsets.only(left: 16, right: 16), child: Text("What do you want to read today?", style: TextStyle(fontSize: 16, color: Colors.black87),),);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [Icon(Icons.notifications), Icon(Icons.more_vert)],
      ),
      body: SafeArea(child: ListView(
        children: [
          title,
          subTitle
        ],
      )),
    );
  }
}
