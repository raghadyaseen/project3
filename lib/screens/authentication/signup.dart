import 'package:project3/constants/constants.dart';
import 'package:project3/screens/authentication/login.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _signupKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  static const customGreen = Color.fromARGB(255, 121, 177, 90);

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
            // إضافة الخلفية كصورة
            Positioned.fill(
              child: Image.asset(
                "assets/images/background.jpg", // تأكد من وضع الصورة داخل مجلد assets
                fit: BoxFit.cover, // لجعل الصورة تغطي الشاشة بالكامل
              ),
            ),
            Center(
              child: Container(
                width: width * 0.8,
                height: height * 0.6,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9), // شفافية للخلفية
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
                  key: _signupKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 16),
                        Text(
                          "Sign UP",
                          style: TextStyle(
                            fontSize: fontlg,
                            color: customGreen,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _name,
                          decoration: InputDecoration(
                            label: Text("Name",
                                style: TextStyle(color: customGreen)),
                            prefixIcon: Icon(Icons.person, color: customGreen),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _phone,
                          decoration: InputDecoration(
                            label: Text("Phone",
                                style: TextStyle(color: customGreen)),
                            prefix: const Text(
                              "+962 ",
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 18),
                            ),
                            prefixIcon: Icon(Icons.phone, color: customGreen),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Phone';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _email,
                          decoration: InputDecoration(
                            label: Text("E-mail",
                                style: TextStyle(color: customGreen)),
                            prefixIcon: Icon(Icons.email, color: customGreen),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your E-mail';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _password,
                          obscureText: true,
                          decoration: InputDecoration(
                            label: Text("Password",
                                style: TextStyle(color: customGreen)),
                            prefixIcon: Icon(Icons.lock, color: customGreen),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 40),
                        Container(
                          width: width * 0.7,
                          height: height * 0.05,
                          decoration: BoxDecoration(
                            color: customGreen,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextButton(
                            onPressed: () {
                              if (_signupKey.currentState!.validate()) {
                                _signupKey.currentState!.save();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        "Form Submitted { ${_name.text}, ${_email.text}, ${_phone.text} }"),
                                  ),
                                );
                              }
                            },
                            child: Text(
                              "Create Account",
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
                    "Already have an account?",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 148, 148, 148)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      " Sign In",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 231, 240, 227),
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
