import 'package:coaching_app/model/courseModel.dart';
import 'package:coaching_app/scoped_models/mainModel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class FullDetailPageForMaster extends StatefulWidget {
  CourseModel data;
  FullDetailPageForMaster(this.data);

  @override
  _FullDetailPageForMasterState createState() => _FullDetailPageForMasterState();
}

class _FullDetailPageForMasterState extends State<FullDetailPageForMaster> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Course"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height+100,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Align(
                  alignment: Alignment(0,-0.95),
                  child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      elevation: 20,
                      child: Container(
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.topCenter,
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          child: Text("${widget.data.master_name.toString()}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),))
                  ),
                ),
                Align(
                  alignment: Alignment(0,-0.7),
                  child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      elevation: 20,
                      child: Container(
                          alignment: Alignment.topCenter,
                          width: MediaQuery.of(context).size.width,
                          height: 45,
                          padding: EdgeInsets.all(10),
                          child: Text("Certificate ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                      )
                  ),
                ),
                Align(
                  alignment: Alignment(-0.97,-0.5),
                  child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      elevation: 20,
                      child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text("${widget.data.course_name}",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20),))),
                ),
                Align(
                  alignment: Alignment(0.9,-0.5),
                  child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      elevation: 20,
                      child: Container(
                          padding: EdgeInsets.all(10),

                          child: Text("${widget.data.price} /-",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)))),
                ),
                Align(
                  alignment: Alignment(0,0.2),
                  child: Description(context,widget.data),
                ),
                Align(
                  alignment: Alignment(0,0.95),
                  child: DeleteCourseButton(context,widget.data),
                )
              ],
            ),
          )
      )
      ,
    );
  }
}

Widget Description(context,data){

  return Material(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
    elevation: 20,
    child: Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.blue[100],),
      padding: EdgeInsets.all(20),
      height: 300,
      width: MediaQuery.of(context).size.width-20,
      child: SingleChildScrollView(child: Text("${data.details}")),
    ),
  );
}

Widget DeleteCourseButton(context,CourseModel data){
  return ScopedModelDescendant<mainModel>(
      builder: (context, child, mainModel)
      {
        return MaterialButton(

          onPressed: () {
            String learner ;
            mainModel.getUser().then((user) async {
              learner = user.email ;
              print("request email getter = "+learner.toString());

              ShowConfirmBoxtoDelete(context, user.email,data.course_name);

            });

            print("request sent");
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("Course Delted"),
            ));
          },
          child: Text("Delete this course", style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400),),
          height: 60,
          padding: EdgeInsets.only(left: 100, right: 100),
          color: Colors.red,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
        );
      });



}
void ShowConfirmBoxtoDelete(context,email,course_name){

  showDialog(
      context: context,
      builder: (context){
        return ScopedModelDescendant<mainModel>(
            builder: (context,child,mainModel)
            {
              return AlertDialog(
                title: Text("confirm the Deletion"),
                actions: <Widget>[
                  IconButton(icon: Icon(Icons.clear),
                      onPressed: () {
                        print("not");
                        Navigator.pop(context);
                      }
                  ),
                  IconButton(icon: Icon(Icons.check_circle),
                      onPressed: () {
                        mainModel.DeleteCourse(email, course_name);
                        print("confirmed deleted");
                        Navigator.pop(context);
                      }
                  ),

                ],
              );
            });
      }
  );
}
//}