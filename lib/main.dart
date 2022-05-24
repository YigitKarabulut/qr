import 'package:flutter/material.dart';
import 'package:qr_code/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Scanner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xff2aa6cd),
        backgroundColor: Colors.white,


      ),
      home:const HomePage(),
    );
  }
}


