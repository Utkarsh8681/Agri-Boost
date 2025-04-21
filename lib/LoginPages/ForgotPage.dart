import 'package:agriboost/components/ForgotButton.dart';
import 'package:agriboost/components/NameText.dart';
import 'package:agriboost/components/customTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController email0 = TextEditingController();

    Future<void> sendPasswordResetEmail(String email) async {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Password reset email sent. Please check your email.",
            ),
          ),
        );
        Navigator.pop(context); // Navigate back to the login screen
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? "An error occurred")),
        );
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ),
                  ],
                ),
                const PageText(
                  frontText: 'Forgot Password',
                ),
                const Center(
                  child: Text(
                    "No worries! Enter your email address below and we will send you a code to reset your password.",
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 33),
                Container(
                  child: const text_field_name(
                    fieldName: "E-mail",
                  ),
                ),
                CustomTextField(
                  controler: email0,
                  hintText: "Enter Your E-Mail",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 430.0),
                  child: SignIn_UpButton(
                    buttonColor: Colors.green,
                    buttonText: "Send Reset Instruction",
                    buttonTextColor: Colors.white,
                    onClick: () async {
                      final email = email0.text.trim();
                      if (email.isNotEmpty) {
                        await sendPasswordResetEmail(email);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Please enter your email")),
                        );
                      }
                    },
                    border: 0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
