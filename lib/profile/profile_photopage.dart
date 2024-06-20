import 'package:flutter/material.dart';

class Photopage extends StatefulWidget {
  const Photopage({super.key});

  @override
  State<Photopage> createState() => _PhotopageState();
}

class _PhotopageState extends State<Photopage> {
  @override
  Widget build(BuildContext context) {
    final photodata = ModalRoute.of(context)?.settings.arguments as String;
    return  Scaffold(
      appBar: AppBar(),
      body: Padding(
       padding: const  EdgeInsets.all(20),
       child: SizedBox(
         width: double.infinity,
         height: double.infinity,
         child:Image(image: AssetImage(photodata)),
         
       ),
              ),
    );
  }
}
