import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Listing.dart';
import 'Login.dart';


class counter extends StatefulWidget {
  const counter({
    super.key,
  });

  @override
  State<counter> createState() => _counterState();
}

class _counterState extends State<counter> {
  static String opreation = '';
  final TextEditingController in1 = TextEditingController();
  final TextEditingController in2 = TextEditingController();
  double op = 0;
  void getSum() {
    setState(() {
      op = double.parse(in1.text) +
          double.parse(in2.text);
      opreation = 'sum';
    });
  }

  void getProd() {
    setState(() {
      op = double.parse(in1.text)*double.parse(in2.text);
      opreation = 'Prod';
    });
  }

  void getDiv() {
    setState(() {
      op = double.parse(in1.text)/double.parse(in2.text);
      opreation = 'Division';
    });
  }

  void getSub() {
    setState(() {
      op = double.parse(in1.text)-double.parse(in2.text);
      opreation = 'Subtraction';
    });
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              'Counter',
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$opreation = $op',
              style: TextStyle(
                fontSize: 15,
                fontFamily: GoogleFonts.openSans().fontFamily,
                  fontWeight: FontWeight.w600,
                color: const Color(0xff000000)
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color(0xffD9D9D9),
              ),
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: in1,
                keyboardType: TextInputType.number,
                decoration:  InputDecoration(
                  hintText: 'Input 1',
                  hintStyle:  TextStyle(
                      fontSize: 15,
                      fontFamily: GoogleFonts.openSans().fontFamily,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff000000)
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color(0xffD9D9D9),

              ),
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: in2,
                keyboardType: TextInputType.number,
                decoration:  InputDecoration(
                  hintText: 'Input 2',
                  hintStyle:  TextStyle(
                    fontSize: 15,
                    fontFamily: GoogleFonts.openSans().fontFamily,
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w600,
                ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff330707),
                  alignment: Alignment.center,
                  maximumSize: const Size(200, 60),
                  padding: const EdgeInsets.all(10)),
              onPressed: () {
                getSum();
                print(op.toString());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Get sum',
                    style:  TextStyle(
                        fontSize: 15,
                        fontFamily: GoogleFonts.openSans().fontFamily,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xffFFFFFF)
                    ),

                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(Icons.calculate_outlined),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff330707),
                  alignment: Alignment.center,
                  maximumSize: const Size(200, 60),
                  padding: const EdgeInsets.all(10)),
              onPressed: () {
                getSub();
                print(op.toString());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Get sub',
                    style:  TextStyle(
                        fontSize: 15,
                        fontFamily: GoogleFonts.openSans().fontFamily,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xffFFFFFF)
                    ),

                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(Icons.calculate_outlined),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff330707),
                  alignment: Alignment.center,
                  maximumSize: const Size(200, 60),
                  padding: const EdgeInsets.all(10)),
              onPressed: () {
                getProd();
                print(op.toString());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Get Prod',
                    style:  TextStyle(
                        fontSize: 15,
                        fontFamily: GoogleFonts.openSans().fontFamily,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xffFFFFFF)
                    ),

                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(Icons.calculate_outlined),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff330707),
                  alignment: Alignment.center,
                  maximumSize: const Size(200, 60),
                  padding: const EdgeInsets.all(10)),
              onPressed: () {
                getDiv();
                print(op.toString());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Get Div',
                    style:  TextStyle(
                        fontSize: 15,
                        fontFamily: GoogleFonts.openSans().fontFamily,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xffFFFFFF)
                    ),

                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(Icons.calculate_outlined),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
