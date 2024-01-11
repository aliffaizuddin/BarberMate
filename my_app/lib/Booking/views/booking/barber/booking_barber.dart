import 'package:flutter/material.dart';
import 'package:map_mvvm/view/view.dart';
import 'package:my_app/Booking/views/booking/barber/booking_barber_viewmodel.dart';


class BookingBarber extends StatelessWidget {
  const BookingBarber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<BookingBarberViewmodel>(
      builder: (context, viewmodel) {
        if (viewmodel.barber != null) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.person, size: 40),
                const SizedBox(width: 16),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        viewmodel.barber?.name ?? 'Unknown',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(viewmodel.barber?.role ?? ''),
                      Row(
                        children: List.generate(
                          5,
                          (index) => const Icon(Icons.star,
                              color: Colors.yellow, size: 20),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        viewmodel.barber?.description ?? '',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          // Handle the case when viewmodel or barber is null
          return Container(
            child: const Text('Barber information not available'),
          );
        }
      },
    );
  }
}
