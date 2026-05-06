import 'package:flutter/material.dart';
import 'package:mad/model/orders.dart';
import 'package:mad/service/order_service.dart';

class BookDetailScreen extends StatefulWidget {
  const BookDetailScreen({super.key});

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {


  Future<void> _orderProcess() async{
    final orders = Orders(
        bookId: 1,
        qty: 1,
        amount: 20000,
        phoneNumber: "01234567",
        discount : 0,
        totalAmount: 20000
    );
    await OrderService.instance.insertOrder(orders);
    final snackBar = SnackBar(content: Text("Order success"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  @override
  Widget build(BuildContext context) {
    final bookImage = SizedBox(
      height: 300,
      child: Center(
        child: Image.asset(
          "assets/images/book2.png",
          height: 300,
          fit: BoxFit.cover,
        ),
      ),
    );

    List<Widget> star = List.generate(5, (i) {
      return Icon(Icons.star);
    }).toList();

    final rateStateRow = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: star,
    );

    final bookTitle = Text(
      "កម្រងគតិបណ្ឌិត",
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
    final author = Text("គឹម ពេជ្រពីរនន់");

    final description = Text(
      "រាប់ពាន់ឆ្នាំមកហើយដែលបុព្វបុរសជាច្រើនធ្លាប់បានរៀនសូត្រ ទទួលបទពិសោធផ្ទាល់ខ្លួន ឬត្រិះរិះពិចារណារកឃើញសច្ចភាព ដ៏មានតម្លៃផ្សេងៗនិងបានចងក្រងនូវអ្វីដែលខ្លួនបានរកឃើញទាំងនោះដើម្បីទុកជាប្រយោជន៍ដល់អនុជនជំនាន់ក្រោយ។",
    );

    final addToCartButton = Padding(
      padding: EdgeInsets.only(left: 8, right: 8, bottom: 16),
      child: SizedBox(
        height: 40,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF3051A0)),
          onPressed: _orderProcess,
          child: Text(
            "Add to Cart",
            style: TextStyle(color: Colors.white, fontFamily: 'KantumruyPro'),
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: Text("Book Detail"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    bookImage,
                    rateStateRow,
                    bookTitle,
                    author,
                    Text("ពិពណ៌នា"),
                    SizedBox(height: 4),
                    description,
                  ],
                ),
              ),
              addToCartButton,
            ],
          ),
        ),
      ),
    );
  }
}
