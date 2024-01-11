// booking_viewmodel.dart
import 'package:map_mvvm/view/viewmodel.dart';
import 'package:my_app/Booking/models/booking.dart';
import 'package:my_app/Booking/models/user.dart';
import 'package:my_app/Booking/services/booking/booking_service.dart';
import 'package:my_app/Booking/services/user/user_service.dart';
import 'package:my_app/Configs/service_locator.dart';


class BookingViewModel extends Viewmodel {
  final UserService _userService = locator();
  final _bookingService = locator<BookingService>();
  late Booking activeBooking;
  User user;

  BookingViewModel({required this.user});

  Future<void> getName(String id) async {
    try {
      user = await _userService.getUserById(id);
      update();
    } catch (e) {
      print("Error fetching user details: $e");
    }
  }

  User getUser(String uid) {
    return user;
  }

  Future<void> getBooking(String id) async {
    // Implement the logic to get booking
    activeBooking = _bookingService.getBookingById(id);
    update();
  }

  Future<void> updateBooking(String id, Booking data) async {
    try {
      // Implement the logic to update booking
      // Booking updated = await _bookingService.updateBooking(id, data);
      // activeBooking = updated;
      update();
    } catch (e) {
      print("Error updating booking: $e");
    }
  }
}
