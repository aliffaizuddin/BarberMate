// home/home_body.dart


import 'package:flutter/material.dart';
import 'package:my_app/Customer_Booking/models/booking.dart';
import 'package:my_app/Customer_Booking/models/home.dart';
import 'package:my_app/Customer_Booking/services/home/home_service.dart';
import 'package:my_app/Customer_Booking/views/home/home_viewmodel.dart';

class HomeBody extends StatelessWidget {
  final HomeViewModel _viewModel = HomeViewModel();
  final HomeService _homeService = HomeService();

  static const servicesTextStyle = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
  );

  static const boxTextStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<Home> services = _homeService.getAvailableServices();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildUserInfoContainer(),
              _buildSearchTextField(),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'SERVICES',
                  style: servicesTextStyle,
                ),
              ),
              const SizedBox(height: 20),
              _buildServiceRows(context, services),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfoContainer() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
                  'Welcome, Amirul Haziq',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Customer'),
                SizedBox(height: 8),
                Text(
                  'Please choose your service.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchTextField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          border: InputBorder.none,
          icon: Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _buildServiceRows(BuildContext context, List<Home> services) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: services
              .sublist(0, 2)
              .map((service) =>
                  _buildServiceBox(context, service.haircutType, Icons.person))
              .toList(),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: services
              .sublist(2, 4)
              .map((service) =>
                  _buildServiceBox(context, service.haircutType, Icons.person))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildServiceBox(
      BuildContext context, String text, IconData iconData) {
    return GestureDetector(
      onTap: () => _onServiceBoxPressed(context, text),
      child: Container(
        width: 140,
        height: 180,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 80,
              color: Colors.black,
            ),
            const SizedBox(height: 8),
            Text(
              text,
              style: boxTextStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _onServiceBoxPressed(BuildContext context, String service) {
    double defaultPrice = 0.0;
    Home selectedHomeService = Home(
      haircutType: service,
      price: defaultPrice,
    );
    _viewModel.selectService(selectedHomeService);
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => Booking(selectedHomeService),
    //   ),
    // );
  }
}
