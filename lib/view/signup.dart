import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/elevatedbutton.dart';
import '../custom_widgets/textfield.dart';
import '../data/models/checkduplicatedetail.dart';
import '../repository/checkduplicatedetails.dart';
import '../routes/app_routes.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  CheckDuplicateDetailsService checkDuplicateDetailsApi =
      CheckDuplicateDetailsService();
  late CheckDuplicateDetails isUnique;
  String? _dropdownValue;
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _usernamefocusNode = FocusNode();
  final _emailfocusNode = FocusNode();
  final _phonefocusNode = FocusNode();
  final _passwordfocusNode = FocusNode();
  final _confirmpasswordfocusNode = FocusNode();

  String? _usernameerrorMessage;
  String? _emailerrorMessage;
  String? _phoneerrorMessage;
  String? _passworderrorMessage;
  String? _confirmpassworderrorMessage;

  @override
  void initState() {
    super.initState();
    _usernamefocusNode.addListener(_onUsernameFocusChange);
    _emailfocusNode.addListener(_onEmailFocusChange);
    _phonefocusNode.addListener(_onPhoneFocusChange);
    _passwordfocusNode.addListener(_onPasswordFocusChange);
    _confirmpasswordfocusNode.addListener(_onConfirmpasswordFocusChange);
  }

  void _onUsernameFocusChange() async {
    bool? result;
    if (!_usernamefocusNode.hasFocus) {
      // Validate the username when focus is lost
      String username = _usernameController.text;
      String email = _emailController.text;
      if (username.isEmpty) {
        setState(() {
          _usernameerrorMessage = 'Username cannot be empty';
        });
      } else if (username.isNotEmpty && email.isNotEmpty) {
        isUnique = CheckDuplicateDetails(email: email, username: username);
        await checkDuplicateDetailsApi.checkDetailsApi(isUnique).then((val) {
          result = (val.toString()) == "true" ? true : false;
          if (kDebugMode) {
            print(result);
          }
        });
        if (kDebugMode) {
          print("------username validated-----------");
        }
        if (result == true) {
          setState(() {
            _usernameerrorMessage = null;
            _emailerrorMessage = null;
          });
        } else {
          setState(() {
            _usernameerrorMessage = "Duplicate username found";
            _emailerrorMessage = "Duplicate email found";
          });
        }
      } else {
        setState(() {
          _usernameerrorMessage = null;
        });
      }
    }
  }

  void _onEmailFocusChange() async {
    bool? result;
    if (!_emailfocusNode.hasFocus) {
      // Validate the username when focus is lost
      String email = _emailController.text;
      String username = _usernameController.text;
      String pattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*(\.[a-zA-Z]{2,})$';
      RegExp regex = RegExp(pattern);
      if (email.isEmpty) {
        setState(() {
          _emailerrorMessage = 'Email cannot be empty';
        });
      } else if (!regex.hasMatch(email)) {
        setState(() {
          _emailerrorMessage = 'Please enter a valid email';
        });
      } else if (username.isNotEmpty && email.isNotEmpty) {
        isUnique = CheckDuplicateDetails(email: email, username: username);
        await checkDuplicateDetailsApi.checkDetailsApi(isUnique).then((val) {
          result = (val.toString() == "true") ? true : false;
          if (kDebugMode) {
            print(result);
          }
        });
        if (kDebugMode) {
          print("------email validated-----------");
        }
        if (result == true) {
          setState(() {
            _usernameerrorMessage = null;
            _emailerrorMessage = null;
          });
        } else {
          setState(() {
            _usernameerrorMessage = "Duplicate username found";
            _emailerrorMessage = "Duplicate email found";
          });
        }
      } else {
        setState(() {
          _emailerrorMessage = null;
        });
      }
    }
  }

  void _onPhoneFocusChange() {
    if (!_phonefocusNode.hasFocus) {
      // Validate the username when focus is lost
      String phone = _phoneController.text;
      String pattern = r'^[1-9][0-9]{9}$';
      RegExp regex = RegExp(pattern);
      if (phone.isEmpty) {
        setState(() {
          _phoneerrorMessage = 'phone cannot be empty';
        });
      } else if (!regex.hasMatch(phone)) {
        setState(() {
          _phoneerrorMessage = 'Please enter a valid phone number';
        });
      } else {
        setState(() {
          _phoneerrorMessage = null;
        });
      }
    }
  }

  void _onPasswordFocusChange() {
    if (!_passwordfocusNode.hasFocus) {
      // Validate the username when focus is lost
      String confirmpassword = _confirmpasswordController.text;
      String password = _passwordController.text;
      if (password.isEmpty) {
        setState(() {
          _passworderrorMessage = 'Password cannot be empty';
        });
      } else if (password != confirmpassword) {
        setState(() {
          _passworderrorMessage = 'Password does not match';
        });
      } else {
        setState(() {
          _passworderrorMessage = null;
        });
      }
    }
  }

  void _onConfirmpasswordFocusChange() {
    if (!_confirmpasswordfocusNode.hasFocus) {
      // Validate the username when focus is lost
      String confirmpassword = _confirmpasswordController.text;
      String password = _passwordController.text;
      if (confirmpassword.isEmpty) {
        setState(() {
          _confirmpassworderrorMessage = 'Confirm password cannot be empty';
        });
      } else if (password != confirmpassword) {
        setState(() {
          _confirmpassworderrorMessage = 'Password does not match';
        });
      } else {
        setState(() {
          _confirmpassworderrorMessage = null;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    void dropdownCallBack(String? selectedValue) {
      if (selectedValue is String) {
        setState(() {
          _dropdownValue = selectedValue;
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                      fetchtext: _emailController,
                      text: "Email",
                      keyboard: TextInputType.emailAddress,
                      hasFocus: _emailfocusNode,
                      errorMessage: _emailerrorMessage,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: DropdownButton(
                            items: [
                              DropdownMenuItem<String>(
                                child: Row(
                                  children: [
                                    Icon(Icons.flag),
                                    Text("+91"),
                                  ],
                                ),
                                value: "+91",
                              )
                            ],
                            onChanged: dropdownCallBack,
                            value: _dropdownValue,
                            hint: Text("Country\n code"),
                          ),
                        ),
                        SizedBox(
                          width: 250,
                          child: CustomTextField(
                            fetchtext: _phoneController,
                            text: "Phone Number",
                            keyboard: TextInputType.number,
                            errorMessage: _phoneerrorMessage,
                            hasFocus: _phonefocusNode,
                          ),
                        ),
                      ],
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
                    child: CustomTextField(
                      fetchtext: _confirmpasswordController,
                      text: "Confirm Password",
                      keyboard: TextInputType.visiblePassword,
                      errorMessage: _confirmpassworderrorMessage,
                      hasFocus: _confirmpasswordfocusNode,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomElevatedButton(
                      text: "Signup Coming soon",
                      callBack: () {
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.loginall);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Text("Existing user?"),
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.loginall);
                      },
                    ),
                  ),
                ],
              ),
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
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();

    _emailfocusNode.dispose();
    _phonefocusNode.dispose();
    _passwordfocusNode.dispose();
    _confirmpasswordfocusNode.dispose();
    _usernamefocusNode.dispose();
  }
}
