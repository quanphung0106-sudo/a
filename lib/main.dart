import 'package:flutter/material.dart';
import 'package:profile_1/login-register/LoginScreen.dart';
import 'package:profile_1/page/edit_profile_page.dart';
import 'package:profile_1/page/profile_page.dart';
import 'package:profile_1/utils/user_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserPreferences.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email and Password Login',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: LoginScreen(),
    );
  }
}
