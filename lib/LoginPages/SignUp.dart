import 'package:agriboost/LoginPages/SignIn.dart';
import 'package:agriboost/components/buttons.dart';
import 'package:agriboost/components/customTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final bool _isLoading = false;
  Future<void> createUserWithEmailandPassword() async {
    if (_formKey.currentState!.validate()) {
      // setState(() {
      //   _isLoading =  true;
      // });
      try {
        final userCredentials =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text.trim(),
          password: _password.text.trim(),
        );
        await FirebaseAuth.instance.currentUser?.sendEmailVerification();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Verification email sent. Please check your email to verify your account.",
            ),
          ),
        );

        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const SigninPage()));
        print(userCredentials);
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green[200],
      backgroundColor: const Color.fromRGBO(233, 241, 241, 1),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset("assets/splash.jpg"),
                  ),
                  const Text(
                    "Welcome to AgriBoost",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Your Smart Farming Campaign",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w300,
                          color: Colors.black)),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Register",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                color: Colors.green),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 18.0),
                                  child: Text(
                                    "Email Id",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0,
                                  ),
                                  child: CustomTextField(
                                    controler: _email,
                                    hintText: "Enter Email id",
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Email is required";
                                      }
                                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                          .hasMatch(value)) {
                                        return "Enter a valid email";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 18.0, top: 10),
                                  child: Text(
                                    "Password",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0,
                                  ),
                                  child: CustomTextField(
                                    controler: _password,
                                    hintText: "Enter your Password",
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Password is required";
                                      } else if (value.length < 6) {
                                        return "Password should be atleast 6 letters";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 18.0, top: 10),
                                  child: Text(
                                    "Confirm Password",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0,
                                  ),
                                  child: CustomTextField(
                                    controler: _confirmPassword,
                                    hintText: "Coinfirm your Password",
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Confirm your password";
                                      }
                                      if (value != _password.text) {
                                        return "Passwords do not match";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Buttons(
                                    navigate: () {
                                      createUserWithEmailandPassword();
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             const NotificationPage()));
                                    },
                                    buttonColor: Colors.green,
                                    buttonText: _isLoading
                                        ? "Registering..."
                                        : "Register",
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const SigninPage()));
                                    },
                                    child: const Text(
                                      "Already Have Account! Sign In",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: 22,
                                          color: Colors.blue),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
