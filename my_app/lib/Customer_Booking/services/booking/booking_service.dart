// booking_service.dart


import 'package:my_app/Customer_Booking/models/booking.dart';

class BookingServiceCustomer {
  List<String> getBookedSlots(DateTime selectedDate) {
    // Replace this with actual logic to fetch booked slots for the selected date
    // For simplicity, using dummy data here
    return ['11:30 AM', '2:00 PM', '5:00 PM'];
  }

  bool isSlotAvailable(String selectedTime, List<String> bookedSlots) {
    return !bookedSlots.contains(selectedTime);
  }

  static Booking createBooking(
    String name,
    String haircut,
    String selectedTime,
    DateTime selectedDate,
  ) {
    // Replace this with actual logic to create a new booking
    // For simplicity, using dummy data here
    return Booking(
      id: DateTime.now().toString(),
      name: name,
      haircutType: haircut,
      time: selectedTime,
      selectedDate: selectedDate, // Added the selectedDate parameter
      price: 0.0, // Set the actual price based on your business logic
    );
  }
}
