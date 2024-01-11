// booking_body.dart


import 'package:flutter/material.dart';
import 'package:my_app/Customer_Booking/models/booking.dart';
import 'package:my_app/Customer_Booking/services/booking/booking_service.dart';
import 'package:my_app/Customer_Booking/views/booking/booking_viewmodel.dart';
import 'package:my_app/Customer_Booking/views/bookingdetail/bookingdetail_body.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingBody extends StatefulWidget {
  const BookingBody({Key? key, required String serviceType}) : super(key: key);

  @override
  _BookingBodyState createState() => _BookingBodyState();
}

class _BookingBodyState extends State<BookingBody> {
  String selectedDay = "Mon"; // Example selected day
  DateTime _selectedValue = DateTime.now();
  String selectedTime = "";

  final BookingServiceCustomer _bookingService = BookingServiceCustomer(); // Create an instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Booking',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 16),
            _buildUserInfo(),
            const SizedBox(height: 16),
            _buildDateSelection(),
            const SizedBox(height: 16),
            _buildTimeSelection(),
            const SizedBox(height: 16),
            _buildContinueButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Container(
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
                Text('Please choose your desired date and time.'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateSelection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Choose Your Date',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        TableCalendar(
          focusedDay: DateTime.now(),
          firstDay: DateTime.now().subtract(const Duration(days: 365)),
          lastDay: DateTime.now().add(const Duration(days: 365)),
          calendarFormat: CalendarFormat.week,
          onFormatChanged: (format) {},
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
          ),
          startingDayOfWeek: StartingDayOfWeek.monday,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedValue, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedValue = selectedDay;
            });
          },
        ),
      ],
    );
  }

  Widget _buildTimeSelection() {
    return Column(
      children: [
        const Text(
          'Choose Your Time',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTimeButton('10:00 AM'),
            _buildTimeButton('11:30 AM'),
            _buildTimeButton('2:00 PM'),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTimeButton('3:30 PM'),
            _buildTimeButton('5:00 PM'),
            _buildTimeButton('6:30 PM'),
          ],
        ),
      ],
    );
  }

  Widget _buildTimeButton(String time) {
    List<String> bookedSlots = _bookingService.getBookedSlots(_selectedValue);
    bool isAvailable = _bookingService.isSlotAvailable(time, bookedSlots);

    return ElevatedButton(
      onPressed: isAvailable
          ? () {
              setState(() {
                selectedTime = time;
              });
            }
          : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedTime == time ? Colors.blue : null,
      ),
      child: Text(time),
    );
  }

  Widget _buildContinueButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          if (selectedTime.isNotEmpty) {
            BookingViewModelCustomer viewModel = BookingViewModelCustomer();
            Booking newBooking = viewModel.createBooking(
              'Amirul Haziq',
              'Haircut',
              selectedTime,
              selectedDate: _selectedValue,
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookingDetailBody(
                  booking: newBooking,
                ),
              ),
            );
          } else {
            _showTimeSlotErrorDialog();
          }
        },
        child: const Text('Continue'),
      ),
    );
  }

  void _showTimeSlotErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Please choose your time slot.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
