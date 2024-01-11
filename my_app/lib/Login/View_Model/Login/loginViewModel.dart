import 'dart:async';
import 'package:flutter/material.dart';
import 'package:map_mvvm/view/viewmodel.dart';
import 'package:my_app/Booking/views/booking/booking_page.dart';
import 'package:my_app/Configs/service_locator.dart';
import 'package:my_app/Login/Models/loginModel.dart';
import 'package:my_app/Login/Services/Login/LoginService.dart';
import 'package:my_app/User_Profile/views/Home/home_body.dart';

class LoginViewModel extends Viewmodel {
  final LoginModel _model;
  LoginViewModel(this._model);
  final List<LoginModel> _login = [];
  final LoginService _loginServices = locator();
  List<LoginModel> get login => _login;
  int get count => _login.length;

  Future<void> loginUser(BuildContext context) async {
    // Add your login logic here using _model.username and _model.password
    // For simplicity, let's just print the username and password
    print('Username: ${_model.username}');
    print('Password: ${_model.password}');

    // Perform login verification logic
    bool loginSuccessful = await _performLoginVerification();

    if (loginSuccessful) {
      // If login is successful, navigate to the BookingPage
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop(); // Close the modal
      String userType = await _getUserType();
      if (userType == 'barber' ) {
        // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BookingPage()),
      );
      }
      else if (userType == 'customer' ) {
        // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeBody()),
      );
      }
    } else {
      // Handle login failure
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Login Failed'),
            content:
                const Text('Please enter the correct username or password.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<bool> _performLoginVerification() async {
    try {
      final userNameVerification =
          await _loginServices.getUserByUsername(_model.username);
      final passwordVerification =
          await _loginServices.getUserByPassword(_model.password);

      // Additional verification logic can be added here if needed
      // For example, compare the retrieved username and password with the entered ones
      return true;
    } catch (e) {
      // Handle the StateError, log it, or perform other actions
      print("StateError: $e");
      return false; // Or return another default value
    }
  }

  Future<String> _getUserType() async {
    final userType = await _loginServices.getUserByUsername(_model.username);
    return userType.type;
  }
}
