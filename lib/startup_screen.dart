import 'package:flutter/material.dart';

class StartupScreen extends StatefulWidget {
  const StartupScreen({super.key});

  @override
  State<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  @override
  Widget build(BuildContext context) {

    final logo = Center(
      child: Image.asset("assets/images/beltei_iu.png", height: 150,),
    );
    
    final getStartBtn = Padding(padding: EdgeInsets.only(left: 8, right: 8, bottom: 16),
    child: SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF3051A0)
          ),
          onPressed: (){}, child: Text("ចាប់ផ្តើម", style: TextStyle(color: Colors.white),)),
    ),);


    return Scaffold(
      body: Column(
        children: [
          Expanded(child: logo,),
          getStartBtn
        ],
      ),
    );
  }
}
