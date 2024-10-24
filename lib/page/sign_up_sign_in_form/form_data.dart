import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FormWithOnSaved extends StatefulWidget {
  const FormWithOnSaved({super.key});

  @override
  State<FormWithOnSaved> createState() {
    return _FormWithOnSavedState();
  }
}

class _FormWithOnSavedState extends State<FormWithOnSaved> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _userName;
  String? _email;
  String? _password;

  void submitFormOnPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('Form submitted!');
      print('Email: $_email, Password: $_password and Name: $_userName');
      submitDataInFirebase();
    }
  }

  void submitDataInFirebase() async {
    String message;
    if (_formKey.currentState!.validate()) {
      try {
        final firebaseAuth = FirebaseAuth.instance;
        await firebaseAuth.createUserWithEmailAndPassword(
          email: _email!,
          password: _password!,
        );
      } catch (error) {
        message = error.toString();
        print("Connection Error: " + message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Sign Up Page'),
      ),
      resizeToAvoidBottomInset:
          true, // Allows the view to adjust when the keyboard appears
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                //* UserName verification
                TextFormField(
                  decoration: InputDecoration(labelText: 'Username'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _userName = value;
                  },
                ),

                //* Email verification
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
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
                //* Password verification
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  enableSuggestions: false,
                  maxLength: 16,
                  validator: (value) {
                    if (value == null || value.length < 8) {
                      return 'Password must be at least 8 characters';
                    } else if (!value.contains(RegExp(r'[A-Z]'))) {
                      return 'Password must contain at least one uppercase letter';
                    } else if (!value.contains(RegExp(r'[a-z]'))) {
                      return 'Password must contain at least one lowercase letter';
                    } else if (!value.contains(RegExp(r'[0-9]'))) {
                      return 'Password must contain at least one number';
                    } else if (!value
                        .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                      return 'Password must contain at least one special character';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _password = value;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: submitFormOnPressed,
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
