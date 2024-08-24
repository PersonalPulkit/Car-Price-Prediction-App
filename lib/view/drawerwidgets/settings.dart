import 'package:ai/providers/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../../custom_widgets/elevatedbutton.dart';
import '../../routes/app_routes.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  Future<void> signOutUser() async {
    await GoogleSignIn().disconnect();
    await FirebaseAuth.instance.signOut();

    Navigator.pushReplacementNamed(context, AppRoutes.loginall);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      // color: Colors.yellow,
      child: Column(
        children: [
          Center(child: Text("Hello! Welcome to dashboard")),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Select theme"),
                Consumer<ThemeProvider>(builder: (BuildContext context, ThemeProvider value, Widget? child) => ToggleButtons(
                  // direction: vertical ? Axis.vertical : Axis.horizontal,
                  onPressed: (int index) {
                    context.read<ThemeProvider>().setSelectedTheme(index);
                    // setState(() {
                    //   // The button that is tapped is set to true, and the others to false.
                    //   for (int i = 0; i < _selectedWeather.length; i++) {
                    //   _selectedWeather[i] = i == index;
                    //   }
                    // });
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  selectedBorderColor: Colors.blue[700],
                  selectedColor: Colors.white,
                  fillColor: Colors.blue[200],
                  color: Colors.blue[400],
                  isSelected: value.getSelectedTheme,
                  children: value.getIcons,
                ),
                ),

              ],
            ),
          ),
          CustomElevatedButtonWithIcon(
            text: 'Logout',
            icon: Icon(Icons.logout),
            size: size,
            callBack: () {
              signOutUser();
              final user = FirebaseAuth.instance.currentUser;
              if (kDebugMode) {
                print(user);
              }
            },
          )
        ],
      ),
    );
  }
}
