import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:mad/controller/order_controller.dart';
import 'package:mad/controller/product_controller.dart';
import 'package:mad/data/shared_pref_manager.dart';
import 'package:mad/model/product.dart';
import 'package:mad/screen/book_detail_screen.dart';
import 'package:badges/badges.dart' as badges;
import 'package:mad/service/product_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _fullName = "Guest";

  final orderController = Get.put(OrderController());

  final productController = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    _loadCurrentUser();
    _loadUserData();
    // _loadProduct();
  }

  //
  // Future<void> _loadProduct() async{
  //   await ProductService.instance.getProducts();
  // }

  Future<void> _loadCurrentUser() async {
    // final sharedPrefManager = SharedPrefManager();
    // String fullName = await sharedPrefManager.getSharedPref("fullName");
    User? currentUser =  await FirebaseAuth.instance.currentUser;
    setState(() {
      _fullName = currentUser!.displayName ?? "Guest";
    });
  }

  Future<void> _loadUserData() async{
    final u = await FacebookAuth.instance.getUserData(
        fields: "email,name,picture.width(200)",);
    print('Email: ${u['email']}');
    print('Picture:${u['picture']['data']['url']}');
    String photoUrl = "${u['picture']['data']['url']}";
    User? user = await FirebaseAuth.instance.currentUser;
    user!.updatePhotoURL(photoUrl);
  }

  @override
  Widget build(BuildContext context) {
    final title = Padding(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Text(
        "Hi, $_fullName",
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      ),
    );
    final subTitle = Padding(
      padding: EdgeInsets.only(left: 32, right: 16),
      child: Text(
        "What do you want to read today?",
        style: TextStyle(fontSize: 16, color: Colors.black87),
      ),
    );

    List<String> menuArr = ["All", "ប្រលោមលោក", "បច្ចេកវិទ្យា", "សាសនា"];

    List<Widget> menuList = List.generate(menuArr.length, (i) {
      return Container(
        width: 100,
        child: TextButton(
          onPressed: () {

          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent),
          child: Text("${menuArr[i]}", style: TextStyle(color: Colors.white),),
        ),
      );
    });
    final menuListRow = SizedBox(
      height: 40,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: menuList,
        ),
      ),
    );

    final booksListRow3  = Obx(() {
        if(productController.isLoading.value == false){
          return Center(child: CircularProgressIndicator(),);
        }
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: List.generate(productController.products.length, (i) {
            Product product = productController.products[i];
            return GestureDetector(
              child: Padding(
                padding: EdgeInsetsGeometry.all(8),
                child:
                // Image.asset(
                //   "assets/images/book${i + 1}.png",
                //   height: 250,
                //   fit: BoxFit.cover,
                // )
                Image.network("${product.image}",
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child; // Image loaded completely
                    return Image.asset('assets/images/default-image-cover.jpg'); // While loading
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/images/default-image-cover.jpg'); // If network fails
                  },
                )
                ,
              ),
              onTap: () {
                final route = MaterialPageRoute(
                  builder: (BuildContext context) => BookDetailScreen(),
                );
                Navigator.push(context, route);
              },
            );
          })),
        );
    });

    final booksListRow2  = GetBuilder<ProductController>(
        builder: (_)  => SizedBox(
          height: 260,
          child: productController.isLoading.value ? Center(child: CircularProgressIndicator(),) :
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: List.generate(productController.products.length, (i) {
              Product product = productController.products[i];
              return GestureDetector(
                child: Padding(
                  padding: EdgeInsetsGeometry.all(8),
                  child:
                  // Image.asset(
                  //   "assets/images/book${i + 1}.png",
                  //   height: 250,
                  //   fit: BoxFit.cover,
                  // )
                  Image.network("${product.image}",
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child; // Image loaded completely
                      return Image.asset('assets/images/default-image-cover.jpg'); // While loading
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset('assets/images/default-image-cover.jpg'); // If network fails
                    },
                  )
                  ,
                ),
                onTap: () {
                  final route = MaterialPageRoute(
                    builder: (BuildContext context) => BookDetailScreen(),
                  );
                  Navigator.push(context, route);
                },
              );
            })),
          ),
        ));


    List<Widget> booksList = List.generate(3, (i) {
      return GestureDetector(
        child: Padding(
          padding: EdgeInsetsGeometry.all(8),
          child: Image.asset(
            "assets/images/book${i + 1}.png",
            height: 250,
            fit: BoxFit.cover,
          ),
        ),
        onTap: () {
          final route = MaterialPageRoute(
            builder: (BuildContext context) => BookDetailScreen(),
          );
          Navigator.push(context, route);
        },
      );
    });
    final booksListRow = SizedBox(
      height: 260,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: booksList),
      ),
    );

    final cartItems = badges.Badge(
      badgeContent: Obx(() => Text("${orderController.orderList.length}")),
      child: Icon(Icons.shopping_cart),
    );

    final searchWidget = Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: 'Search...',
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: title,
        actions: [cartItems, Icon(Icons.more_vert)],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            subTitle,
            searchWidget,
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Category",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            menuListRow,
            booksListRow2,
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text(
                "New Arrival",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            booksListRow3,
          ],
        ),
      ),
    );
  }
}
