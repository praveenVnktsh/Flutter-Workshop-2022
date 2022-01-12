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
}
