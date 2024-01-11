import 'package:flutter/material.dart';
import 'package:my_app/Login/Models/RegistrationModel.dart';
import 'package:my_app/Login/View_Model/Register/RegistrationViewModel.dart';


class RegistrationModal extends StatelessWidget {
  const RegistrationModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegistrationModel model = RegistrationModel("", "", "", "", "", "");
    final RegistrationViewModel viewModel = RegistrationViewModel();

    return FractionallySizedBox(
      heightFactor: 0.9,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_downward),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the modal
                },
              ),
              centerTitle: true,
              title: const Text(
                'Register',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Expanded(
              child: Form(
  key: GlobalKey<FormState>(), // Add a global key for the form
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TextFormField(
        decoration: const InputDecoration(labelText: 'Full Name'),
        onChanged: (value) => model.fullName = value,
      ),
      const SizedBox(height: 16.0),
      TextFormField(
        decoration: const InputDecoration(labelText: 'ID/Passport Card'),
        onChanged: (value) => model.idOrPassportCard = value,
      ),
      const SizedBox(height: 16.0),
      TextFormField(
        decoration: const InputDecoration(labelText: 'Phone Number'),
        keyboardType: TextInputType.phone,
        onChanged: (value) => model.phoneNumber = value,
      ),
      const SizedBox(height: 16.0),
      TextFormField(
        decoration: const InputDecoration(labelText: 'Email'),
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) => model.email = value,
      ),
      const SizedBox(height: 16.0),
      TextFormField(
        decoration: const InputDecoration(labelText: 'Password'),
        obscureText: true,
        onChanged: (value) => model.password = value,
      ),
      const SizedBox(height: 16.0),
      TextFormField(
        decoration: const InputDecoration(labelText: 'Confirm Password'),
        obscureText: true,
        onChanged: (value) => model.confirmPassword = value,
      ),
      const SizedBox(height: 16.0),
      ElevatedButton(
        onPressed: () async {
          await viewModel.addNewUSer(model);
        },
        child: const Text('Register'),
      ),
    ],
  ),
),

            ),
          ],
        ),
      ),
    );
  }


  bool isValidEmail(String email) {
    // You can add a more sophisticated email validation logic here
    return RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$').hasMatch(email);
  }
}


