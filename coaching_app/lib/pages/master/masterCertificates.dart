import 'package:coaching_app/pages/drawerWidget.dart';
import 'package:coaching_app/pages/master/masterCerticates.dart';
import 'package:coaching_app/pages/master/masterCourses.dart';
import 'package:coaching_app/pages/master/masterRequestPage.dart';
import 'package:coaching_app/pages/startingPage.dart';
import 'package:coaching_app/scoped_models/mainModel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class MasterCertificates extends StatefulWidget {
  String email ;
  MasterCertificates(this.email);

  @override
  _MasterCertificatesState createState() => _MasterCertificatesState();
}

class _MasterCertificatesState extends State<MasterCertificates> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<mainModel>(
        builder: (context,child,mainModel) {
          return Scaffold(
              drawer: DrawerWidget(context,widget.email),
              appBar: AppBar(
                title: Text("Certificates"),
                actions: <Widget>[
                  IconButton(
                      icon: Icon(Icons.notifications_active),
                      onPressed: (){
                        mainModel.createMasterRequestList(widget.email.toString());
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MasterRequestPage()));
                      }),
                  IconButton(
                      icon: Icon(Icons.receipt),
                      onPressed: (){

                      })
                ],
              ),
              resizeToAvoidBottomPadding: false,
              body: MasterOwnAllCertificatesWidget(context,widget.email)
          );
        }
    );
  }
}
