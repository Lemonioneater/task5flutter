
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Data/Products source.dart';
import '../Data/displayer/Cart_displayer.dart';
import '../Data/displayer/Product_display.dart';
import '../main.dart';
import 'Counter_page.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffF6F7F8),
          foregroundColor: const Color(0xff252837),
          actions: [
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 0,
                top: 15,
                bottom: 0,
              ),
              child:  Text(
                'Cart total : ${y.toString()}',
                style: TextStyle(
                    fontFamily: GoogleFonts.openSans().fontFamily,
                    fontSize: 20,
                    color: const Color(0xff252837),
                    fontWeight: FontWeight.w900),
              ),
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
        backgroundColor: const Color(0xffF6F7F8),
        body: DataSource.isLoading
            ? const Center(child: Text('Add items to cart to be displayed',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
          textAlign: TextAlign.center,
        ))
            : SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: ListView.builder(
                itemCount: DataSource.products.length,
                itemBuilder: (context, index) {
                  if( DataSource.products[index].count == 0) {
                    return SizedBox();
                  }
                  return Cartdisp(
                    product2: DataSource.products[index],
                  );
                },
                ),
              ),
        ),
        );
  }
}
