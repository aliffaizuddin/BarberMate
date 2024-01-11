import 'package:map_mvvm/app/service_locator.dart';
import 'package:my_app/Booking/models/user.dart';
import 'package:my_app/Booking/services/booking/booking_service.dart';
import 'package:my_app/Booking/services/booking/booking_service_impl_memory.dart';
import 'package:my_app/Booking/services/history/history_service.dart';
import 'package:my_app/Booking/services/schedule/schedule_service.dart';
import 'package:my_app/Booking/services/user/user_service.dart';
import 'package:my_app/Booking/services/user/user_service_memory_impl.dart';
import 'package:my_app/Booking/views/booking/barber/booking_barber_viewmodel.dart';
import 'package:my_app/Booking/views/booking/booking_viewmodel.dart';
import 'package:my_app/Booking/views/history/history_viewmodel.dart';
import 'package:my_app/Booking/views/schedule/schedule_viewmodel.dart';
import 'package:my_app/Customer_Booking/services/booking/booking_service.dart';
import 'package:my_app/Customer_Booking/services/user/user_service.dart';
import 'package:my_app/Customer_Booking/services/user/user_service_impl.dart';
import 'package:my_app/Customer_Booking/views/booking/booking_viewmodel.dart';
import 'package:my_app/Customer_Booking/views/bookingdetail/bookingdetail_viewmodel.dart';
import 'package:my_app/Login/Services/Login/LoginService.dart';
import 'package:my_app/Login/Services/Register_Service/Register_Service_Memory_impl.dart';
import 'package:my_app/Login/View_Model/Login/Home_ViewModel.dart';
import '../Login/Services/Login/Login_Service_Memory_impl.dart';
import 'package:get_it/get_it.dart';

/*
final locator = ServiceLocator.locator;

void initializeServiceLocator() {
// Register Services
  locator.registerLazySingleton<LoginServiceMemoryImpl>(() => LoginServiceMemoryImpl());
  // locator.registerLazySingleton<CounterService>(() => CounterService_Rest());

// Register Viewmodels
  locator.registerLazySingleton<HomeViewModel>(() => HomeViewModel());
  
  // Registration
  locator.registerLazySingleton<RegisterServiceMemoryImpl>(() => RegisterServiceMemoryImpl());


} */

final locator = GetIt.instance;

void initializeServiceLocator() {
  // Register Services

  locator.registerLazySingleton<LoginService>(() => LoginServiceMemoryImpl());
  locator.registerLazySingleton<LoginServiceMemoryImpl>(
      () => LoginServiceMemoryImpl());
  // locator.registerLazySingleton<CounterService>(() => CounterService_Rest());

// Register Viewmodels
  locator.registerLazySingleton<HomeViewModel>(() => HomeViewModel());

  // Registration
  locator.registerLazySingleton<RegisterServiceMemoryImpl>(
      () => RegisterServiceMemoryImpl());

  // Register Services

  locator.registerLazySingleton<UserService>(() => UserServiceMemoryImpl());
  locator
      .registerLazySingleton<BookingService>(() => BookingServiceImplMemory());
  locator.registerLazySingleton<ScheduleService>(
      () => ScheduleService(schedules: []));
  locator.registerLazySingleton<HistoryService>(
      () => HistoryService(histories: []));

  // Create a User object (you may need to replace this with your actual user data)
  User user = User(
      name: 'Zulfadhly',
      role: 'Barber',
      starRating: 5,
      description: 'Hairstylist');

  // Register Viewmodels
  locator.registerLazySingleton<BookingBarberViewmodel>(
      () => BookingBarberViewmodel());
  locator.registerLazySingleton<BookingViewModel>(
      () => BookingViewModel(user: user));
  locator.registerLazySingleton<ScheduleViewModel>(() => ScheduleViewModel());
  locator.registerFactory(() => HistoryViewModel(
        historyService: locator<HistoryService>(),
      ));

        // Haziq
  locator.registerLazySingleton<UserServiceCustomer>(() => UserServiceMemoryImplCustomer());
  locator.registerLazySingleton<BookingServiceCustomer>(() => BookingServiceCustomer());
  locator.registerLazySingleton<BookingViewModelCustomer>(() => BookingViewModelCustomer());
  locator.registerLazySingleton<BookingDetailViewModelCustomer>(
      () => BookingDetailViewModelCustomer());
}
