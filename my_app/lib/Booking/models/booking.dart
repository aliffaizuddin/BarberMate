class Booking {
  final String id;
  final String name;
  final String haircutType;
  final String time;
  final double price;
  final List<Map<String, dynamic>> customers; // Add this line

  Booking({
    required this.id,
    required this.name,
    required this.haircutType,
    required this.time,
    required this.price,
    required this.customers,
  });
}
