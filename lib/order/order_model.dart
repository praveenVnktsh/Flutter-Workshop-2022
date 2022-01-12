import 'package:flutter/foundation.dart';
import 'package:workshop/user/user_model.dart';
import './order_item_model.dart';
import 'dart:math';

class Order {
  final String databaseId;
  final String order_id;
  final List<OrderItemModel> order;
  final int total_amount;
  final User buyer;
  final String time_of_placing;
  Order({
    required this.databaseId, // just to keep a track of where this order is in the actual database
    required this.order_id,
    required this.buyer,
    required this.order,
    required this.total_amount,
    required this.time_of_placing,
  });

  Map orderJsonCreator(List<OrderItemModel> orderList) {
    Map returnMap = {};
    for (OrderItemModel orderItem in orderList) {
      Map orderJson = orderItem.toJson();
      returnMap[orderItem.item_id] = orderJson;
    }
    return returnMap;
  }
  // will be map of the form
  // {
  //  '2':{'item_id':'2,'item_name':'Pizza','item_quantity':'3','net_amount':'240'},
  //  '3':{similarly},
  //  '7':{},
  // }

  // Note - databseId not needed to be stored in the json
  Map toJson() {
    Map userJson = buyer.toJson();
    Map orderJson = orderJsonCreator(order);
    return {
      'order_id': this.order_id,
      'total_amount': this.total_amount,
      'time_of_placing': this.time_of_placing,
      'order': orderJson,
      'buyer': userJson,
    };
  }
  //json['order] is the list of all orderItems converted to a json

  static List<OrderItemModel> orderList_returner(dynamic json) {
    // there could be an error here regarding double decoding kinda problem
    // because we're passing json['order'] to this function which might already be a map
    final extacted_data = json.decode(json) as Map;
    List<OrderItemModel> x = List.empty(growable: true);
    extacted_data.forEach((key, value) {
      // key is the item id which is already with us
      OrderItemModel m = OrderItemModel.fromJson(value);
      x.add(m);
    });
    return x;
  }

  factory Order.fromJson(dynamic json) {
    return Order(
        databaseId: getRandomString(10), // will be changed later
        order_id: "${json['order_id']}",
        buyer: User.fromJson(json['buyer']),
        order: orderList_returner(json['order']),
        total_amount: int.parse("${json['total_amount']}"),
        time_of_placing: "${json['time_of_placing']}");
  }

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  static Random _rnd = Random();
  static String getRandomString(int length) =>
      String.fromCharCodes(Iterable.generate(
          length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
