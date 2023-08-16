

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Data/Datafetch.dart';
import '../Data/displayer/Cart_displayer.dart';
import '../main.dart';
import 'Listing.dart';
import 'Login.dart';


class Cartpage extends StatefulWidget {
  const Cartpage({super.key});


  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {



  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffF6F7F8),
            foregroundColor: const Color(0xff252837),
            actions: [
              IconButton(
                onPressed: () async {
                  await logout().then((value){
                    if(value)
                    {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context){
                            return const loginpage();
                          }
                          )
                      );
                    }
                  });
                }, icon: Icon(Icons.logout),
              ),
              Expanded(child: SizedBox()),
              Center(
                child: Text(
                  'Cart',
                  style: TextStyle(
                      fontFamily: GoogleFonts.openSans().fontFamily,
                      fontSize: 20,
                      color: const Color(0xff252837),
                      fontWeight: FontWeight.w700),
                ),
              ),
              Expanded(child: SizedBox()),
              Visibility(
                visible: false,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.logout),
                ),
              ),
            ],
          ),
          backgroundColor: const Color(0xffF6F7F8),
          body: y == 0
              ? const Center(child: Text('Add items to cart to be displayed',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
            textAlign: TextAlign.center,
          ))
              :
          SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        itemCount: DataSource.products.length,
                        itemBuilder: (context, index) {
                          if( DataSource.products[index].count == 0) {
                            return const SizedBox();
                          }
                          return Cartdisp(
                            product2: DataSource.products[index],
                          );
                        },
                        ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(
                          right: 0,
                          top: 10,
                          bottom: 10,
                          left: 5,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text('Total : \$${y.toString()}',
                              style: const TextStyle(
                                fontSize: 24,
                              ),
                              ),
                            ),
                          ],
                        )
                    ),
                  ],
                ),
                ),
          ),
          ),
    );
  }
}
