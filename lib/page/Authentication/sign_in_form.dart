import 'package:altsome_app/main.dart';
import 'package:altsome_app/page/Authentication/reset_password.dart';
import 'package:altsome_app/page/Authentication/sign_up_form.dart';
import 'package:flutter/material.dart';
import '../../reusable_widgets/custom_text_form_field.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _email;
  String? _password;

  void submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('Form submitted!');
      print('Email: $_email, Password: $_password');

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email!,
          password: _password!,
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AltsomeApp(),
          ),
        );
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${error.toString().replaceAll("[firebase_auth/invalid-credential]", "").trim()}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            duration: Duration(seconds: 5),
          ),
        );
      }
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
                      } else {
                        return null;
                      }
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have account?",
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
