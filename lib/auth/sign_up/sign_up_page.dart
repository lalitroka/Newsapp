import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController countryName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const  EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Container(
            padding: const  EdgeInsets.all(28),
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue[50],
            ),
            child: Column(
              children: [
                TextField(
                    controller: phoneNumber,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                        labelText: 'Enter your Phone Number',
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
                TextField(
                    controller: password,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                        labelText: 'Enter your password',
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
                TextField(
                    controller: userName,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                TextField(
                    controller: countryName,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                        labelText: 'Enter your Phone Number',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
