import 'package:flutter/material.dart';
import 'package:task3ahmed_faisal/Pages/Counter_page.dart';
import 'package:task3ahmed_faisal/Pages/Listing.dart';
import 'package:task3ahmed_faisal/Pages/Myhomepage.dart';
int y = 0;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Myhomepage(),
    );
  }
}
