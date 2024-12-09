import 'package:flutter/material.dart';

import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register-screen';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _username = '';
  String _password = '';
  String _confirmedPassword = '';
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Now"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Column(
              children: [
                TextFormField(
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'Enter Your Username';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Username",
                  ),
                  onSaved: (v) {
                    _username = v!;
                  },
                ),
                TextFormField(
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'Enter Your password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Password",
                  ),
                  onChanged: (value) {
                    setState(() {
                      _confirmedPassword = value;
                    });
                  },
                  onSaved: (v) {
                    _password = v!;
                  },
                  obscureText: true,
                  autocorrect: false,
                  enableSuggestions: false,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Your Password';
                    }
                    if (value != _confirmedPassword) {
                      return 'Password does not match';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                  ),
                  onSaved: (v) {
                    _confirmedPassword = v!;
                  },
                  obscureText: true,
                  autocorrect: false,
                  enableSuggestions: false,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _registerButtonPressed();
                      },
                      child: Text("Register"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(LoginScreen.routeName);
                      },
                      child: Text("Login"),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _registerButtonPressed() async {
    var isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    print(_username);
    print(_password);
    // bool istoken = await Provider.of<UserState>(
    //   context,
    //   listen: false,
    // ).loginNow(_username, _password);
    // if (istoken) {
    //   Navigator.of(context).pushReplacementNamed(HomeScreens.routeName);
    // } else {
    //   showDialog(
    //       context: context,
    //       builder: (context) {
    //         return AlertDialog(
    //           title: Text("Something is wrong.Try Again"),
    //           actions: [
    //             RaisedButton(
    //               onPressed: () {
    //                 Navigator.of(context).pop();
    //               },
    //               child: Text("OK"),
    //             )
    //           ],
    //         );
    //       });
    // }
  }
}
