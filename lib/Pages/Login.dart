
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task3ahmed_faisal/Pages/Myhomepage.dart';
import 'package:task3ahmed_faisal/Pages/Signup.dart';


class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController Name = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> loginpage(
      String email,
      String password,
      ) async {
    if (formKey.currentState!.validate()) {
      try{
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        ).then((value) {
          if( value.user != null)
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
      } catch(error) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error.toString()))
        );
      }
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
              'Login',
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
                height: 100,
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
                          child: TextFormField(
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
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
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
                        'Password',
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
                          child: TextFormField(
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: GoogleFonts.roboto().fontFamily,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xffFFFFFF)),
                            controller: Password,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password must not be empty';
                              } else if (value.length < 8) {
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
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () async {
                  await loginpage(
                    Email.text,
                    Password.text,
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
                        'Login',
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
              SizedBox(height: 10,),
              Text('Or',
                style: TextStyle(
                    color: const Color(0xff422B2B),
                    fontSize: 25,
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    fontWeight: FontWeight.w500),),
              SizedBox(height: 10,),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context){
                        return const Signuppage();
                      }
                      )
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
                        'Sign Up',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
