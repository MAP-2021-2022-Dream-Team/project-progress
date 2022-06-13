import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:pharmamed/screens/register/register_viewModel.dart';

@lazySingleton
class RegisterService {
  Future signUp(String feedback) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: RegisterViewModel.emailController.text.trim(),
              password: RegisterViewModel.passwordController.text.trim())
          .then((value) async {
        User user = FirebaseAuth.instance.currentUser!;

        await FirebaseFirestore.instance.collection("user").doc(user.uid).set({
          "fname": RegisterViewModel.nameController.text.trim(),
          "uname": RegisterViewModel.usernameController.text.trim(),
          "phone": RegisterViewModel.phoneNumController.text.trim(),
          "role": "buyer",
        });
      });

      feedback = "Successful SignUp";
    } on FirebaseAuthException catch (e) {
      feedback = e.toString();
    }
  }
}
