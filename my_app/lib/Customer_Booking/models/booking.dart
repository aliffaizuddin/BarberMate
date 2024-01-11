class Booking {
  final String id;
  final String name;
  final String haircutType;
  final String time;
  final double price;

  Booking({
    required this.id,
    required this.name,
    required this.haircutType,
    required this.time,
    required this.price,
    required DateTime selectedDate,
  });
}
