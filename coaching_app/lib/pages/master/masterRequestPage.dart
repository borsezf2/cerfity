import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coaching_app/model/request.dart';
import 'package:coaching_app/scoped_models/firebase.dart';
import 'package:coaching_app/scoped_models/mainModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:coaching_app/globals.dart' as globals;
import 'package:scoped_model/scoped_model.dart';


class MasterRequestPage extends StatefulWidget {

  @override
  _MasterRequestPageState createState() => _MasterRequestPageState();
}

class _MasterRequestPageState extends State<MasterRequestPage> {
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
                itemCount: mainModel.listB2.length,
                itemBuilder: (context, index) {
//                  mainModel.createMasterRequestList(widget.email.toString());

                  var data = mainModel.listB2 ;
                  if(mainModel.listB2 ==null){
                    return LinearProgressIndicator();
                  }
                  return Card(
                    elevation: 20,
                    margin: EdgeInsets.all(5),

                    child: ListTile(
//                      dense: true,
                      title: Text("${data[index].course_name.toString()}"),
                      subtitle: Text("${data[index].master_name.toString()}"),
                      leading: CircleAvatar(child: Text("${data[index].price.toString()}"),),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text("Accepted ${data[index].status.toString()}", style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),),
                          IconButton(icon: Icon(Icons.check_circle),
                              onPressed: () {
                              ShowConfirmBox(context,data[index]);
                              }
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
  void ShowConfirmBox(context, Request data){

     showDialog(
        context: context,
        builder: (context){
          return ScopedModelDescendant<mainModel>(
              builder: (context,child,mainModel)
          {
            return AlertDialog(
              title: Text("confirm the request"),
              actions: <Widget>[
                IconButton(icon: Icon(Icons.clear),
                    onPressed: () {
                      print("not");
                      Navigator.pop(context);
                    }
                ),
                IconButton(icon: Icon(Icons.check_circle),
                    onPressed: () {
                      mainModel.ConfirmRequest(
                        learner_email: data.learner_name,
                        course_name: data.course_name,
                        master_email: data.master_email,
                      );
                      print("confirmed");
                      Navigator.pop(context);
                    }
                ),

              ],
            );
          });
        }
    );
  }
}



