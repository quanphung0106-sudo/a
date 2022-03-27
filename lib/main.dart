import 'package:flutter/material.dart';
import 'package:profile_1/page/edit_profile_page.dart';
import 'package:profile_1/page/main_page.dart';
import 'package:profile_1/page/profile_page.dart';
import 'package:profile_1/utils/user_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserPreferences.init();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final String title = 'User Profile';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue.shade300,
        dividerColor: Colors.black,
      ),
      title: title,
      home: chatapp(),
    );
  }
}
