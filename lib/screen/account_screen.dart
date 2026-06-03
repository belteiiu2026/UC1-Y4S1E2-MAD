import 'package:flutter/material.dart';
import 'package:mad/data/shared_pref_manager.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  bool _isUserLogin = false;

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
          style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFD45555)),
          onPressed: _onLogoutSubmitHandler,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("ចាកចេញ", style: TextStyle(color: Colors.white)),
              SizedBox(width: 4,),
              Icon(Icons.logout_outlined, color: Colors.white,)
            ],
          ),
        ),
      ),
    );


    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: SafeArea(child: Column(
        children: [

          Expanded(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/default-avatar-profile.avif')),
                      borderRadius: BorderRadius.circular(50)
                    ),
                  ),


                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text("Chhai Chivon"),
                    subtitle: Text("Full Name"),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.mail),
                    title: Text("mad@gmail.com"),
                    subtitle: Text("Email"),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.shopping_cart),
                    title: Text("Order"),
                    subtitle: Text("Cart"),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.light_mode),
                    title: Text("Light"),
                    subtitle: Text("Theme"),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.language),
                    title: Text("English"),
                    subtitle: Text("Language"),
                  ),
                  Divider()
                ],
              )
          ),
          _isUserLogin ? logoutButton : Container()
        ],
      )),
    );
  }
}
