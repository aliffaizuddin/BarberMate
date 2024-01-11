import 'package:flutter/material.dart';
import 'barber/booking_app_bar.dart';
import 'package:table_calendar/table_calendar.dart';
import '../schedule/schedule_page.dart';
import 'barber/booking_barber.dart';
import 'customer/booking_customer_page.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key});

  @override
  // ignore: library_private_types_in_public_api
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  String selectedDay = "Mon"; // Example selected day
  DateTime _selectedValue = DateTime.now();

  List<Map<String, dynamic>> customers = [
    {
      'name': 'Zulfadhly',
      'haircutType': 'Buzz Cut',
      'time': '10:00 AM',
      'price': 20.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BookingAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Booking',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 16),
            const BookingBarber(),
            const SizedBox(height: 16),
            const Text(
              'Choose Your Time',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: customers.length,
                itemBuilder: (context, index) {
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
                              const Text(
                                'Name',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                customers[index]['name'],
                                style: const TextStyle(),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Haircut Type',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(customers[index]['haircutType']),
                              const SizedBox(height: 8),
                              const Text(
                                'Time',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(customers[index]['time']),
                              const SizedBox(height: 8),
                              const Text(
                                'Price',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('RM${customers[index]['price']}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceAround, // Adjusted alignment
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BookingCustomerPage(customers: customers),
                      ),
                    );
                  },
                  child: const Text('Manage Customers'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SchedulePage(customers: customers),
                      ),
                    );
                  },
                  child: const Text('Continue to Schedule'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
