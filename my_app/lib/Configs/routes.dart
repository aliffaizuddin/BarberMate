import 'package:flutter/material.dart';
import 'package:my_app/Booking/views/booking/booking_page.dart';
import 'package:my_app/Booking/views/history/history_page.dart';
import 'package:my_app/Booking/views/schedule/schedule_page.dart';
import 'package:my_app/Customer_Booking/models/home.dart';

class Routes {
  static const String booking = '/booking';
  static const String history = '/history';
  static const String schedule = '/schedule';
  static const String home = '/home';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case booking:
        return MaterialPageRoute(builder: (_) => const BookingPage());
      case history:
        // Handle arguments if needed
        return MaterialPageRoute(
            builder: (_) => const HistoryPage(customers: []));
      case schedule:
        // Handle arguments if needed
        return MaterialPageRoute(
            builder: (_) => const SchedulePage(customers: []));
      // case home:
      //   return MaterialPageRoute(builder: (_) => Home()); 
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Page not found'),
        ),
      );
    });
  }
}