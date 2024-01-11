// services/home_service.dart
import 'package:my_app/Customer_Booking/models/home.dart';

class HomeService {
  Home? _selectedService;

  Home? get selectedService => _selectedService;

  void selectService(Home service) {
    _selectedService = service;
  }

  List<Home> getAvailableServices() {
    return [
      Home(haircutType: 'Classic Shaving', price: 20.0),
      Home(haircutType: 'Haircut', price: 15.0),
      Home(haircutType: 'Beard Trimming', price: 10.0),
      Home(haircutType: 'Haircut Washing', price: 18.0),
    ];
  }
}
