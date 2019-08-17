import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coaching_app/pages/dashBoardPage.dart';
import 'package:coaching_app/pages/master/masterDashBoard.dart';
import 'package:coaching_app/pages/startingPage.dart';
import 'package:coaching_app/scoped_models/mainModel.dart';
import 'package:coaching_app/scoped_models/theme/theme_bloc.dart';
import 'package:coaching_app/scoped_models/theme/theme_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:scoped_model/scoped_model.dart';
import 'package:coaching_app/globals.dart' as globals;
import 'package:bloc/bloc.dart';

void main(){
  runApp(MyApp());
}



class MyApp extends StatelessWidget {

  mainModel mainModelObj = new mainModel();
//  ThemeChangedMethod()
//  {
//    print("debug 1a");
//
//
//    var i =  mainModelObj.ReadTheme(context) ?? 1 ;
//    print("debug 2a");
////    var pass  = mainModelObj.MatchThemeForRead(i);
////    print("debug 3a and pass = "+pass.toString());
//
////    return pass;
//  }
  MyApp()
  {
//    ThemeChangedMethod() ;
  }
  @override
  Widget build(BuildContext context) {

    return BlocProvider(

      builder: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context,state){
          mainModel mainModelObj = new mainModel();
          mainModelObj.ReadTheme(context);
          return ScopedModel<mainModel>(
            model: mainModelObj,
            child: MaterialApp(
              theme: state.themeData,
              title: 'Coaching App',
//              theme: mainModelObj.MainTheme ,
              home: SplashScreen(),
            ),
          );
        },
      ),
    );
  }
}

//class MyApp2 extends StatelessWidget {
//
//  @override
//  Widget build(BuildContext context) {
//    return
//  }
//}

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  mainModel mainModelobj = new mainModel();
  @override
  void initState() {
    // TODO: implement initState
    print("1");
    mainModelobj.getUser().then((user) async {
      print("1");
      if (user != null) {
//        print("user ="+user.toString());
        mainModelobj.setUser(user);

        List<DocumentSnapshot> b = await Firestore.instance.collection("masters")
            .where("email", isEqualTo: user.email.toString().toLowerCase())
            .getDocuments()
            .then((val) => val.documents) ;
        print("b = "+b.length.toString());

//         type = authorizeAdmin(b[0]);
        String type ;

        if(b.length!=0)
          {
            type =  b[0].data['type'];
            globals.masterName = b[0].data['name'];
            print("master name = "+globals.masterName.toString());
          }

        // send the user to the home page
        // homePage();
        try
        {
          print("auto user "+ user.email);
          globals.mainEmail = user.email ;
//          mainModelobj.CoursesList.clear() ;
          mainModelobj.MasterListStart() ;

          print("YY course lsit "+mainModelobj.CoursesList.length.toString());

          if(type=="master"){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MasterDashBoard(user.email.toString())));
          }
          else
            {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashBoardPage(user.email)));
            }


        }catch(e){
          print("some Debugg = "+e.toString());
          print("try to sign in again");
          Timer(Duration(seconds: 3), () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>StartingPage()));
          });
        }


      }
      else{
        Timer(Duration(seconds: 3), () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>StartingPage()));
        });
      }
    });

  }

//  mainModel mainModelObj = new mainModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        alignment: Alignment.center,
        color: Colors.redAccent,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.android,color: Colors.white,size: 80,),
              SizedBox(height: 20,),
              Text("Application Name",style: TextStyle(color: Colors.white,fontSize: 20),)
            ],
          ),
        ),
      ),
    );
  }
}



