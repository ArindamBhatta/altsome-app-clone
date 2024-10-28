import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

import 'package:altsome_app/page/Authentication/provider/login_auth_provider.dart';
import 'package:altsome_app/page/Authentication/reset_password.dart';
import 'package:altsome_app/page/Authentication/sign_up_form.dart';
import '../../altsome_app.dart';
import '../reusable_widgets/custom_text_form_field.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
//* Properties
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

//* Method to show loading dialog when user is try to sign in
  void _showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // Ensures it doesn't take full screen
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text(
                  'Login is in progress. Please wait...',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

// * Method to handle form submission
  void submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _showLoadingDialog(); //* Show the loading dialog
    }

    //* Check if email and password is store in Firebase
    try {
      final UserCredential user =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email!,
        password: _password!,
      );
      //* get user id from firebase
      final accessToken = user.user!.uid;
      print("firebase user id: $accessToken");
      //* set in provider
      context.read<LoginAuthProvider>().setUserAccessToken(accessToken);
      //* Close the loading dialog
      Navigator.pop(context);

//*  if email and password is not store in Firebase
    } catch (error) {
      Navigator.pop(context); //* Close the loading dialog in case of error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Login failed',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }

//* 2nd Alternative Method: -  Google Sign In
  Future<void> signInWithGoogle() async {
    _showLoadingDialog(); //* show a loading dialog because fetch all email from device

//* package google_sign_in check email in device and store in a googleUser
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        Navigator.pop(context); //* Close the dialog no email found
        return;
      }

//* if email is found then store in a googleUser
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      Navigator.pop(context); //* Close the loading dialog

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AltsomeApp(),
        ),
      );
    } catch (error) {
      Navigator.pop(context); //* Close the loading dialog in case of error

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Google sign-in failed',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      appBar: AppBar(
        title: Text('Sign In Form', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          gradient: LinearGradient(
            colors: [
              Colors.blue[100]!,
              Colors.blue[200]!,
              Colors.blue[300]!,
              Colors.blue[400]!,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 16),
                  CustomTextFormField(
                    labelText: 'Email',
                    prefixIcon: Icons.email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!EmailValidator.validate(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value?.trim();
                    },
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    labelText: 'Enter Password',
                    prefixIcon: Icons.lock,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.length < 8) {
                        return 'Password must be at least 8 characters long';
                      } else if (value.contains(' ')) {
                        return 'Password cannot contain spaces';
                      } else if (!value.contains(RegExp(r'[A-Z]'))) {
                        return 'Password must contain at least one uppercase letter';
                      } else if (!value.contains(RegExp(r'[0-9]'))) {
                        return 'Password must contain at least one number';
                      } else if (!value
                          .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                        return 'Password must contain at least one special character';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value?.trim();
                    },
                  ),
                  TextButton(
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 250, 238, 10)),
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          constraints: BoxConstraints(
                            maxHeight:
                                MediaQuery.of(context).size.height * 0.75,
                          ),
                          builder: (context) => ResetPassword(),
                        );
                      }),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: submitForm,
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton.icon(
                    icon: Icon(Icons.login),
                    label: Text('Sign in with Google'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: signInWithGoogle,
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => SignUpForm(),
                            ),
                          );
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Color.fromARGB(255, 240, 243, 33),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// Notifying id token listeners about user ( ggfUxSEsr7Q44wVmVTJha9UkpdG2 ).
//*1.taken is store in a variable.
//*2. store in local storage.
//3. check every time before user login
