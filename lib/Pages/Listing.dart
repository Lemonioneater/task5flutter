
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Data/Datafetch.dart';
import '../Data/displayer/Product_display.dart';
import 'Login.dart';

Future<bool> logout() async{
  try {
    await FirebaseAuth.instance.signOut();
    return true;
  } catch (error) {
    print(error.toString());
    return false;
  }
}


class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}


class _ListScreenState extends State<ListScreen> {


  @override
  void initState() {
    if (DataSource.isLoading) {
      Future.delayed(Duration.zero, () async {
        var data = await DataSource.getData();
        setState(() {
          DataSource.products = data;
          DataSource.isLoading = false;
        });
      });
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffF6F7F8),
          foregroundColor: const Color(0xff252837),
          actions: [
            SizedBox(width: 10,),
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
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 0,
                top: 15,
                bottom: 0,
              ),
              child:  Text(
                'New Products',
                style: TextStyle(
                    fontFamily: GoogleFonts.openSans().fontFamily,
                    fontSize: 20,
                    color: const Color(0xff252837),
                    fontWeight: FontWeight.w700),
              ),
            ),
            const Expanded(child: SizedBox()),
            Container(
              margin:
              const EdgeInsets.only(left: 0, right: 20, top: 15, bottom: 0),
              child:  Text(
                'See all',
                style: TextStyle(
                    fontFamily: GoogleFonts.openSans().fontFamily,
                    fontSize: 18,
                    color: const Color(0xff6F6F6F),
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xffF6F7F8),
        body: DataSource.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: GridView.builder(
                itemCount: DataSource.products.length,
                itemBuilder: (BuildContext context, int index) {
                  return display(
                    product: DataSource.products[index],
                  );
                },
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1/1.7
                ),
              )),
        ));
  }
}
