import 'package:flutter/material.dart';

class Confirmation extends StatefulWidget {
  const Confirmation({Key? key}) : super(key: key);

  @override
  State<Confirmation> createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
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

class EmptyPageContent extends StatelessWidget {
  const EmptyPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink(); // Empty widget
  }
}

PageRouteBuilder<dynamic> _buildPageRoute() {
  return PageRouteBuilder(
    opaque: false,
    pageBuilder: (context, animation, secondaryAnimation) {
      return EmptyPageContent(); // Empty content
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
