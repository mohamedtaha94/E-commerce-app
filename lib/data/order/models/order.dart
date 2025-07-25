import 'package:e_commerce/data/order/models/order_status.dart';
import 'package:e_commerce/data/order/models/product_ordered.dart';
import 'package:e_commerce/domain/order/entities/order.dart';



class OrderModel {
  final String id;
  final String code;
  final String createdDate;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;
  final List<ProductOrderedModel> products;
  final List<OrderStatusModel> orderStatus;

  OrderModel({
    required this.id,
    required this.code,
    required this.createdDate,
    required this.shippingAddress,
    required this.itemCount,
    required this.totalPrice,
    required this.products,
    required this.orderStatus,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map, String id) {
    return OrderModel(
      id: id,
      code: map['code'],
      createdDate: map['createdDate'],
      shippingAddress: map['shippingAddress'],
      itemCount: map['itemCount'],
      totalPrice: (map['totalPrice'] as num).toDouble(),
      products: (map['products'] as List)
          .map((e) => ProductOrderedModel.fromMap(e))
          .toList(),
      orderStatus: (map['orderStatus'] as List)
          .map((e) => OrderStatusModel.fromMap(e))
          .toList(),
    );
  }

  OrderEntity toEntity() {
    return OrderEntity(
      id: id,
      code: code,
      createdDate: createdDate,
      shippingAddress: shippingAddress,
      itemCount: itemCount,
      totalPrice: totalPrice,
      products: products.map((e) => e.toEntity()).toList(),
      orderStatus: orderStatus.map((e) => e.toEntity()).toList(),
    );
  }
}
