
import 'package:cloud_firestore/cloud_firestore.dart';

class Review{

  String comment ;
  var rating ;

 Review({this.rating,this.comment});

  factory Review.fromFireStore(DocumentSnapshot doc){
    Map data = doc.data;

    return Review(
      comment: data['comment'],
      rating: data['rating'],
    );
  }
}