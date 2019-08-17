import 'package:coaching_app/pages/dashBoardPage.dart';
import 'package:coaching_app/pages/signInPage.dart';
import 'package:coaching_app/pages/signUpPage.dart';
import 'package:coaching_app/scoped_models/mainModel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:firebase_auth/firebase_auth.dart';


TextEditingController emailController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();
TextEditingController phoneController = new TextEditingController();
TextEditingController nameController = new TextEditingController();
TextEditingController addressController = new TextEditingController();
TextEditingController pincodeController = new TextEditingController();
TextEditingController picurlController = new TextEditingController();

class MasterPage extends StatefulWidget {
//  final PageController PC = PageController(initialPage: 0);

  @override
  _MasterPageState createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Align(
                alignment: Alignment(-0.9, -0.9),
                child: IconButton(icon: Icon(Icons.arrow_back,color: Colors.red,), onPressed: (){
                  Navigator.pop(context);
                }),
              ),
              Align(
                alignment: Alignment(-0.2, -0.87),
                child: Text("Sign In as Institute",style: TextStyle(color: Colors.red,fontSize: 25,fontWeight: FontWeight.bold),),
              ),
//              Align(
//                alignment: Alignment(0, -0.5),
//                child: PageSelector(),
//              ),
              Align(
                alignment: Alignment(0, -0.2),
                child: SignUpMaster(context),
              ),
              Align(
                alignment: Alignment(0, 0.85),
                child: SignInButton(context),
              ),
              Align(
                alignment: Alignment(0, 0.95),
                child: SignInMasterPage(context),
              ),

            ],
          ),
        ),
      ),
    );
  }

//  changePage()
//  {
//    setState(() {
//      if(widget.PC.page==1)
//        return Colors.black12 ;
//      else
//        return Colors.transparent ;
//    });
//  }
//  Widget PageSelector()
//  {
//    return Container(
//      height: 50,
//      width: 300,
////    color: Colors.red,
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        crossAxisAlignment: CrossAxisAlignment.center,
//        children: <Widget>[
//          InkWell(
//            onTap: (){
//              setState(() {
//                widget.PC.jumpToPage(0) ;
//                print("tapped = "+widget.PC.page.toString());
//              });
//            },
//            splashColor: Colors.black12,
//
//            child: Container(
//              child: Center(child: Text("Password")),
//              height: 50,
//              width: 150,
//              color: Colors.black12,
//            ),
//          ),
//          InkWell
//            (
//            onTap: (){
//              setState(() {
//                widget.PC.jumpToPage(1) ;
//                print("tapped = "+widget.PC.page.toString());
//
//              });
//            },
//            splashColor: Colors.black12,
//
//            child: Container(
//              child: Center(child: Text("OTP")),
//              height: 50,
//              width: 150,
//
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//  Widget PageViewBox(context)
//  {
//    return Container(
//      height: MediaQuery.of(context).size.height/2,
//      width: MediaQuery.of(context).size.width/1.2,
//      child: PageView(
//        controller: widget.PC,
//        pageSnapping: true,
//        children: <Widget>[
//          SignInWithPassword(context),
//          SignInWithOTP(context),
//        ],
//      ),
//    );
//
//  }
}


Widget SignUpMaster(context)
{
  return SingleChildScrollView(
    child: Container(
      padding: EdgeInsets.only(right: 20,left: 20),
//    alignment: Alignment.centerLeft,
//      color: Colors.black12,
      height: MediaQuery.of(context).size.height/1.4,
      width: MediaQuery.of(context).size.width/1.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("E-mail ID",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
                icon: Icon(Icons.alternate_email),
                border:UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))
            ),

          ),
          SizedBox(height: 5,),

          Text("Password",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              icon: Icon(Icons.security),
              border: UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(2))),
            ),
            obscureText: true,
          ),
          SizedBox(height: 5,),
          Text("Phone Number",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
          TextField(
            controller: phoneController,
            decoration: InputDecoration(
                icon: Icon(Icons.phone),
                border:UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))
            ),

          ),
          SizedBox(height: 5,),
          Text("Intitute Name",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
                icon: Icon(Icons.business),
                border:UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))
            ),

          ),
          SizedBox(height: 5,),
          Text("Address",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
          TextField(
            controller: addressController,
            decoration: InputDecoration(
                icon: Icon(Icons.home),
                border:UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))
            ),

          ),
          SizedBox(height: 5,),
          Text("Pincode",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
          TextField(
            controller: pincodeController,
            decoration: InputDecoration(
                icon: Icon(Icons.pin_drop),
                border:UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))
            ),

          ),
          SizedBox(height: 10,),

//          Text("Forgot Password?",style: TextStyle(fontSize: 10),)
        ],
      ),
    ),
  );


}

Widget SignInWithOTP(context)
{
  return SingleChildScrollView(
    child: Container(
      padding: EdgeInsets.only(right: 20,left: 20),
//    alignment: Alignment.centerLeft,
//      color: Colors.black12,
      height: MediaQuery.of(context).size.height/2,
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

          ),
          SizedBox(height: 20,),

          Text("OTP",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
          TextField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(2))),
            ),
            obscureText: true,
          ),
//          SizedBox(height: 10,),
//          Text("Forgot Password?",style: TextStyle(fontSize: 10),)
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
            var user = await mainModel.signUpWithEmail(email: emailController.text,password: passwordController.text);
            print("user = " +user.toString());
            if(user == "ERROR_USER_NOT_FOUND" || user == "ERROR_WRONG_PASSWORD" )
            {
              Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text("                     "+user.toString()),
                  )
              );
            }
            else if (user != null) {
              mainModel.addMaster(
                  email: emailController.text,
                  name: nameController.text,
                  address: addressController.text,
                phone: phoneController.text,
                picurl: "",
                pincode: phoneController.text
              );
              Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text("user Registered "+user.email.toString()),
                  )
              );
            }

          },
          child: Text("Sign-Up",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight:FontWeight.w400),),
          height: 60,
          padding: EdgeInsets.only(left: 130,right: 130),
          color: Colors.red[900],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
        );}
  );
}

Widget SignInMasterPage(context)
{
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text("have an account?"),
      GestureDetector(
        child: Text("   Sign-in",style: TextStyle(color: Colors.red,fontSize: 15),),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));
        },
      )
    ],
  );


}



