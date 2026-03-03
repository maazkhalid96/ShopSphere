import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopsphere/screens/login_signup/signup.dart';
import 'package:shopsphere/services/auth_services.dart';
import 'package:shopsphere/widgets/custom_button.dart';
import 'package:shopsphere/widgets/custom_text_fields.dart';
import 'package:shopsphere/widgets/social_sign_in.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // ------------------ Controllers -----------------
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
                "Welcome Back!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Login to continue\nshopping",
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
                      text: "Login in",
                      onTap: () {
                        auth.loginIn(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forgot Password?",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey.shade400,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Or continue with",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.grey.shade400,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 15),
                    SocialSignIn(
                      text: "Continue with Google",
                      icon: Icons.g_mobiledata_sharp,
                      ontap: () {},
                    ),
                    SizedBox(height: 12),
                    SocialSignIn(
                      text: "Continue with Facebook",
                      iconColor: Colors.blue,
                      icon: Icons.facebook,
                      ontap: () {},
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account?",
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Get.to(Signup());
                          },
                          child: Text(
                            "Sign Up",
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
