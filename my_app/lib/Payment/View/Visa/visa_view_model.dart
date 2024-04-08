import 'package:flutter/material.dart';
import 'package:map_mvvm/view/viewmodel.dart';
import 'package:my_app/Customer_Booking/views/home/home_body.dart';

class VisaViewModel extends Viewmodel {
  Future<void> showPaymentSuccessDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Payment Successful!'),
          content: const Text('Your payment was successful.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();

                // Navigate to the BookingPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CustBookingBody()),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
