import 'package:coaching_app/pages/dashBoardPage.dart';
import 'package:coaching_app/scoped_models/mainModel.dart';
import 'package:flutter/material.dart';
import 'package:coaching_app/pages/signInPage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

TextEditingController emailController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();
TextEditingController phoneController = new TextEditingController();
TextEditingController collegeController = new TextEditingController();
TextEditingController nameController = new TextEditingController();
TextEditingController pincodeController = new TextEditingController();

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<mainModel>(
        builder: (context,child,mainModel)
    {
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
                  alignment: Alignment(-0.5, -0.87),
                  child: Text("Sign Up", style: TextStyle(color: Colors.red,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),),
                ),
                Align(
                  alignment: Alignment(0, -0.35),
                  child: SignUpBox(context,mainModel),
                ),
                Align(
                  alignment: Alignment(0, 0.85),
                  child: Terms(),
                ),
                Align(
                  alignment: Alignment(0, 0.85),
                  child: SignUpButton(context),
                ),
                Align(
                  alignment: Alignment(0, 0.95),
                  child: SignIn(context),
                ),

              ],
            ),
          ),
        ),
      );
    });
    }
  }


Widget Terms()
{
  return Container(
    height: 100,
    width: 300,
    child: Column(
      children: <Widget>[
        Text("Terms and Conditions",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
        Text("By continuing, do you agree to our terms and privacy policies",textAlign: TextAlign.center,style: TextStyle(fontSize: 10),)
      ],
    ),
  );
}
Widget SignUpButton(context,){
  return
    ScopedModelDescendant<mainModel>(
        builder: (context,child,mainModel)
  {
    return MaterialButton(
      onPressed: () async{
        FirebaseUser user = await mainModel.signUpWithEmail(email: emailController.text,password: passwordController.text);
        print("user = " +user.toString());
         if (user != null) {
           mainModel.addLearner(
               emailController.text, nameController.text, collegeController.text ,phoneController.text, int.parse(pincodeController.text));

           // sign in successful!
          // ex: bring the user to the home page
//          Navigator.pushReplacement(
//              context, MaterialPageRoute(builder: (context) => DashBoardPage()));
        } else {
          // sign in unsuccessful
          // ex: prompt the user to try again
          print("error.....");
        }

      },
      child: Text("Create Account", style: TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400),),
      height: 60,
      padding: EdgeInsets.only(left: 100, right: 100),
      color: Colors.red[900],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
    );
  });
}

Widget SignIn(context)
{
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text("Already a user?"),
      GestureDetector(
        child: Text("   Sign-In",style: TextStyle(color: Colors.red,fontSize: 15),),
        onTap: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignInPage()));
        },
      )
    ],
  );
}

Widget SignUpBox(context,mainModel)
{
  return SingleChildScrollView(
    child: Container(
      padding: EdgeInsets.only(right: 20,left: 20),
//    alignment: Alignment.centerLeft,
//      color: Colors.black12,
      height: MediaQuery.of(context).size.height/1.5,
      width: MediaQuery.of(context).size.width/1.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("E-mail ID",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
          TextField(
            decoration: InputDecoration(
                border: UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(2)))
            ),
            controller: emailController,
          ),
          SizedBox(height: 10,),
          Text("Password",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              border: UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(2))),
            ),
            obscureText: true,
          ),
          SizedBox(height: 5,),
          Text("Phone Number",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
          TextField(
            decoration: InputDecoration(
                border: UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(2)))
            ),
            controller: phoneController,
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 5,),
          Text("College Name",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
          TextField(
            decoration: InputDecoration(
                border: UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(2)))
            ),
            controller: collegeController,
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 5,),
          Text("Learner's Name",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
          TextField(
            decoration: InputDecoration(
                border: UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(2)))
            ),
            controller: nameController,
          ),
          SizedBox(height: 5,),
          Text("pincode Number",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
          TextField(
            decoration: InputDecoration(
                border: UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(2)))
            ),
            controller: pincodeController,
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 10,),
          Text("Forgot Password?",style: TextStyle(fontSize: 10),)
        ],
      ),
    ),
  );


}