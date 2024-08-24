import 'package:ai/view/applesso.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/elevatedbutton.dart';
import '../custom_widgets/textfield.dart';
import '../routes/app_routes.dart';
import 'googlesso.dart';

class LoginAll extends StatefulWidget {
  const LoginAll({super.key});

  @override
  State<LoginAll> createState() => _LoginAllState();
}

class _LoginAllState extends State<LoginAll> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernamefocusNode = FocusNode();
  final _passwordfocusNode = FocusNode();

  String? _usernameerrorMessage;
  String? _passworderrorMessage;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: double.maxFinite,
            margin: const EdgeInsets.all(25.0),
            // height: size.height*0.3,
            // width: size.width*0.5,
            child: Card(
              margin: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.login,
                              size: 100,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: AutoSizeText(
                              "Welcome to _______",
                              maxFontSize: 100,
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: AutoSizeText(
                                "Login using below login options",
                                maxFontSize: 50),
                          ),
                        ],
                      ),
                      Column(
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
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomElevatedButton(text: "Sign In"),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Forgot Password?'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          color: Colors.black,
                          thickness: 0.5,
                          indent: size.width * 0.1,
                          endIndent: size.width * 0.1,
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GoogleSSO(
                              size: size,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: AppleSSO(size: size,),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          color: Colors.black,
                          thickness: 0.5,
                          indent: size.width * 0.1,
                          endIndent: size.width * 0.1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: const Text("Create new account."),
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, AppRoutes.signup);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
