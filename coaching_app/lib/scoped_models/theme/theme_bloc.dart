import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:coaching_app/scoped_models/mainModel.dart';
import 'package:coaching_app/scoped_models/theme/app_themes.dart';
import 'package:coaching_app/scoped_models/theme/theme_event.dart';
import 'package:coaching_app/scoped_models/theme/theme_states.dart';
import 'package:scoped_model/scoped_model.dart';


class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {

//  ThemeChangedMethod()
//   {
//     print("debug 1a");
//
//
//   var i =  mainModelObj.ReadTheme() ?? 1 ;
//     print("debug 2a");
//     var pass  = mainModelObj.MatchThemeForRead(i);
//     print("debug 3a and pass = "+pass.toString());
//     return pass;
//  }

  @override
  ThemeState get initialState {
//    var pass = ThemeChangedMethod();
 mainModel mainModelObj = new mainModel();
    return ThemeState(themeData: appThemeData[mainModelObj.x]);
  }
      // Everything is accessible from the appThemeData Map.


  @override
  Stream<ThemeState> mapEventToState(
      ThemeEvent event,
      ) async* {
    if (event is ThemeChanged) {
      yield ThemeState(themeData: appThemeData[event.theme]);
    }
  }
}