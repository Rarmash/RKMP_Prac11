class Order {
  final String id; // строковый id для истории
  final int productId;
  final String productName;
  final int quantity;
  final DateTime date;

  const Order({
    required this.id,
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.date,
  });
}
