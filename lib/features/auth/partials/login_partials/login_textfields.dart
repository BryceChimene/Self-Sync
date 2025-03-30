import 'package:flutter/material.dart';
import '../../../../widgets/text_fields/my_login_textfields.dart';

class LoginTextfields extends StatelessWidget {
  const LoginTextfields({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return MyLoginTextFields(
      emailController: emailController,
      emailPrefixIcon: Icon(
        Icons.email,
        color: Colors.white54,
      ),
      emailLabelText: "Email",
      passwordController: passwordController,
      passwordPrefixIcon: const Icon(
        Icons.lock,
        color: Colors.white54,
      ),
      passwordLabelText: "Password",
    );
  }
}
