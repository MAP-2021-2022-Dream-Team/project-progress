import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pharmamed/screens/login/login_viewModel.dart';

abstract class LoginService {
  static Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: LoginViewModel.emailController.text.trim(),
          password: LoginViewModel.passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      String error = e.message.toString();
      Fluttertoast.showToast(
          msg: error,
          gravity: ToastGravity.CENTER,
          fontSize: 25,
          timeInSecForIosWeb: 80);
    }
  }
}
