import 'package:ecom_app/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/user_state.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _username = '';
  String _password = '';
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Now"),
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
                  onSaved: (v) {
                    _password = v!;
                    print(_password);
                  },
                  obscureText: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _loginButtonPressed();
                      },
                      child: Text("Login"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(RegisterScreen.routeName);
                      },
                      child: Text(
                        "Register New",
                      ),
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

  void _loginButtonPressed() async {
    var isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    // Provider.of<UserState>(context, listen: false)
    //     .loginNow(_username, _password);
    bool istoken = await Provider.of<UserState>(context, listen: false)
        .loginNow(_username, _password);
    if (istoken) {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    } else {
      SnackBar snackBar = SnackBar(
        content: Text("Something is wrong.Try Again"),
        // action: SnackBarAction(
        //   label: "OK",
        //   onPressed: () {},
        // ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
