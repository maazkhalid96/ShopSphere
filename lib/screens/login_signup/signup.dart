import 'package:flutter/material.dart';
import 'package:shopsphere/services/auth_services.dart';
import 'package:shopsphere/widgets/custom_button.dart';
import 'package:shopsphere/widgets/custom_text_fields.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // ------------------ Controllers -----------------
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthServices auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4B39EF), Color(0xFF6C63FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              Image.asset("assets/images/logo.png"),
              Text(
                "Create an account",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Sign up to start\nshopping",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  height: 1.4,
                ),
              ),
              SizedBox(height: 20),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextFields(
                      prefixIcon: Icons.person,
                      hintText: "Enter Name",
                      isPassword: false,
                      controller: nameController,
                    ),
                    SizedBox(height: 20),
                    CustomTextFields(
                      prefixIcon: Icons.email,
                      hintText: "Enter Email",
                      isPassword: false,
                      controller: emailController,
                    ),
                    SizedBox(height: 20),
                    CustomTextFields(
                      prefixIcon: Icons.password,
                      hintText: "Enter Password",
                      isPassword: true,
                      controller: passwordController,
                    ),
                    SizedBox(height: 30),
                    CustomButton(
                      text: "Sign Up",
                      onTap: () {
                        auth.signUp(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                          nameController.text.trim()
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
