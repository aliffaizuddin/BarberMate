import 'package:flutter/material.dart';
import 'package:my_app/Configs/constants.dart';

class BookingDetailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const BookingDetailAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text(Constants.appTitle),
    );
  }
}
