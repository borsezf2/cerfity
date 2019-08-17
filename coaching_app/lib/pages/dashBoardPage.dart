import 'package:coaching_app/pages/dashBoardPages/aroundYou.dart';
import 'package:coaching_app/pages/dashBoardPages/global.dart';
import 'package:coaching_app/pages/dashBoardPages/myBucket.dart';
import 'package:coaching_app/pages/dashBoardPages/requests/requestPage.dart';
import 'package:coaching_app/pages/drawerWidget.dart';
import 'package:coaching_app/pages/master/masterDashBoard.dart';
import 'package:coaching_app/pages/startingPage.dart';
import 'package:coaching_app/scoped_models/mainModel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:coaching_app/globals.dart' as globals;


class DashBoardPage extends StatefulWidget {
  String email ;
  DashBoardPage(this.email);

  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = new TabController(length: 3, vsync: this,initialIndex: 1);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<mainModel>(
      builder: (context,child,mainModel) {
        return
          Scaffold(
            drawer: DrawerWidget(context,widget.email),
            appBar: AppBar(
              backgroundColor: Colors.red,
//              leading: Center(child: IconButton(
//                  icon: Icon(Icons.cancel), onPressed: () async{
//
//                    bool logOut = await mainModel.SignOut();
//
//                    if(logOut)
//                      {
//                        Navigator.pushReplacement(context,
//                            MaterialPageRoute(builder: (context) => StartingPage()));
//                      }
//
//              }),),
              bottom: TabBarBox(),
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.notifications_active), onPressed: () {
//                      print("learner/${widget.email}/requests");
                mainModel.createRequestList(widget.email.toString());
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RequestPage()));
                }),
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person),
                ),
//                IconButton(
//                    icon: Icon(Icons.details),
//                    onPressed: (){
//                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MasterDashBoard(widget.email)));
//                    })
              ],
            ),
            body: TabBarView(
              controller: tabController,
              children: <Widget>[
                MyBucketPage(),
                AroundYouPage(),
                GlobalPage(),
              ],
            ),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  height: 40,
                  width: 40,
                  child: FloatingActionButton(
                    heroTag: "FAB3",

                    backgroundColor: Colors.red,
                    onPressed: () {},
                    child: Icon(Icons.cake),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FloatingActionButton(
                  heroTag: "FAB2",
                  backgroundColor: Colors.red,
                  onPressed: () {},
                  child: Icon(Icons.add),

                )
              ],
            ),
          );
      }
    );
  }

  Widget TabBarBox()
  {
    return TabBar(
      controller: tabController,
    tabs: <Widget>[
      Tab(
        text: "My Bucket",
      ),
      Tab(
        text: "Around You",
      ),
      Tab(
        text: "Global",
      )
    ],
    );
  }

}


