// viewmodels/booking_detail_viewmodel.dart
// import 'package:flutter/material.dart';
import 'package:my_app/Customer_Booking/models/bookingdetail.dart';
import 'package:map_mvvm/view/viewmodel.dart';
import 'package:my_app/Customer_Booking/services/bookingdetail/bookingdetail_service.dart';

class BookingDetailViewModelCustomer extends Viewmodel {
  late List<BookingDetail> _services;
  late List<BookingDetail> _bookingDetails;

  List<BookingDetail> get services => _services;
  List<BookingDetail> get bookingDetails => _bookingDetails;

  Future<void> fetchServices() async {
    turnBusy();
    try {
      _services = await BookingDetailService.fetchServices();
    } finally {
      turnIdle();
    }
  }

  Future<void> fetchBookingDetails(DateTime selectedDate) async {
    turnBusy();
    try {
      _bookingDetails =
          await BookingDetailService.fetchBookingDetails(selectedDate);
    } finally {
      turnIdle();
    }
  }

  Future<void> saveBookingToHistory(BookingDetail bookingDetail) async {
    await BookingDetailService.saveBookingToHistory(bookingDetail);
  }
}
