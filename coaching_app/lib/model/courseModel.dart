
import 'package:cloud_firestore/cloud_firestore.dart';

class CourseModel {

  String course_name;
  String price;
  String details;
  String pic_url;
  String master_name;
  String master_email;


  CourseModel({this.details,this.course_name,this.pic_url,this.price,this.master_name,this.master_email});

	factory CourseModel.fromFireStore(DocumentSnapshot doc)
	{
		Map data = doc.data ;

		return CourseModel(
			course_name: data['course_name'],
			master_name: data['master_name'],
			pic_url: data['pic_url'],
			details: data['details'],
			price: data['price']
		);
		}

}
