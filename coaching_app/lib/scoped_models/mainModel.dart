import 'package:coaching_app/scoped_models/auth/email.dart';
import 'package:coaching_app/scoped_models/auth/google_auth.dart';
import 'package:coaching_app/scoped_models/firebase.dart';
import 'package:coaching_app/scoped_models/theme/persist_theme.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class mainModel extends Model
    with GoogleAuth,
        SignInWithEmail,
        FirebaseModelMethods,
        PersistTheme
{

  ThemeData MainTheme = ThemeData.light();

  ThemeData ThemeDark = ThemeData(
    brightness: Brightness.dark ,
  );

  ThemeData ThemeLight = ThemeData(
    brightness: Brightness.light ,
  );

  ToggleTheme()
  {
    if (MainTheme.brightness == Brightness.light)
      {
        MainTheme = ThemeDark ;
        print("if/ theme change to = "+MainTheme.brightness.toString());
      }
      else
        {
          MainTheme = ThemeLight ;
          print("else/ theme change to = "+MainTheme.brightness.toString());

        }
        notifyListeners();
  }
}