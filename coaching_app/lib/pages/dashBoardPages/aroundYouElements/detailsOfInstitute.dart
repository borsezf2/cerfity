import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coaching_app/model/courseModel.dart';
import 'package:coaching_app/pages/dashBoardPages/fullDetailsPages/CourseFullDetailsPage.dart';
import 'package:coaching_app/pages/master/FullDetailsPageForMaster.dart';
import 'package:flutter/material.dart';

Widget DetailsOfInstitute(context, CourseModel data)
{
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>CourseFullDetailsPage(data)));
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white.withOpacity(0.8),

      ),
      width: 350,
      height: 70,
      child: ListTile(
//      contentPadding: EdgeInsets.all(5),
        title: Text("${data.course_name} ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
        trailing: Text("${data.price}",style: TextStyle(color: Colors.black),),
        subtitle: Text("Tap to know more",style: TextStyle(color: Colors.black,fontSize: 10),),
        dense: true,

      ),
    ),
  );
}


Widget DetailsOfInstituteForMaster(context, CourseModel data)
{
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>FullDetailPageForMaster(data)));
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white.withOpacity(0.8),

      ),
      width: 350,
      height: 70,
      child: ListTile(
//      contentPadding: EdgeInsets.all(5),
        title: Text("${data.course_name} ",style: TextStyle(fontWeight: FontWeight.bold),),
        trailing: Text("${data.price}"),
        subtitle: Text("course details"),
        dense: true,

      ),
    ),
  );
}

