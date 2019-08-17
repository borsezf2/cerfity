import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coaching_app/scoped_models/firebase.dart';
import 'package:coaching_app/scoped_models/mainModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:coaching_app/globals.dart' as globals;

class RequestPage extends StatefulWidget {

  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUser();

  }
  FirebaseUser mainUser ;
  final FirebaseAuth auth = FirebaseAuth.instance;
  getUser() async{
    mainUser = await auth.currentUser();
//          print("mainUser = "+ await mainUser.email);
  }
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<mainModel>(
      builder: (context,child,mainModel)  {

        return Scaffold(
          appBar: AppBar(
            elevation: 25,
            backgroundColor: Colors.red,
            title: Text("Requests"),
            centerTitle: true,
          ),
          body:
                ListView.builder(
                    itemCount: mainModel.listB.length,
                    itemBuilder: (context, index) {
                      var data = mainModel.listB ;
                      if(mainModel.listB ==null){
                        return LinearProgressIndicator();
                      }
                      return Card(
                        elevation: 20,
                        margin: EdgeInsets.all(5),

                        child: ListTile(
                          dense: true,
                          title: Text("Intitute Name"),
                          subtitle: Text("course name at 27/8/19"),
                          leading: CircleAvatar(child: Text("500"),),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text("Accepted ${data[index].status.toString()}", style: TextStyle(
                                  color: Colors.green, fontWeight: FontWeight.bold),),
                              IconButton(icon: Icon(Icons.check_circle),
                                  onPressed: () {}
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ),
        );
      }
    );
  }
}

