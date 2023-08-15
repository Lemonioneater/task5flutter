import 'dart:math';
import 'package:task3ahmed_faisal/Data/Products source.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Product file.dart';

class display extends StatefulWidget {
  final Product product;

  const display({super.key, required this.product});

  @override
  State<display> createState() => _displayState();
}

class _displayState extends State<display> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        width: 250,
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: const Border(
                      left: BorderSide(color: Colors.white, width: 35),
                      right: BorderSide(color: Colors.white, width: 35),
                      top: BorderSide(color: Colors.white, width: 20),
                      bottom: BorderSide(color: Colors.white, width: 20),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.product.thumbnail,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  margin: const EdgeInsets.all(5),
                ),
                const Positioned(
                  top: 10,
                  right: 10,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            Text(
              '${widget.product.title}:',
              style: TextStyle(
                color: const Color(0xff646E77),
                fontWeight: FontWeight.w400,
                fontSize: 12,
                fontFamily: GoogleFonts
                    .openSans()
                    .fontFamily,
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    builder: (BuildContext context) {
                      return Container(
                        child: Center(
                          child: Text('Product description:\n\n${widget.product
                              .description}',
                            style: TextStyle(
                              color: Colors.brown[800],
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.center,
                          ),

                        ),
                      );
                    });
              },
              child: const Icon(Icons.info),
            ),
            const Expanded(child: SizedBox()),
            Text(
              '\$${widget.product.price.toString()}',
              style: TextStyle(
                color: const Color(0xff252837),
                fontWeight: FontWeight.w600,
                fontSize: 16,
                fontFamily: GoogleFonts
                    .openSans()
                    .fontFamily,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      if (widget.product.count <=30) {
                        widget.product.count = widget.product.count + 1;
                      }
                      else {
                        AlertDialog(
                          actions: [
                            Center(
                              child:  Text(
                                ' Max number of this unit reached',
                                style: TextStyle(
                                  color: const Color(0xff252837),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  fontFamily: GoogleFonts
                                      .openSans()
                                      .fontFamily,
                                ),
                              ),
                            )
                          ],
                        );
                      }
                      setState(() {});
                    },
                    child: const Icon(Icons.add),
                  ),
                ),
                SizedBox(
                  width: 50,
                  height: 45,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white70,
                    ),
                    child: Text(
                      '\n${widget.product.count.toString()}',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  width: 45,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (widget.product.count > 0) {
                          widget.product.count = widget.product.count - 1;
                        }
                      });
                    },
                    child: const Icon(Icons.remove),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ));
  }
}
