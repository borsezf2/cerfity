import 'package:coaching_app/pages/dashBoardPages/aroundYouElements/detailsOfInstitute.dart';
import 'package:flutter/material.dart';

class GlobalElement extends StatefulWidget {
  @override
  _GlobalElementState createState() => _GlobalElementState();
}

class _GlobalElementState extends State<GlobalElement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,

      child:
          Container(
            height: MediaQuery.of(context).size.height-130,
            width: MediaQuery.of(context).size.width,
//            color: Colors.black12,
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: 3,
                itemBuilder: (context,index){
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10,),
                      ShowCard(),
                    ],
                  );
                }
            ),
          ),

      );
  }
}


class ShowCard extends StatefulWidget {
  @override
  _ShowCardState createState() => _ShowCardState();
}

class _ShowCardState extends State<ShowCard> {
  @override
  Widget build(BuildContext context) {
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
//                child: DetailsOfInstitute(context),
            ),
          ],
        ),
      ),
    );
  }
}
