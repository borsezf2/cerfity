import 'package:coaching_app/pages/dashBoardPage.dart';
import 'package:coaching_app/pages/master/masterDashBoard.dart';
import 'package:coaching_app/pages/masterPage.dart';
import 'package:coaching_app/pages/signUpPage.dart';
import 'package:coaching_app/scoped_models/mainModel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:firebase_auth/firebase_auth.dart';


TextEditingController emailController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();

class MasterSignIn extends StatefulWidget {

  @override
  _MasterSignInState createState() => _MasterSignInState();
}

class _MasterSignInState extends State<MasterSignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Align(
                alignment: Alignment(-0.9, -0.9),
                child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.red,),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
              Align(
                alignment: Alignment(-0.7, -0.7),
                child: Text("Sign In", style: TextStyle(color: Colors.red,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),),
              ),
//              Align(
//                alignment: Alignment(0, -0.5),
//                child: PageSelector(),
//              ),
              Align(
                alignment: Alignment(0, -0.2),
                child: SignInWithPassword(context),
              ),
              Align(
                alignment: Alignment(0, 0.85),
                child: SignInButton(context),
              ),
              Align(
                alignment: Alignment(0, 0.95),
                child: SignUp(context),
              ),

            ],
          ),
        ),
      ),
    );
  }
}



Widget SignInWithPassword(context)
{
  return SingleChildScrollView(
    child: Container(
      padding: EdgeInsets.only(right: 20,left: 20),
//    alignment: Alignment.centerLeft,
//      color: Colors.black12,
      height: MediaQuery.of(context).size.height/2,
      width: MediaQuery.of(context).size.width/1.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("E-mail ID",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
                icon: Icon(Icons.alternate_email),
                border:UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))
            ),

          ),
          SizedBox(height: 20,),

          Text("Password",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              icon: Icon(Icons.security),
              border: UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(2))),
            ),
            obscureText: true,
          ),
          SizedBox(height: 30,),
          Text("Forgot Password?",style: TextStyle(fontSize: 10),)
        ],
      ),
    ),
  );


}



Widget SignInButton(context){
  return ScopedModelDescendant<mainModel>(
      builder: (context,child,mainModel)
      {
        return MaterialButton(
          onPressed: ()async{
            var user = await mainModel.signInWithEmailMaster(email: emailController.text,password: passwordController.text);
//      print("user email = "+user.email);
            if(user == "ERROR_USER_NOT_FOUND" || user == "ERROR_WRONG_PASSWORD" )
            {
              Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text("                     "+user.toString()),
                  )
              );
            }
            else if (user.email != null) {
              // sign in successful!
              // ex: bring the user to the home page
//          Navigator.pushReplacement(

              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MasterDashBoard(user.email.toString())));
            }
            else {
              // sign in unsuccessful
              // ex: prompt the user to try again
              print("error.....");
              Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text("ERROR"),
                  )
              );
            }
          },
          child: Text("Sign-In",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight:FontWeight.w400),),
          height: 60,
          padding: EdgeInsets.only(left: 130,right: 130),
          color: Colors.red[900],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
        );}
  );
}

Widget SignUp(context)
{
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text("Doesn't have an account?"),
      GestureDetector(
        child: Text("   Sign-un",style: TextStyle(color: Colors.red,fontSize: 15),),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MasterPage()));
        },
      )
    ],
  );


}



