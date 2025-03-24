import 'package:project3/constants/constants.dart';
import 'package:project3/screens/authentication/login.dart';
import 'package:flutter/material.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  final _forgotPassword = GlobalKey<FormState>();
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
            // إضافة صورة خلفية ممتدة
            Positioned.fill(
              child: Image.asset(
                "assets/images/background.jpg", // تأكد من وجود الصورة داخل مجلد assets
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Container(
                width: width * 0.8,
                height: height * 0.3,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9), // خلفية شفافة
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
                  key: _forgotPassword,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 16),
                        Text(
                          "FORGOT PASSWORD",
                          style: TextStyle(
                            fontSize: fontlg,
                            color: customGreen,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "Confirm your email and we will send the instructions.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: fontxs, color: Colors.black45),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          decoration: InputDecoration(
                            label: Text("E-mail",
                                style: TextStyle(color: customGreen)),
                            prefixIcon: Icon(Icons.email, color: customGreen),
                          ),
                        ),
                        SizedBox(height: 25),
                        Container(
                          width: width * 0.7,
                          height: height * 0.05,
                          decoration: BoxDecoration(
                            color: customGreen,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "RESET PASSWORD",
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
              left: width * 0.3,
              child: Row(
                children: [
                  Icon(Icons.arrow_back, size: fontmd, color: customGreen),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      " Back to login",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 246, 250, 243),
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
