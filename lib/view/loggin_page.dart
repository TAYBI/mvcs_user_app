import 'package:flutter/material.dart';
import 'package:mvc_counter_app/controller/logging_commande.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;

  void _handleLoginPressed() async {
    setState(() => _isLoading = true);
    bool success = await LoginCommand().run("someuser", "somepass");
    if (!success) setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : TextButton(
                child: Text("Login"),
                onPressed: _handleLoginPressed,
              ),
      ),
    );
  }
}
