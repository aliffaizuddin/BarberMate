import 'package:flutter/material.dart';
import 'package:my_app/Customer_Booking/models/home.dart';
import 'package:my_app/Customer_Booking/views/booking/booking_app_bar.dart';
import 'package:my_app/Customer_Booking/views/booking/booking_body.dart';



class Booking extends StatelessWidget {
  const Booking(Home selectedHomeService, {super.key});
 // const Booking({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BookingAppBar(),
      body: BookingBody(
        serviceType: '',
      ),
    );
  }
}
