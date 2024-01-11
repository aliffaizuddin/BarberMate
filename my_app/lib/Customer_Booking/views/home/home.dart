import 'package:flutter/material.dart';
import 'home_app_bar.dart';
import 'home_body.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: HomeBody(),
    );
  }
}
