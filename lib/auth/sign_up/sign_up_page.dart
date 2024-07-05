import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _countryNameController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Container(
          padding: const EdgeInsets.all(28),
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue[50],
          ),
          child: Form(
            key: _formkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              verticalDirection: VerticalDirection.down,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _phoneNumberController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Phone Number';
                    }
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Should only contain digits';
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
                  height: 5,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: _passwordController,
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
                TextFormField(
                    controller: _userNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter username';
                      } else if (!RegExp(r'^[A-Z]').hasMatch(value)) {
                        return 'should only contain letter';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        labelText: 'Enter your UserName',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(250)),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(250)),
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.blueGrey,
                            )),
                        focusColor: Colors.amberAccent)),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your country Name';
                      } else if (!RegExp(r'^[A-Z]').hasMatch(value)) {
                        return 'should only contain letter';
                      }
                      return null;
                    },
                    controller: _countryNameController,
                    decoration: const InputDecoration(
                        labelText: 'Enter your country name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(250)),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(250)),
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.blueGrey,
                            )),
                        focusColor: Colors.amberAccent)),
                const SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () {
                    if (_formkey.currentState!.validate()) {
                      Navigator.pushNamed(context, '/home',
                       arguments: {
                        'username': _userNameController.text,
                        'countryName': _countryNameController.text,
                      });
                    }
                  },
                  child: const Text('Sign Up'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
