class Schedule {
  final String id; // Make sure you have an id property
  final String name;
  final String haircutType;
  final String time;
  final double price;

  Schedule({
    required this.id,
    required this.name,
    required this.haircutType,
    required this.time,
    required this.price,
  });

  factory Schedule.fromMap(Map<String, dynamic> map) {
    return Schedule(
      id: map['id'],
      name: map['name'],
      haircutType: map['haircutType'],
      time: map['time'],
      price: map['price'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'haircutType': haircutType,
      'time': time,
      'price': price,
    };
  }
}
