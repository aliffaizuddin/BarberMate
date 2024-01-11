// viewmodels/home_viewmodel.dart
import 'package:my_app/Customer_Booking/models/home.dart';
import 'package:my_app/Customer_Booking/services/home/home_service.dart';
import 'package:map_mvvm/view/viewmodel.dart';

class HomeViewModel extends Viewmodel {
  final HomeService _homeService;

  HomeViewModel()
      : _homeService =
            HomeService(); // Initialize _homeService in the constructor

  Home? get selectedService => _homeService.selectedService;

  void selectService(Home service) {
    _homeService.selectService(service);
    notifyListeners();
  }
}
