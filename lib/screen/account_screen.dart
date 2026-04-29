import 'package:flutter/material.dart';
import 'package:mad/data/shared_pref_manager.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  Future<void> _onLogoutSubmitHandler() async {
    final sharedPrefManager = SharedPrefManager();
    sharedPrefManager.removeSharedPref("fullName");
  }

  @override
  Widget build(BuildContext context) {

    final logoutButton = Padding(
      padding: EdgeInsets.only(left: 8, right: 8, bottom: 16),
      child: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF3051A0)),
          onPressed: _onLogoutSubmitHandler,
          child: Text("ចាកចេញ", style: TextStyle(color: Colors.white)),
        ),
      ),
    );


    return Scaffold(
      appBar: AppBar(
        elevation: 3,
      ),
      body: SafeArea(child: Column(
        children: [
          Expanded(child: Text("Account")),
          logoutButton
        ],
      )),
    );
  }
}
