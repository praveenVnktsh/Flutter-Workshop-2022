import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:workshop/order/order_model.dart';
import 'package:http/http.dart' as http;

class Order_proivider with ChangeNotifier {
  List<Order> _userOrdersList = List.empty(growable: true);

  List<Order> get userOrderList => _userOrdersList;

  void place_order_to_db(Order order) async {
    const url =
        'https://flutter-workshop-2022-test-default-rtdb.firebaseio.com/Orders.json';
    var response;
    try {
      response = await http.post(
        Uri.parse(url),
        body: json.encode(
          order.toJson(),
        ),
      );
    } catch (e) {
      print("Error in placing order to db");
      print(e);
    }
    var databaseId = json.decode(response.body)['name'];
    Order newOrder = Order(
      databaseId: databaseId,
      order_id: order.order_id,
      buyer: order.buyer,
      order: order.order,
      total_amount: order.total_amount,
      time_of_placing: order.time_of_placing,
    );
    _userOrdersList.add(newOrder);
    if (kDebugMode) {
      print("new order added");
    }
    notifyListeners();
  }

  Future<List<Order>?> recieveOrders() async {
    const url =
        'https://flutter-workshop-2022-test-default-rtdb.firebaseio.com/Orders.json';
    try {
      final respone = await http.get(Uri.parse(url));
      final extractedData = json.decode(respone.body) as Map;
      List<Order> all_user_orders = List.empty(growable: true);
      extractedData.forEach(
        (key, value) {
          if (value['buyer']['email'] == "gautam.pv@iitgn.ac.in") {
            //change this email id to the generic stored email id
            all_user_orders.add(Order.fromJson(value));
          }
        },
      );
      _userOrdersList = List.empty(growable: true);
      all_user_orders.forEach((element) {
        _userOrdersList.add(element);
      });
      notifyListeners();
      return all_user_orders;
    } catch (e) {
      if (kDebugMode) {
        print("Error in recieving list of orders");
        return null;
      }
    }
  }
}
