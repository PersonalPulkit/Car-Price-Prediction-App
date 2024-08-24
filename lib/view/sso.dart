import 'package:ai/view/googlesso.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../custom_widgets/elevatedbutton.dart';
import '../routes/app_routes.dart';

class SSO extends StatefulWidget {
  const SSO({super.key});

  @override
  State<SSO> createState() => _SSOState();
}

class _SSOState extends State<SSO> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Container(
          height: size.height*0.6,
          margin: EdgeInsets.all(25.0),
          // height: size.height*0.3,
          // width: size.width*0.5,
          child: Card(
            margin: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.login,size: 100,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AutoSizeText("Welcome to _______", maxFontSize: 100,style: TextStyle(fontSize: 20),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AutoSizeText("Login using below login options", maxFontSize: 50),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GoogleSSO(size: size,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomElevatedButtonWithIcon(
                            text: "Login with Apple",
                            callBack: () {
                              // Navigator.pushNamed(
                              //     context, AppRoutes.dashboard);
                            },
                            icon: Icon(FontAwesomeIcons.apple),
                            size: size,
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
      ),
    );
  }
}
