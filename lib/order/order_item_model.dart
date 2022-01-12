import 'package:flutter/foundation.dart';

// this defined what one item in the order should look like
class OrderItemModel {
  final String item_id; // could keep as int too as per need
  final String item_name;
  final int item_quantity;
  final int net_amount;

  OrderItemModel({
    required this.item_id,
    required this.item_name,
    required this.item_quantity,
    required this.net_amount,
  });

  Map toJson() => {
        'item_id': item_id,
        'item_name': this.item_name,
        'item_quantity': this.item_quantity.toString(),
        'net_amount': this.net_amount.toString(),
      };

  factory OrderItemModel.fromJson(dynamic json) {
    return OrderItemModel(
      item_id: "${json['item_id']}",
      item_name: "${json['item_name']}",
      item_quantity: int.parse("${json['item_quantity']}"),
      net_amount: int.parse("${json['net_amount']}"),
    );
  }
}
