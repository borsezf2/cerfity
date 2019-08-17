
import 'package:cloud_firestore/cloud_firestore.dart';

class Request{

  bool status ;
  String course_name;
  String price;
  String date ;
  String learner_name ;
  String master_name ;
  String master_email ;

  Request({this.status ,this.course_name,this.price,this.date,this.learner_name,this.master_name,this.master_email});

  factory Request.fromFireStore(DocumentSnapshot doc){
    Map data = doc.data;

    return Request(
      status: data['status'],
      course_name: data['course_name'],
      price: data['price'],
      date: data['date'],
      learner_name: data['learner_name'],
      master_name: data['master_name'],
      master_email: data['master_email'],

    );
  }
}