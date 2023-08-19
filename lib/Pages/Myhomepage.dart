import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task3ahmed_faisal/Pages/Cart_page.dart';
import 'package:task3ahmed_faisal/Pages/Listing.dart';
import 'package:task3ahmed_faisal/Pages/Counter_page.dart';
import 'package:task3ahmed_faisal/Pages/Profile.dart';

class Myhomepage extends StatefulWidget {
  const Myhomepage({super.key});

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  int currentIndex = 0;

  void getPage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List<Widget> screens = [
    const ListScreen(),
    const counter(),
    const Cartpage(),
    const Profilepage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7F8),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          getPage(index);
        },
        items: const [
          BottomNavigationBarItem(icon:
          Icon(Icons.home_filled),
              label: 'home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_outlined),
            label: 'counter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_sharp),
            label: 'Profile',
          ),
        ],
        backgroundColor: const Color(0xff422B2B),
        selectedItemColor: const Color(0xffFFFFFF),
        selectedLabelStyle: TextStyle(
          fontSize: 15,
          fontFamily: GoogleFonts.openSans().fontFamily,
          color: const Color(0xffFFFFFF),
        ),
      ),
    );
  }
}
