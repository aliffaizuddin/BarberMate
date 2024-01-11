// bookingdetail.dart
import 'package:flutter/material.dart';
import 'package:my_app/Customer_Booking/models/booking.dart';
import 'bookingdetail_app_bar.dart';
import 'bookingdetail_body.dart'; // Importing BookingDetailBody from the same directory

class BookingDetail extends StatelessWidget {
  final Booking booking;

  const BookingDetail({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BookingDetailAppBar(),
      body: BookingDetailBody(booking: booking),
    );
  }
}
