// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:my_app/Login/Models/loginModel.dart';
import '../../View_Model/Login/loginViewModel.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginModel model = LoginModel("", "","");
    final LoginViewModel viewModel = LoginViewModel(model);

    return FractionallySizedBox(
      heightFactor: 0.75,
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
                'Login',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Add your login form fields and logic here
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Username'),
                    onChanged: (value) => model.username = value,
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    onChanged: (value) => model.password = value,
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () async {
                      await viewModel.loginUser(context);
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
