import 'package:map_mvvm/view/viewmodel.dart';
import 'package:my_app/Booking/services/booking/booking_service.dart';
import 'package:my_app/Configs/service_locator.dart';

class ScheduleViewModel extends Viewmodel {
  final _bookingService = locator<BookingService>();
  List<Map<String, dynamic>> doneCustomers = [];

  // Implement any additional logic or methods as needed

  void markCustomerAsDone(Map<String, dynamic> customer) {
    _bookingService.markCustomerAsDone(customer);
    doneCustomers.add(customer);
    update();
  }
}
