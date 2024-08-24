import 'package:flutter/material.dart';

import '../custom_widgets/elevatedbutton.dart';
import '../custom_widgets/textfield.dart';
import '../routes/app_routes.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernamefocusNode = FocusNode();
  final _passwordfocusNode = FocusNode();

  String? _usernameerrorMessage;
  String? _passworderrorMessage;
  @override
  void initState() {
    super.initState();
    _usernamefocusNode.addListener(_onUsernameFocusChange);
    _passwordfocusNode.addListener(_onPasswordFocusChange);
  }

  void _onUsernameFocusChange() async {
    if (!_usernamefocusNode.hasFocus) {
      // Validate the username when focus is lost
      String username = _usernameController.text;
      if (username.isEmpty) {
        setState(() {
          _usernameerrorMessage = 'Username cannot be empty';
        });
      } else {
        setState(() {
          _usernameerrorMessage = null;
        });
      }
    }
  }

  void _onPasswordFocusChange() {
    if (!_passwordfocusNode.hasFocus) {
      // Validate the username when focus is lost
      String password = _passwordController.text;
      if (password.isEmpty) {
        setState(() {
          _passworderrorMessage = 'Password cannot be empty';
        });
      } else {
        setState(() {
          _passworderrorMessage = null;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Card(
          margin: EdgeInsets.all(20.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(
                    fetchtext: _usernameController,
                    text: "Username",
                    keyboard: TextInputType.emailAddress,
                    hasFocus: _usernamefocusNode,
                    errorMessage: _usernameerrorMessage,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(
                    fetchtext: _passwordController,
                    text: "Password",
                    keyboard: TextInputType.visiblePassword,
                    errorMessage: _passworderrorMessage,
                    hasFocus: _passwordfocusNode,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomElevatedButton(text: "Login"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Forgot Password?'),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.all(8.0),
                child: InkWell(child: Text("Create new account."),
                onTap: (){
                  Navigator.pushReplacementNamed(context, AppRoutes.signup);
                },),)

              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _passwordfocusNode.dispose();
    _usernamefocusNode.dispose();
  }
}
