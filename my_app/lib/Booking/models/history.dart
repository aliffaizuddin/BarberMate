class History {
  final String id;
  final String name;
  final String haircutType;
  final String time;
  final double price;

  History({
    required this.id,
    required this.name,
    required this.haircutType,
    required this.time,
    required this.price,
  });

  // Add a factory method to create History object from a Map
  factory History.fromMap(Map<String, dynamic> map) {
    return History(
      id: map['id'],
      name: map['name'],
      haircutType: map['haircutType'],
      time: map['time'],
      price: map['price'],
    );
  }

  // Add a method to convert History object to a Map
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
