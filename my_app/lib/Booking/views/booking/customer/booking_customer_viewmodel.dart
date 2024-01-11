import 'package:map_mvvm/view/viewmodel.dart';
import 'package:my_app/Booking/models/booking.dart';
import 'package:my_app/Booking/models/user.dart';
import 'package:my_app/Booking/services/booking/booking_service.dart';
import 'package:my_app/Booking/services/user/user_service.dart';
import 'package:my_app/Configs/service_locator.dart';

class BookingCustomerViewModel extends Viewmodel {
  final UserService _userService = locator();
  final _bookingService = locator<BookingService>();
  late Booking activeBooking;
  User user;

  BookingCustomerViewModel({required this.user});

  void addCustomer(Map<String, dynamic> customer) {
    activeBooking.customers.add(customer);
    update();
  }

  void removeLastCustomer() {
    // Implement the logic to remove the last customer
  }
}
