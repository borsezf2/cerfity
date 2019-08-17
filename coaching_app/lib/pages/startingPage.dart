import 'package:coaching_app/pages/dashBoardPage.dart';
import 'package:coaching_app/pages/masterSignIn.dart';
import 'package:coaching_app/pages/signInPage.dart';
import 'package:coaching_app/pages/signUpPage.dart';
import 'package:coaching_app/pages/masterPage.dart';
import 'package:coaching_app/scoped_models/mainModel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:carousel_slider/carousel_slider.dart';

class StartingPage extends StatefulWidget {
  @override
  _StartingPageState createState() => _StartingPageState();
}

FirebaseUser mainUser ;


class _StartingPageState extends State<StartingPage> {


  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<mainModel>(
        builder: (context, child, mainModel) {
          return Scaffold(
            resizeToAvoidBottomPadding: false,
            body: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      flex: 77,
                      child: Container(
                        decoration: BoxDecoration(
//                          color: Colors.black12,
//                          border: Border.all(color: Colors.black12, width: 1),
                        ),
                        child: Align(
                          alignment: Alignment(0, 1),
                          child: CarouseWidget()
                        )
                      )
                  ),
                  Expanded(
                      flex: 23,
                      child: Container(
//                  color: Colors.greenAccent,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
//                         GoogleImg(mainModel),
                            SizedBox(
                              height: 8,
                            ),
                            StartedButton(),
                            SizedBox(
                              height: 8,
                            ),
                            SignUpText(),
                            SizedBox(
                              height: 8,
                            ),
                            MastersPageNav(),

                          ],
                        ),
                      )
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget StartedButton() {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignInPage()));
      },
      child: Text("Let's Get Started", style: TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400),),
      height: 60,
      padding: EdgeInsets.only(left: 50, right: 50),
      color: Colors.red[900],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
    );
  }

  Widget SignUpText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Doesn't have an account?"),
        GestureDetector(
          child: Text(
            "   Sign-Up", style: TextStyle(color: Colors.red, fontSize: 15),),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUpPage()));
          },
        )
      ],
    );
  }

  Widget MastersPageNav() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
//      crossAxisAlignment: CrossAxisAlignment.,
      children: <Widget>[
        Text("Have a Institute, ?"),
        GestureDetector(
          child: Text(
            "   Register Here     ", style: TextStyle(color: Colors.red, fontSize: 15),),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MasterSignIn()));
          },
        )
      ],
    );
  }

  Widget CarouseWidget(){
    return CarouselSlider(
        items:
         [
           "https://images.alphacoders.com/511/thumb-1920-511052.jpg",
           "https://cdn.lynda.com/course/415363/415363-636355567704869206-16x9.jpg",
           "https://c8.alamy.com/comp/PRJPKF/portrait-of-man-coding-programmer-PRJPKF.jpg",
           "https://funtechsummercamps.com/blog/wp-content/uploads/2019/07/coding-young.jpg",
           "https://ramsatt.com/wp-content/uploads/2019/04/koqnEF.jpg"
         ]
            .map( (i) {
          return Builder(
            builder: (BuildContext context) {
              return Material(
//                elevation: 20,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.amber
                    ),
                    child: Center(
                      child: Image.network(
                        i,
                        fit: BoxFit.cover,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height/1.36,
                      ),
                    )
                ),
              );
            },
          );
        }).toList(),
      height: MediaQuery
          .of(context)
          .size
          .height/1.36,
      autoPlay: true,
      pauseAutoPlayOnTouch: Duration(seconds: 5),
        viewportFraction: 0.9,
      enlargeCenterPage: true,


    );
  }
}
//  Widget GoogleImg(mainModel)
//  {
//    return InkWell(
//      splashColor: Colors.blue,
//
//      onTap: ()async {
//        print("tapped");
////        mainUser = await mainModel.SignInWithGoogleAuth();
////        mainUser = await SignInWithGoogleAuth();
//
////        if(mainUser.email != null)
////          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashBoardPage()));
////        else
////          print("not signIn");
//      },
//      child: Container(
//        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.blue),
//
//        child: Image.asset("utils/img/google.jpg", width: 68,height: 70,fit: BoxFit.fill,),
//      ),
//    );
//  }

//  final FirebaseAuth auth = FirebaseAuth.instance;
//  final GoogleSignIn googleSignIn = new GoogleSignIn();
//
//  GoogleSignInAuthentication googleAuth;
//
//
//  Future<FirebaseUser> SignInWithGoogleAuth() async {
//    print("1");
//    GoogleSignInAccount GSA = await googleSignIn.signIn();
//    print("2");
//    googleAuth = await GSA.authentication;
//    print("3");
//    AuthCredential credential = GoogleAuthProvider.getCredential(
//      accessToken: googleAuth.accessToken,
//      idToken: googleAuth.idToken,
//    );
//    print("4");
//    FirebaseUser user = await auth.signInWithCredential(credential);
//    print("5");
//    assert(user.email != null);
//    assert(user.displayName != null);
//    assert(!user.isAnonymous);
//    assert(await user.getIdToken() != null);
//    print("6");
//    final FirebaseUser currentUser = await auth.currentUser();
//    print("7");
//    assert(user.uid == currentUser.uid);
//    print("8");
//    print('signInWithGoogle succeeded: $user');
//    return currentUser;
//
//
//  }

//keytool -list -v -keystore debug.keystore -alias androiddebugkey -storepass android -keypass android
//keytool -list -v -alias androiddebugkey -keystore C:\Users\WELCOME\.android\debug.keystore

//keytool -genkey -v -keystore debug.keystore -storepass android -alias androiddebugkey -keypass android -keyalg RSA -keysize 2048 -validity 10000