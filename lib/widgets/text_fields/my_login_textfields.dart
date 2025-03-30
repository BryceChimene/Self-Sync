import 'package:flutter/material.dart';

class MyLoginTextFields extends StatefulWidget {
  const MyLoginTextFields({
    super.key,
    required this.emailController,
    required this.emailLabelText,
    required this.emailPrefixIcon,
    required this.passwordController,
    required this.passwordLabelText,
    required this.passwordPrefixIcon,
  });

  final TextEditingController emailController;
  final String emailLabelText;
  final Icon emailPrefixIcon;
  final TextEditingController passwordController;
  final String passwordLabelText;
  final Icon passwordPrefixIcon;

  @override
  _MyLoginTextFieldsState createState() => _MyLoginTextFieldsState();
}

class _MyLoginTextFieldsState extends State<MyLoginTextFields> {
  bool _passwordObscure = true; // State variable for password visibility

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Email TextField
        TextField(
          controller: widget.emailController,
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(255, 5, 42, 60),
            labelStyle: const TextStyle(color: Colors.white),
            labelText: widget.emailLabelText,
            prefixIcon: widget.emailPrefixIcon,
            contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.blueAccent)),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Colors.white54,
              ),
            ),
          ),
        ),

        const SizedBox(height: 15), // Add spacing between fields

        // Password TextField
        TextField(
          controller: widget.passwordController,
          obscureText: _passwordObscure,
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(255, 5, 42, 60),
            labelStyle: const TextStyle(color: Colors.white),
            labelText: widget.passwordLabelText,
            prefixIcon: widget.passwordPrefixIcon,
            suffixIcon: IconButton(
              color: Colors.white70,
              icon: Icon(_passwordObscure ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() {
                  _passwordObscure = !_passwordObscure;
                });
              },
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.blueAccent)),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Colors.white54,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
