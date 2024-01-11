import 'package:flutter/material.dart';
import '../../schedule/schedule_page.dart';
import 'booking_customer_app_bar.dart';

class BookingCustomerPage extends StatefulWidget {
  final List<Map<String, dynamic>> customers;

  const BookingCustomerPage({Key? key, required this.customers});

  @override
  _BookingCustomerPageState createState() => _BookingCustomerPageState();
}

class _BookingCustomerPageState extends State<BookingCustomerPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController haircutTypeController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BookingCustomerAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.customers.length,
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
                                widget.customers[index]['name'],
                                style: const TextStyle(),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Haircut Type',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(widget.customers[index]['haircutType']),
                              const SizedBox(height: 8),
                              const Text(
                                'Time',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(widget.customers[index]['time']),
                              const SizedBox(height: 8),
                              const Text(
                                'Price',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('RM${widget.customers[index]['price']}'),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showAddDialog(context);
                  },
                  child: const Text('Add Customer'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _removeCustomer();
                  },
                  child: const Text('Remove Customer'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SchedulePage(customers: widget.customers),
                    ),
                  );
                },
                child: const Text('Continue to Schedule'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Customer'),
          content: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: haircutTypeController,
                decoration: const InputDecoration(labelText: 'Haircut Type'),
              ),
              _buildTimePicker(),
              const Text('Price: RM15.0'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String selectedTime = timeController.text;
                String formattedTime = _formatTime(selectedTime);
                setState(() {
                  widget.customers.add({
                    'name': nameController.text,
                    'haircutType': haircutTypeController.text,
                    'time': formattedTime,
                    'price': 15.0,
                  });
                });
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _removeCustomer() {
    setState(() {
      if (widget.customers.isNotEmpty) {
        widget.customers.removeLast();
      }
    });
  }

  Widget _buildTimePicker() {
    return TextField(
      controller: timeController,
      decoration: const InputDecoration(labelText: 'Time'),
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );

        if (pickedTime != null) {
          timeController.text =
              '${pickedTime.hour}:${pickedTime.minute} ${pickedTime.period == DayPeriod.am ? 'AM' : 'PM'}';
        }
      },
    );
  }

  String _formatTime(String time) {
    TimeOfDay parsedTime = TimeOfDay(
      hour: int.parse(time.split(':')[0]),
      minute: int.parse(time.split(':')[1].split(' ')[0]),
    );

    final formattedTime = MaterialLocalizations.of(context)
        .formatTimeOfDay(parsedTime, alwaysUse24HourFormat: false);

    return formattedTime;
  }
}
