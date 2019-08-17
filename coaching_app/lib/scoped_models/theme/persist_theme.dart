import 'package:coaching_app/scoped_models/theme/app_themes.dart';
import 'package:coaching_app/scoped_models/theme/theme_bloc.dart';
import 'package:coaching_app/scoped_models/theme/theme_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:scoped_model/scoped_model.dart';

mixin PersistTheme on Model {
  AppTheme x = AppTheme.RedLight ;

  SaveTheme(int i) async {
    print("debug 1s");
    final prefs = await SharedPreferences.getInstance();
    final key = 'theme_int';
    final value = i;
    prefs.setInt(key, value);
    print("debug 2s");
    print('saved $value in $key');
    notifyListeners();
  }


  ReadTheme(context) async {
    print("debug 1r");
    final prefs = await SharedPreferences.getInstance();
    final key = 'theme_int';
    final value = prefs.getInt(key) ?? 0;
    print("debug 2r");
    print('read: $value');
     x = MatchThemeForRead(value);
     print("x = "+x.toString());
    BlocProvider.of<ThemeBloc>(context)
        .dispatch(ThemeChanged(theme: x));
//    ThemeChanged(theme: x);
    notifyListeners();
    return x ;
  }


   MatchThemeForRead(int i){
    print("matchnng int is = "+i.toString());
    switch(i){
      case 0 :
        SaveTheme(1);
        x = AppTheme.RedLight;
        notifyListeners();
        return AppTheme.RedLight;
        break;
      case 1 :
//        SaveTheme(1);
        x = AppTheme.RedLight;
        notifyListeners();
        return AppTheme.RedLight;
        break;
      case 2 :
//        SaveTheme(2);
        x = AppTheme.GreenLight;
        notifyListeners();
        return AppTheme.GreenLight;
        break;
      case 3 :
//        SaveTheme(3);
        return AppTheme.GreenDark;
        break;
      case 4 :
//        SaveTheme(4);
        x = AppTheme.BlueLight;
        notifyListeners();
        return AppTheme.BlueLight;
        break;
      case 5 :
//        SaveTheme(5);
        x = AppTheme.BlueDark;
        notifyListeners();
        return AppTheme.BlueDark;
        break;
      case 6 :
//        SaveTheme(6);
        x = AppTheme.BlackDark;
        notifyListeners();
        return AppTheme.BlackDark;
        break;
       default:
//         SaveTheme(1);
         return AppTheme.RedLight;
//         break;
    }


  }

  MatchThemeForSave(AppTheme i){
    switch(i){
      case AppTheme.RedLight :
        SaveTheme(1);
//        return AppTheme.RedLight;
        break;
      case AppTheme.GreenLight :
        SaveTheme(2);
//        return AppTheme.GreenLight;
        break;
      case AppTheme.GreenDark :
        SaveTheme(3);
//        return AppTheme.GreenDark;
        break;
      case  AppTheme.BlueLight :
        SaveTheme(4);
//        return AppTheme.BlueLight;
        break;
      case AppTheme.BlueDark :
        SaveTheme(5);
//        return AppTheme.BlueDark;
        break;
      case AppTheme.BlackDark :
        SaveTheme(6);
//        return AppTheme.BlackDark;
        break;
      default:
        SaveTheme(1);
//        return AppTheme.RedLight;
        break;
    }
  }



}