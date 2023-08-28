// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

List<Order> orderFromJson(String str) =>
    List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String orderToJson(List<Order> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Order {
  final String? orderId;
  final String? userId;
  final DateTime? date;
  final String? total;
  final String? status;
  final String? email;
  final String? fullName;

  Order({
    this.orderId,
    this.userId,
    this.date,
    this.total,
    this.status,
    this.email,
    this.fullName,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderId: json["orderID"],
        userId: json["userID"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        total: json["total"],
        status: json["status"],
        email: json["email"],
        fullName: json["fullName"],
      );

  Map<String, dynamic> toJson() => {
        "orderID": orderId,
        "userID": userId,
        "date": date?.toIso8601String(),
        "total": total,
        "status": status,
        "email": email,
        "fullName": fullName,
      };
}
