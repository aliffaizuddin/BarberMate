import 'package:flutter/material.dart';
// import '../dialogs/customer_dialog.dart';

class BookingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BookingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text('BarberMate'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
