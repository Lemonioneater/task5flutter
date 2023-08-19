import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Data/Datafetch.dart';
import 'Listing.dart';
import 'Login.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  void initState() {
    if (DataSource.profile) {
      Future.delayed(Duration.zero, () async {
        var data = await DataSource.getuserdata();
        setState(() {
          DataSource.userdata = data;
          DataSource.profile = false;
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
              'Profile',
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
      body: DataSource.profile
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    margin: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xff6F6666),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style: TextStyle(
                                color: const Color(0xffC1C1C1),
                                fontSize: 18,
                                fontFamily: GoogleFonts.roboto().fontFamily,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.right,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: SizedBox(
                              child: Text(
                                DataSource.userdata!.name,
                                style:  TextStyle(
                                    fontSize: 25,
                                    fontFamily: GoogleFonts.roboto().fontFamily,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xffFFFFFF)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    margin: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xff6F6666),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Phone',
                            style: TextStyle(
                                color: const Color(0xffC1C1C1),
                                fontSize: 18,
                                fontFamily: GoogleFonts.roboto().fontFamily,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.right,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: SizedBox(
                              child: Text(
                                DataSource.userdata!.phone,
                                style:  TextStyle(
                                    fontSize: 25,
                                    fontFamily: GoogleFonts.roboto().fontFamily,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xffFFFFFF)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    margin: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xff6F6666),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(
                                color: const Color(0xffC1C1C1),
                                fontSize: 18,
                                fontFamily: GoogleFonts.roboto().fontFamily,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.right,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: SizedBox(
                              child: Text(
                                DataSource.userdata!.email,
                                style:  TextStyle(
                                    fontSize: 25,
                                    fontFamily: GoogleFonts.roboto().fontFamily,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xffFFFFFF)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

