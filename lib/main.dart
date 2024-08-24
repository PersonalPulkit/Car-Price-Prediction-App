import 'package:ai/providers/tab_provider.dart';
import 'package:ai/providers/theme_provider.dart';
import 'package:ai/utils/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

import 'routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => TabProvider()),
      ChangeNotifierProvider(create: (context) => ThemeProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (BuildContext context, ThemeProvider value, Widget? child) {
        return MaterialApp(
          themeMode: value.getThemeMode,
          theme: AppTheme.lightTheme,
          highContrastTheme: ThemeData(),
          highContrastDarkTheme: ThemeData(),
          darkTheme: AppTheme.darkTheme,
          initialRoute: AppRoutes.dashboard,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}


