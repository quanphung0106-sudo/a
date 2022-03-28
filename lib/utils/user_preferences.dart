import 'dart:convert';

import 'package:profile_1/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _prefenrences;

  static const _keyUser = 'user';
  static const myUser = User(
    imagePath:
        'https://media.istockphoto.com/vectors/default-profile-picture-avatar-photo-placeholder-vector-illustration-vector-id1223671392?k=20&m=1223671392&s=612x612&w=0&h=lGpj2vWAI3WUT1JeJWm1PRoHT3V15_1pdcTn2szdwQ0=',
    name: 'User',
    email: 'example@gmail.com',
    about:
        'Today is a nice day.',
  );

  static Future init() async =>
      _prefenrences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());
    await _prefenrences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _prefenrences.getString(_keyUser);

    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}
