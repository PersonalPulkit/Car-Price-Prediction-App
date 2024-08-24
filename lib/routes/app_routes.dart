

import 'package:ai/view/dashboard.dart';
import 'package:ai/view/loginall.dart';
import 'package:flutter/material.dart';

import '../view/login.dart';
import '../view/signup.dart';
import '../view/sso.dart';





class AppRoutes {
  static String signup = '/signup';
  static String login = '/login';
  static String dashboard = '/dashboard';
  static String sso = '/sso';
  static String loginall = '/loginall';
  // static String contact = '/contact';
  static Map<String, WidgetBuilder> routes = {

    signup: (context) => const Signup(),
    login: (context) => const Login(),
    dashboard: (context) => const Dashboard(),
    sso: (context) => const SSO(),
    loginall: (context) => const LoginAll(),

    // contact: (context) => const Contact(),
  };
}
