

import 'package:map_mvvm/view/viewmodel.dart';
import 'package:my_app/Customer_Booking/models/booking.dart';
import 'package:my_app/Customer_Booking/services/booking/booking_service.dart';

class BookingViewModelCustomer extends Viewmodel {
  final BookingServiceCustomer _bookingService = BookingServiceCustomer();

  List<String> getBookedSlots(DateTime selectedDate) {
    return _bookingService.getBookedSlots(selectedDate);
  }

  bool isSlotAvailable(String selectedTime, List<String> bookedSlots) {
    return _bookingService.isSlotAvailable(selectedTime, bookedSlots);
  }

  Booking createBooking(String name, String haircut, String selectedTime,
      {required DateTime selectedDate}) {
    return BookingServiceCustomer.createBooking(
      name,
      haircut,
      selectedTime,
      selectedDate,
    );
  }
}
