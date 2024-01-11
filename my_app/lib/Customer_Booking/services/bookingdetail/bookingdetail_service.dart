import 'package:my_app/Customer_Booking/models/bookingdetail.dart';

class BookingDetailService {
  static Future<List<BookingDetail>> fetchServices() async {
    // Simulate fetching services from an API or database
    await Future.delayed(const Duration(seconds: 2)); // Simulating a delay

    // Replace with actual logic to fetch services
    List<BookingDetail> services = [
      BookingDetail(
        id: '1',
        name: 'Haircut Service',
        haircutType: 'Regular Cut',
        time: '',
        price: 50.0,
      ),
      BookingDetail(
        id: '2',
        name: 'Beard Trim Service',
        haircutType: 'Beard Grooming',
        time: '',
        price: 30.0,
      ),
      // Add more services as needed
    ];
    return services;
  }

  static Future<List<BookingDetail>> fetchBookingDetails(
      DateTime selectedDate) async {
    // Simulate fetching booking details for the selected date
    await Future.delayed(const Duration(seconds: 2)); // Simulating a delay

    // Replace with actual logic to fetch booking details
    List<BookingDetail> bookings = [
      BookingDetail(
        id: '1',
        name: 'Amirul Haziq',
        haircutType: 'Regular Cut',
        time: '2022-01-10 10:00 AM', // Use actual time
        price: 50.0,
      ),
      BookingDetail(
        id: '2',
        name: 'John Doe',
        haircutType: 'Beard Grooming',
        time: '2022-01-10 2:00 PM', // Use actual time
        price: 30.0,
      ),
      // Add more booking details as needed
    ];

    // Filter bookings for the selected date
    List<BookingDetail> filteredBookings = bookings
        .where((booking) =>
            booking.time.isNotEmpty &&
            DateTime.parse(booking.time).isAtSameMomentAs(selectedDate))
        .toList();

    return filteredBookings;
  }

  static Future<void> saveBookingToHistory(BookingDetail bookingDetail) async {
    // Simulate saving booking details to history
    await Future.delayed(const Duration(seconds: 1)); // Simulating a delay

    // Replace with actual logic to save booking details to history
    // In a real app, you might use a database or API
    print('Saving booking to history: ${bookingDetail.toMap()}');
  }
}
