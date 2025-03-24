import 'package:project3/constants/constants.dart';
import 'package:project3/screens/authentication/forgotpassword.dart';
import 'package:project3/screens/authentication/signup.dart';

import 'package:flutter/material.dart';
import 'package:project3/screens/home/home_widget/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void _login() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: background,
      body: SafeArea(
        child: Stack(
          children: [
            // الخلفية كصورة ممتدة
            Positioned.fill(
              child: Image.asset(
                "assets/images/background.jpg",
                fit: BoxFit.cover, // لجعل الصورة تغطي الشاشة بالكامل
              ),
            ),
            Center(
              child: Container(
                width: width * 0.8,
                height: height * 0.5,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9), // شفافية لتمييز المحتوى
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 2,
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Form(
                  key: _loginKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 16),
                        Text(
                          "Login",
                          style: TextStyle(
                            fontSize: fontlg,
                            color: const Color.fromARGB(255, 121, 177, 90),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _email,
                          decoration: InputDecoration(
                            label: Text("E-mail",
                                style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 121, 177, 90))),
                            prefixIcon: Icon(Icons.email,
                                color: const Color.fromARGB(255, 121, 177, 90)),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _password,
                          obscureText: true,
                          decoration: InputDecoration(
                            label: Text("Password",
                                style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 121, 177, 90))),
                            prefixIcon: Icon(Icons.lock,
                                color: const Color.fromARGB(255, 121, 177, 90)),
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Forgotpassword()),
                                );
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 121, 177, 90),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Container(
                          width: width * 0.7,
                          height: height * 0.05,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 121, 177, 90),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextButton(
                            onPressed: _login,
                            child: Text(
                              "Login",
                              style: TextStyle(fontSize: 18, color: background),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: height * 0.1,
              left: width * 0.25,
              child: Row(
                children: [
                  Text(
                    "No account yet?",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 148, 148, 148)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    child: Text(
                      " Create one",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 241, 246, 238),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
