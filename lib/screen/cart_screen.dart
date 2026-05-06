import 'package:flutter/material.dart';
import 'package:mad/model/orders.dart';
import 'package:mad/service/order_service.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 3),
      body: SafeArea(
        child: FutureBuilder(
          future: OrderService.instance.readOrders(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Orders>> snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                }

                if (!snapshot.hasData) {
                  return Center(child: Text("No Data"));
                }

                List<Orders> orderList = snapshot.data as List<Orders>;
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    final orderItem = orderList[index];
                    return ListTile(
                      leading: Icon(Icons.book),
                      title: Text("${orderItem.bookId}"),
                      subtitle: Text("${orderItem.totalAmount}"),
                      trailing: Icon(Icons.check_circle),
                    );
                  },
                );
              },
        ),
      ),
    );
  }
}
