import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<String> favorites = List.generate(10, (i) => "$i").toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorite"), centerTitle: true),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: ValueKey<int>(index),
              resizeDuration: Duration(seconds: 2),
              background: Container(
                color: Colors.redAccent,
              ),
              onDismissed: (direction){
                  setState(() {
                    favorites = favorites;
                  });
              },
              child: ListTile(
                leading: Image.asset(
                  "assets/images/book2.png",
                  width: 50,
                  height: 100,
                ),
                subtitle: Text("10 \$"),
                title: Text("Khmer Book"),
                trailing: Icon(Icons.navigate_next),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
          itemCount: favorites.length,
        ),
      ),
    );
  }
}
