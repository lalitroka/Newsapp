import 'package:flutter/material.dart';
import 'package:practise/home/page/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phoneNumberController =
      TextEditingController(text: "9899999999");
  final TextEditingController passwordController =
      TextEditingController(text: "Test@12345");
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Tour',
          style: TextStyle(fontFamily: 'cursive'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              TextFormField(
                controller: phoneNumberController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Phone Number';
                  }
                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Should only contain digits';
                  } else if (!value.startsWith('97') &&
                      !value.startsWith('98')) {
                    return 'Phone number should start with 97 or 98';
                  } else if (value.length != 10) {
                    return 'digit should be only 10 number';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Enter your Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.blueGrey,
                    ),
                  ),
                  focusColor: Colors.amberAccent,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (!RegExp(r'^[A-Z]').hasMatch(value)) {
                    return "Should start with a capital letter";
                  } else if (!RegExp(r'[a-z]').hasMatch(value)) {
                    return "Should contain at least one small letter";
                  } else if (!RegExp(r'^(?=.*?[0-9])').hasMatch(value)) {
                    return "Should contain at least one digit";
                  } else if (!RegExp(r'^(?=.*?[!@#\$&*~])').hasMatch(value)) {
                    return "Should contain at least one special character";
                  } else if (value.length <= 8) {
                    return "password should be at least 8 character";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Enter your Password ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.blueGrey,
                    ),
                  ),
                  focusColor: Colors.amberAccent,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    Navigator.of(context).pushReplacementNamed(
                      '/home',
                      // arguments: phoneNumberController.text,
                    );
                  }
                },
                child: const Text('Sign In'),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const Homepage(),
                        ),
                      );
                    },
                    child: const Text(
                      ' Register ',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
