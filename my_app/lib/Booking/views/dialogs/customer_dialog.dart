import 'package:flutter/material.dart';

class CustomerDialog extends StatefulWidget {
  const CustomerDialog({Key? key});

  @override
  State<CustomerDialog> createState() => _CustomerDialogState();
}

class _CustomerDialogState extends State<CustomerDialog> {
  TextEditingController nameController = TextEditingController();
  TextEditingController haircutTypeController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  List<Map<String, dynamic>> customers = [
    {
      'name': 'Zulfadhly',
      'haircutType': 'Buzz Cut',
      'time': '10:00 AM',
      'price': 20.0,
    },
  ];

  String _formatTime(String time) {
    // Parse the input time string
    TimeOfDay parsedTime = TimeOfDay(
      hour: int.parse(time.split(':')[0]),
      minute: int.parse(time.split(':')[1].split(' ')[0]),
    );

    // Format the time using the intl package
    final formattedTime = MaterialLocalizations.of(context)
        .formatTimeOfDay(parsedTime, alwaysUse24HourFormat: false);

    return formattedTime;
  }

  // Method to build the time picker widget
  Widget _buildTimePicker() {
    return TextField(
      controller: timeController,
      decoration: const InputDecoration(labelText: 'Time'),
      onTap: () async {
        // Show time picker dialog
        TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );

        // Update the time controller with the selected time
        if (pickedTime != null) {
          timeController.text =
              '${pickedTime.hour}:${pickedTime.minute} ${pickedTime.period == DayPeriod.am ? 'AM' : 'PM'}';
        }
      },
    );
  }

  void show(BuildContext context) {
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
                  customers.add({
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

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
