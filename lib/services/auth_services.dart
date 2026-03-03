import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/route_manager.dart';
import 'package:shopsphere/screens/home/home.dart';
import 'package:shopsphere/screens/login_signup/login.dart';
import 'package:shopsphere/widgets/custom_snackbar.dart';

class AuthServices {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future signUp(String email, String password, String name) async {
    if (email.isEmpty || password.isEmpty || name.isEmpty) {
      CustomSnackbar.showError("All fields are required");
      return;
    }
    if (!email.endsWith("@gmail.com")) {
      CustomSnackbar.showError("Please enter a valid Gmail address.");
      return;
    }
    if (password.length < 6) {
      CustomSnackbar.showError("Password must be at least 6 characters long");
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      CustomSnackbar.showSuccess("Account created successfully!");
      Get.off(Login());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        CustomSnackbar.showError("The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        CustomSnackbar.showError('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future loginIn(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      CustomSnackbar.showError("All fields are required");
      return;
    }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      CustomSnackbar.showSuccess("Login successful");
      Get.to(Home());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        CustomSnackbar.showError('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        CustomSnackbar.showError("Wrong password provided for that user.");
      } else {
        CustomSnackbar.showError(e.message ?? "An error occurred");
      }
    } catch (e) {
      CustomSnackbar.showError("Something went wrong: $e");
    }
  }
}
