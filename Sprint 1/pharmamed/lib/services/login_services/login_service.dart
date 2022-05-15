import 'package:firebase_auth/firebase_auth.dart';
import 'package:pharmamed/screens/login/login_viewModel.dart';

abstract class LoginService {
  static Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: LoginViewModel.emailController.text.trim(),
        password: LoginViewModel.passwordController.text.trim());
  }
}
