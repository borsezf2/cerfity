import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coaching_app/model/courseModel.dart';
import 'package:coaching_app/pages/dashBoardPages/aroundYouElements/detailsOfInstitute.dart';
import 'package:coaching_app/scoped_models/mainModel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
class AroundYouElement extends StatefulWidget {
  @override
  _AroundYouElementState createState() => _AroundYouElementState();
}






class _AroundYouElementState extends State<AroundYouElement> {


  mainModel mainModelobj = new mainModel();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    MasterListStart() ;
  }

@override
  void dispose() {
    // TODO: implement dispose
  mainModelobj.DisposeList() ;
  print("disposed");

  super.dispose();
  }
    @override
    Widget build(BuildContext context) {
      return ScopedModelDescendant<mainModel>(
          builder: (context, child, mainModel) {
//            var x = mainModelobj.MasterListStart();
//            print("XX course lsit " + mainModel.CoursesList.length.toString());

            return Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,

              child:
              Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height - 130,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
//            color: Colors.black12,
                  child:
                         StreamBuilder(
                           stream: mainModel.MasterListStart().asStream(),
                           builder: (context, snapshot) {
                             return mainModel.CoursesList.length == 0 ?
                        LinearProgressIndicator()
                                : ListView.builder(

                                padding: EdgeInsets.all(10),
                                itemCount: mainModel.CoursesList.length,
                                itemBuilder: (context, index) {
//                                  print("11");
                                  CourseModel data = mainModel.CoursesList[index];
//                                  print("11");
//                              var data = snap.data;
//                                  print("11");
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[

                                      SizedBox(height: 10,),
                                      ShowCard(data),
                                    ],
                                  );
                                }
                        );
                           }
                         )


              ),

            );
          }
      );
    }
  }





class ShowCard extends StatefulWidget {
  var data;
  ShowCard(this.data);

  @override
  _ShowCardState createState() => _ShowCardState();
}

class _ShowCardState extends State<ShowCard> {
  @override
  Widget build(BuildContext context) {
//    print("22");
    return Material(
      color: Colors.black12,
//    type: MaterialType.transparency,
      elevation: 15,
      shape: RoundedRectangleBorder( 
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),

        child: Container(
//        margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.blue
          ),
//        color: Colors.blue,
          height: 170,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[

          widget.data.pic_url==null?SizedBox(height: 0,)
              :
          Image.network(widget.data.pic_url,fit: BoxFit.fill,),
        Align(
          alignment: Alignment.bottomCenter,
          child: DetailsOfInstitute(context,widget.data),
        ),

            ],
          ),
        ),
      ),
    );
  }
}


