import 'package:coaching_app/pages/dashBoardPages/requests/requestPage.dart';
import 'package:coaching_app/pages/drawerWidget.dart';
import 'package:coaching_app/pages/master/addCourse.dart';
import 'package:coaching_app/pages/master/masterCertificates.dart';
import 'package:coaching_app/pages/master/masterCourses.dart';
import 'package:coaching_app/pages/master/masterRequestPage.dart';
import 'package:coaching_app/pages/startingPage.dart';
import 'package:coaching_app/scoped_models/mainModel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class MasterDashBoard extends StatefulWidget {
  String email ;
  MasterDashBoard(this.email);

  @override
  _MasterDashBoardState createState() => _MasterDashBoardState();
}

class _MasterDashBoardState extends State<MasterDashBoard> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<mainModel>(
      builder: (context,child,mainModel) {
        return Scaffold(
            drawer: DrawerWidget(context,widget.email),
          appBar: AppBar(
            title: Text("Master"),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MasterCertificates(widget.email)));
                  })
            ],
          ),
          resizeToAvoidBottomPadding: false,
          body: MasterOwnAll(context,widget.email),
            floatingActionButton: FloatingActionButton(
//              heroTag: "FAB2",
              backgroundColor: Colors.red,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddCoursePage(widget.email)));
              },
              child: Icon(Icons.add),

            ),
        );
      }
    );
  }
}
