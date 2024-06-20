import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practise/auth/sign_up/sign_up_page.dart';
import 'package:practise/profile/profile_photopage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
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
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            TextField(
              controller: phoneNumber,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Enter your Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(250)),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(250)),
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.blueGrey,
                    )),
                focusColor: Colors.amberAccent,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: phoneNumber,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Enter your Password ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(250)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(250)),
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
                Navigator.of(context).pushNamed(
                  '/home',
                  // arguments: 'i am from login page',
                );

                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => const Homepage()));
              },
              child: const Text('signIn'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an acount"),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Register(),
                      ),
                    );
                  },
                  child: const Text(
                    ' register ',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Photopage())
                        );
                  },
                  child: const Text('button'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
