import 'package:flutter/material.dart';
import '../history/history_page.dart';

class SchedulePage extends StatefulWidget {
  final List<Map<String, dynamic>> customers;

  const SchedulePage({Key? key, required this.customers}) : super(key: key);

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  List<Map<String, dynamic>> doneCustomers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('BarberMate'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HistoryPage(customers: doneCustomers),
                ),
              );
            },
            icon: const Icon(Icons.history),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Schedule Today',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              // Display customer info containers
              for (var customer in widget.customers)
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.person, size: 40),
                              const SizedBox(width: 16),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Name',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      customer['name'],
                                      style: const TextStyle(),
                                    ),
                                    const SizedBox(height: 8),
                                    const Text(
                                      'Haircut Type',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(customer['haircutType']),
                                    const SizedBox(height: 8),
                                    const Text(
                                      'Time',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(customer['time']),
                                    const SizedBox(height: 8),
                                    const Text(
                                      'Price',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('RM${customer['price']}'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: ElevatedButton(
                          onPressed: () {
                            markCustomerAsDone(customer);
                          },
                          child: const Text('Done'),
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

  void markCustomerAsDone(Map<String, dynamic> customer) {
    setState(() {
      widget.customers.remove(customer);
      doneCustomers.add(customer);
    });
  }
}
