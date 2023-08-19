

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task3ahmed_faisal/Pages/Myhomepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController Names = TextEditingController();
  TextEditingController Phone = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> Signup({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) async {
    if (formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: email,
          password: password,
        )
            .then((value) {
          if (value.user != null) {
            UploadData(
                email: email,
                password: password,
                phone: phone,
                name: name,
                uid: value.user!.uid).then((value) {
                  if(value)
                    {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context){
                            return const Myhomepage();
                          }
                          )
                      );
                    }
            });
          }
        });
      } catch (error) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(error.toString())));
      }
    }
  }

  Future<bool> UploadData({
    required String email,
    required String password,
    required String phone,
    required String name,
    required String uid,
  }) async {
    try {
      FirebaseFirestore.instance.collection('user').doc(uid).set({
        'name': name,
        'email': email,
        'phone': phone,
        'uid': uid,
        'password': password,
      }, SetOptions(merge: true));
      return true;
    } catch (erorr) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(erorr.toString())));
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7F8),
      appBar: AppBar(
        backgroundColor: const Color(0xffF6F7F8),
        actions: [
          const Expanded(child: SizedBox()),
          Center(
            child: Text(
              'Signup',
              style: TextStyle(
                fontSize: 18,
                color: const Color(0xff252837),
                fontWeight: FontWeight.w700,
                fontFamily: GoogleFonts.roboto().fontFamily,
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 75,
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
                      Expanded(
                        child: SizedBox(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Full name',
                              hintStyle: TextStyle(
                                  color: const Color(0xffC1C1C1),
                                  fontSize: 18,
                                  fontFamily: GoogleFonts.roboto().fontFamily,
                                  fontWeight: FontWeight.w400),
                            ),
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: GoogleFonts.roboto().fontFamily,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xffFFFFFF)),
                            controller: Names,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Name must not be empty';
                              }
                              return null;
                            },
                            autovalidateMode: AutovalidateMode.always,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 75,
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
                      Expanded(
                        child: SizedBox(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                  color: const Color(0xffC1C1C1),
                                  fontSize: 18,
                                  fontFamily: GoogleFonts.roboto().fontFamily,
                                  fontWeight: FontWeight.w400),
                            ),
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: GoogleFonts.roboto().fontFamily,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xffFFFFFF)),
                            controller: Email,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email must not be empty';
                              }
                              return null;
                            },
                            autovalidateMode: AutovalidateMode.always,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 75,
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
                      Expanded(
                        child: SizedBox(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                  color: const Color(0xffC1C1C1),
                                  fontSize: 18,
                                  fontFamily: GoogleFonts.roboto().fontFamily,
                                  fontWeight: FontWeight.w400),
                            ),
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: GoogleFonts.roboto().fontFamily,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xffFFFFFF)),
                            controller: Password,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password must not be empty';
                              } else if (value.length < 9) {
                                return 'Password is min 9 chars';
                              }
                              return null;
                            },
                            autovalidateMode: AutovalidateMode.always,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 75,
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
                      Expanded(
                        child: SizedBox(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Phone',
                              hintStyle: TextStyle(
                                  color: const Color(0xffC1C1C1),
                                  fontSize: 18,
                                  fontFamily: GoogleFonts.roboto().fontFamily,
                                  fontWeight: FontWeight.w400),
                            ),
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: GoogleFonts.roboto().fontFamily,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xffFFFFFF)),
                            controller: Phone,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Number must not be empty';
                              } else if (value.length != 11) {
                                return 'Number is 11 chars';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            autovalidateMode: AutovalidateMode.always,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () async {
                  await Signup(
                    email : Email.text,
                     password : Password.text,
                     name : Names.text,
                      phone : Phone.text,
                  );
                },
                child: Center(
                  child: Container(
                    width: 250,
                    decoration: BoxDecoration(
                      color: const Color(0xff422B2B),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                            color: const Color(0xffFFFFFF),
                            fontSize: 25,
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
