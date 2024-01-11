import 'package:flutter/material.dart';

class BookingCustomerAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const BookingCustomerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text('Manage Customers'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
