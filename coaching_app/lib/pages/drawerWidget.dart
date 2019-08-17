import 'package:coaching_app/pages/startingPage.dart';
import 'package:coaching_app/scoped_models/mainModel.dart';
import 'package:coaching_app/scoped_models/theme/theme_change_page.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';


Widget DrawerWidget(context, String email){
  return ScopedModelDescendant<mainModel>(
    builder: (context,child,mainModel) {
      return
        Drawer(
          elevation: 20,
          child: ListView(
            shrinkWrap: true,

            children: <Widget>[
              ClipPath(
                  child: MainHead2(mainModel,email),
                clipper: WaveClipperOne(),
              ),
              Container(
//                color: Colors.black12,
                height: MediaQuery.of(context).size.height /1.44,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Align(
                  alignment: Alignment(0, 1),
                    child: SignOutTile(mainModel, context)),
                Align(
                    alignment: Alignment(0, -0.95),
                    child: UserProfile()
                ),
                Align(
                    alignment: Alignment(0, -0.5),
                    child: ThemeMode(mainModel,context)
                ),
              ],
            ),

              )
//
            ],
          ),

        );

//
    }
  );
}

Widget MainHead2(mainModel,email){
 return Container(
//         color: Colors.black12,
 margin: EdgeInsets.all(0),
 decoration: BoxDecoration(
   image: DecorationImage(image: AssetImage("img/matrix.gif"),fit: BoxFit.fitWidth)
 ),
   padding: EdgeInsets.only(left: 10,bottom: 20),
   alignment: Alignment.centerLeft,
   child: Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: <Widget>[
       SizedBox(
         height: 25,
       ),
       Text("User's Email",style: TextStyle(color: Colors.white,fontSize: 10),),
       SizedBox(
         height: 10,
       ),
       Text(email,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
       SizedBox(
         height: 10,
       ),
       CircleAvatar(
         backgroundColor: Colors.red,
         radius: 30,
         child: Text(email[0],style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
       ),

     ],
   ),
 );

}
Widget MainHead(mainModel,email)
{
  return UserAccountsDrawerHeader(
    decoration: BoxDecoration(
//      color: Colors.red
        image: DecorationImage(image: AssetImage("img/matrix.gif"),fit: BoxFit.fill)
    ),
      accountName: Text("User's Email"),
      accountEmail: Text(email,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
    currentAccountPicture: CircleAvatar(
      backgroundColor: Colors.red,
      radius: 30,
      child: Text(email[0],style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
    ),
  );
}

Widget SignOutTile(mainModel,context){
  return GestureDetector(
    onTap: ()async{
      bool logOut = await mainModel.SignOut();

      if(logOut)
      {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => StartingPage()));
      }
      print("signed out");
    },
    child: Container(
      padding: EdgeInsets.all(10),
      child: Material(
        elevation: 20,
shadowColor: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Container(
          height: 50,
          width: 280,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
//          color: Colors.redAccent,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.red[800] , Colors.red[400] , Colors.red[200]]
          )
          ),
          child: Center(child: Text("SIGN OUT",style: TextStyle(color: Colors.white),)),
        ),
      ),
    ),
  );
}

Widget UserProfile()
{
  return GestureDetector(
    onTap: ()async{
      print("User profile");
    },
    child: Container(
      padding: EdgeInsets.all(10),
      child: Material(
        elevation: 10,
        shadowColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Container(
          height: 60,
          width: 280,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
//          color: Colors.redAccent,
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
//                  colors: [Colors.red[600] , Colors.red[400] , Colors.red[200]]
                  colors: [Colors.blue[800] , Colors.blue[600] , Colors.blue[200]]
              )
          ),
          child: Center(child: ListTile(

            title: Text("Users Profile",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person,color: Colors.black,),
            ),
          )
          )),
        ),
      ),
    );
}

Widget ThemeMode(mainModel mainModel,context)
{
  return GestureDetector(
    onTap: ()async{
//      print("Theme Mode");
//      mainModel.ToggleTheme() ;
    Navigator.push(context, MaterialPageRoute(builder: (context)=>PreferencePage()));
    },
    child: Container(
      padding: EdgeInsets.all(10),
      child: Material(
        elevation: 10,
        shadowColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Container(
            height: 60,
            width: 280,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
//          color: Colors.redAccent,
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
//                  colors: [Colors.red[600] , Colors.red[400] , Colors.red[200]]
                    colors: [Colors.blue[800] , Colors.blue[600] , Colors.blue[200]]
                )
            ),
            child: Center(child: ListTile(

              title: Text("Change Theme",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.swap_horizontal_circle,color: Colors.black,),
              ),
            )
            )),
      ),
    ),
  );
}

