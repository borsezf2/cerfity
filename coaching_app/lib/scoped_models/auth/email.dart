import 'package:scoped_model/scoped_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:coaching_app/globals.dart' as globals;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

mixin SignInWithEmail on Model  {

  final FirebaseAuth auth = FirebaseAuth.instance;
   FirebaseUser mainUser ;
  String email ;


  Future SignOut()async{

    await auth.signOut();
    return true;

  }

  Future<FirebaseUser> getUser() async {
    mainUser = await auth.currentUser() ;
//    globals.mainEmail = mainUser.email ;
    notifyListeners();
    return await auth.currentUser();

  }



  Future<FirebaseUser> signUpWithEmail({String email,String password}) async {
    // marked async
    FirebaseUser user;
    try {
      user = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

    } catch (e) {
      print(e.toString());
    } finally {
      if (user != null) {
        // sign in successful!
        // ex: bring the user to the home page
        mainUser = user ;
        email = user.email ;
        print("Signed up = "+ user.email );
        notifyListeners() ;
        return user;
      } else {
        // sign in unsuccessful
        // ex: prompt the user to try again
        print("error.....");
        notifyListeners() ;

      }
    }
  }

  Future signInWithEmail({String email,String password}) async {
    // marked async
    FirebaseUser user;

    try {
      user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print("E code = " + e.code.toString());
//      print("E mssg = " + e.message.toString());

      print(e.toString());
      return e.code.toString() ;
    } finally {
      if (user != null) {
        // sign in successful!
        // ex: bring the user to the home page
        print("Signed up = " );
//        String type = authorizeAdmin();

        print("hey yoyooy = ");
        return user;
      } else {
        // sign in unsuccessful
        // ex: prompt the user to try again
        print("error" );

      }
    }
  }

  Future signInWithEmailMaster({String email,String password}) async {
    // marked async
    FirebaseUser user;
    String type ;
print("debug 1");
    try {
      user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      print("debug 2");
    } catch (e) {
      print("E code = " + e.code.toString());
//      print("E mssg = " + e.message.toString());
      SignOut();
      print(e.toString());
      return e.code.toString() ;
    } finally {
      print("debug 4");
      if (user != null) {
        print("debug 5");
        // sign in successful!
        // ex: bring the user to the home page
        print("Signed up = " );
        DocumentSnapshot DS ;

        List<DocumentSnapshot> b = await Firestore.instance.collection("masters")
            .where("email", isEqualTo: email.toString().toLowerCase())
            .getDocuments()
            .then((val) => val.documents) ;
        print("b "+b.length.toString());

//         type = authorizeAdmin(b[0]);
         type = b[0].data['type'];

        print("debug type "+ type);
        if(type=="master")
          {
            print("Master authorized ");
            return user;
          }
          else
            {
              SignOut();
              return type ;
            }

      } else {
        // sign in unsuccessful
        // ex: prompt the user to try again
        SignOut();
        print("error" );

      }
    }
  }

  authorizeAdmin(DocumentSnapshot DS) async {
    var AdminData ;
//    DocumentSnapshot DS ;
//  Stream<QuerySnapshot> A = 0 ;
    print("debug P");


    print("debug Q DS length"+DS.toString());

    AdminData = DS.data['type'] ;

    String type ;
    print("debug A admin data = "+AdminData.toString());

    print("debug B and type = "+type.toString());

    print("debug C");
    return type ;

  }

}




//FirebaseAuth.instance.currentUser().then((user) {
//AdminData =  Firestore.instance
//    .collection('masters')
////          .where('email', isEqualTo: email.toLowerCase())
//    .getDocuments()
//    .then((docs){
//print("debug X");
//if (docs.documents[0].exists) {
//print("debug Y");
//if (docs.documents[0].data['type'] == 'master') {
////          Navigator.push(
////              context,
////              new MaterialPageRoute(
////                  builder: (BuildContext context) => new AdminPage()));
//print('master Authorized');
//type = AdminData[0].data['type'] ;
////          return  type;
//} else {
//print('master Not Authorized');
//type = "not master" ;
//}
//}
//}
//);
//});


//{
