import 'package:coaching_app/model/courseModel.dart';
import 'package:coaching_app/pages/dashBoardPages/aroundYouElements/detailsOfInstitute.dart';
import 'package:coaching_app/scoped_models/mainModel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

Widget MasterOwnAllCertificatesWidget(context,email)
{
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
            color: Colors.black,
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
                  stream: mainModel.MasterOwnCertificateListStart(email).asStream(),
                  builder: (context, snapshot) {
                    return mainModel.MasterOwnCertificateList.length == 0 ?
                    LinearProgressIndicator()
                        : ListView.builder(

                        padding: EdgeInsets.all(10),
                        itemCount: mainModel.MasterOwnCertificateList.length,
                        itemBuilder: (context, index) {
//                          print("X 11");
                          CourseModel data = mainModel.MasterOwnCertificateList[index];
//                          print("X 12");
//                              var data = snap.data;
//                          print("X 13");
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

            Align(
              alignment: Alignment.bottomCenter,
              child: DetailsOfInstitute(context,widget.data),
            ),
          ],
        ),
      ),
    );
  }
}


