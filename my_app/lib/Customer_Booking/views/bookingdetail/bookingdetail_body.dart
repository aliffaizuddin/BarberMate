// booking_detail_body.dart

import 'package:flutter/material.dart';
import 'package:my_app/Customer_Booking/models/booking.dart';
import 'package:my_app/Customer_Booking/views/confirmation/confirmation_page.dart';
import '../../models/bookingdetail.dart';
import '../../services/bookingdetail/bookingdetail_service.dart';

class BookingDetailBody extends StatelessWidget {
  const BookingDetailBody({super.key, required this.booking});

  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('BarberMate'), // Change the title accordingly
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Existing profile container
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.person, size: 40),
                    SizedBox(width: 16),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Amirul Haziq',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('Customer'),
                          Text(
                            'Please choose your desired date and time.',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // New container for additional booking details
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Booking Details',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    Text('Booking ID: ${booking.id}'),
                    Text('Name: ${booking.name}'),
                    Text('Services: ${booking.haircutType}'),
                    Text(
                      'Date: ${booking.time.length >= 10 ? booking.time.substring(0, 10) : booking.time}',
                    ), // Extract date part
                    Text(
                      'Time: ${booking.time.length >= 16 ? booking.time.substring(11, 16) : booking.time}',
                    ), // Extract time part
                    Text('Price: RM${booking.price.toStringAsFixed(2)}'),
                    const SizedBox(height: 16),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          BookingDetailService.saveBookingToHistory(
                            BookingDetail(
                              id: booking.id, // Use the booking ID
                              name: booking.name,
                              haircutType: booking.haircutType,
                              time: booking.time,
                              price: booking.price,
                            ),
                          );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Confirmation(),
                            ),
                          );
                        },
                        child: const Text('Confirm Booking'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
