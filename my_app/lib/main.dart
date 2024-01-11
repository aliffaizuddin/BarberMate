import 'package:flutter/material.dart';
import 'package:my_app/Configs/service_locator.dart';
import 'app.dart';

void main() {
  initializeServiceLocator();
  runApp(const MyApp());
}

// call initialize service locator
