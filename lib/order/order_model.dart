import 'package:flutter/foundation.dart';
import 'package:workshop/user/user_model.dart';
import './order_item_model.dart';

class Order {
  final String order_id;
  final List<OrderItemModel> order;
  final int total_amount;
  final User buyer;

  Order({
    required this.order_id,
    required this.buyer,
    required this.order,
    required this.total_amount,
  });
}
