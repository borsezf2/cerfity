import 'package:coaching_app/model/courseModel.dart';
import 'package:coaching_app/model/reviewModel.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:coaching_app/globals.dart' as globals;
import 'package:coaching_app/model/request.dart';


mixin FirebaseModelMethods on Model {

  FirebaseUser MainUser ;
  setUser(FirebaseUser user){
//    print("a");
    MainUser = user ;
    print("b = "+ MainUser.email);
    notifyListeners();
  }
  static String queryMaster = "masters";
   Stream mastersList = Firestore.instance.collection(queryMaster).snapshots();

//****************************************************************************************************************************
  List<CourseModel> CoursesList = [] ;
  int pass = 0 ;

  MasterListStart()async{

    List AA = await Firestore.instance.collection("masters")
        .getDocuments()
        .then((val) => val.documents);

//    print("AA =" + AA.length.toString());

    if(pass%1000 == 0)
    {
      CoursesList = [] ;
      for (int i=0;i<AA.length;i++)
      {
        Firestore.instance.collection("masters").document(
            AA[i].documentID.toString()).collection("courses").snapshots().listen(CreateListofCourses);


      }
    }
    pass ++ ;

//  notifyListeners();

    return CreateListofCourses ;
//            return CreateListofCourses ;

  }

  DisposeList(){
    CoursesList = [] ;
  }
  CreateListofCourses(QuerySnapshot snapshot)async
  {
    var listAA = [];

    var doc = snapshot.documents;
    var CourseListtemp ;
    if (doc.length > 0) {
      for (var document in doc) {
        listAA.add(document);
      }
//      print("lsitA length = " + listAA.length.toString());

      for (var D in listAA) {
          CoursesList.add(CourseModel.fromFireStore(D));
//        notifyListeners();

      }

        CourseListtemp = Set.of(CoursesList).toList() ;

//      print("lsit course length = " + CoursesList.length.toString());
//      print("lsit course  = " + CoursesList[0].course_name.toString());
//      notifyListeners();

    }

    notifyListeners();
    return CourseListtemp;
  }


//****************************************************************************************************************************

  //****************************************************************************************************************************
  List<CourseModel> MasterOwnCoursesList = [] ;
  int MasterOwnpass = 0 ;

  MasterOwnMasterListStart(String email)async{
//print("debug 1") ;
    List AA = await Firestore.instance.collection("masters").where("email",isEqualTo: email.toLowerCase())
        .getDocuments()
        .then((val) => val.documents);
//print("debug 2") ;

    if(MasterOwnpass%1000 == 0)
    {
//      print("AA master =" + AA.length.toString());

      Firestore.instance.collection("masters").document(
          AA[0].documentID.toString()).collection("courses").snapshots().listen(MasterOwnCreateListofCourses);
//      print("debug 3") ;
//      MasterOwnCoursesList = [] ;
//      for (int i=0;i<AA.length;i++)
//      {
//        Firestore.instance.collection("masters").document(
//            AA[i].documentID.toString()).collection("courses").snapshots().listen(MasterOwnCreateListofCourses);
//
//
//      }
    }
    MasterOwnpass ++ ;
//print("debug 4") ;
//  notifyListeners();

    return MasterOwnCreateListofCourses ;
//            return CreateListofCourses ;

  }

  MasterOwnDisposeList(){
    MasterOwnCoursesList = [] ;
  }
  MasterOwnCreateListofCourses(QuerySnapshot snapshot)async
  {
    var listAA = [];

    var doc = snapshot.documents;
    var MasterOwnCoursesListtemp ;
    if (doc.length > 0) {
      for (var document in doc) {
        listAA.add(document);
      }
//      print("lsitA length MasterOwn = " + listAA.length.toString());

      for (var D in listAA) {
        MasterOwnCoursesList.add(CourseModel.fromFireStore(D));
//        notifyListeners();

      }

      MasterOwnCoursesListtemp = Set.of(MasterOwnCoursesList).toList() ;

//      print("lsit course length = " + CoursesList.length.toString());
//      print("lsit course  = " + CoursesList[0].course_name.toString());
//      notifyListeners();

    }

    notifyListeners();
    return MasterOwnCoursesListtemp;
  }


//****************************************************************************************************************************
//****************************************************************************************************************************
  List<CourseModel> MasterOwnCertificateList = [] ;
  int MasterOwnpass2 = 0 ;

  MasterOwnCertificateListStart(String email)async{
//print("debug List of certicates") ;
    List AA = await Firestore.instance.collection("masters").where("email",isEqualTo: email.toLowerCase())
        .getDocuments()
        .then((val) => val.documents);
//print("debug 2") ;

    if(MasterOwnpass2%1000 == 0)
    {
//      print("AA master =" + AA.length.toString());

//      print("id = "+AA[0].documentID.toString());
      Firestore.instance.collection("masters").document(
          AA[0].documentID.toString()).collection("certificates").snapshots().listen(MasterOwnCreateListofCertificates);
//      print("debug 3") ;
//      MasterOwnCoursesList = [] ;
//      for (int i=0;i<AA.length;i++)
//      {
//        Firestore.instance.collection("masters").document(
//            AA[i].documentID.toString()).collection("courses").snapshots().listen(MasterOwnCreateListofCourses);
//
//
//      }
    }
    MasterOwnpass2 ++ ;
//print("debug 4") ;
//  notifyListeners();

    return MasterOwnCreateListofCertificates ;
//            return CreateListofCourses ;

  }

  MasterOwnDisposeList2(){
    MasterOwnCertificateList = [] ;
  }
  MasterOwnCreateListofCertificates(QuerySnapshot snapshot)async
  {
    var listAA = [];

    var doc = snapshot.documents;
    var MasterOwnCertificateListtemp ;
    if (doc.length > 0) {
      for (var document in doc) {
        listAA.add(document);
      }
//      print("lsitA length MasterOwn = " + listAA.length.toString());

      for (var D in listAA) {
        MasterOwnCertificateList.add(CourseModel.fromFireStore(D));
//        notifyListeners();

      }

      MasterOwnCertificateListtemp = Set.of(MasterOwnCertificateList).toList() ;

//      print("lsit course length = " + CoursesList.length.toString());
//      print("lsit course  = " + CoursesList[0].course_name.toString());
//      notifyListeners();

    }

    notifyListeners();
    return MasterOwnCertificateListtemp;
  }


//****************************************************************************************************************************



  Future addLearner(String email,String name,String college,String phone,int pincode)async{
    var data = {
      "type":"learner",
      "college":college,
      "email":email.toLowerCase(),
      "name":name,
      "pincode":pincode,
      "phone":phone,
    };
    DocumentReference DR = Firestore.instance.collection("learner").document(email.toLowerCase());
    DR.setData(data);
    globals.mainEmail = email ;
    notifyListeners();
  }
//****************************************************************************************************************************

  Future addMaster({String email,String name,String address,String phone,String pincode,String picurl}) async {
    var data = {
      "type":"master",
      "email":email.toLowerCase(),
      "name":name,
      "pincode":pincode,
      "phone":phone,
      "address":address,
      "pic_url":picurl
    };
    DocumentReference DR = Firestore.instance.collection("masters").document(email.toLowerCase());
    DR.setData(data);
    globals.mainEmail = email ;
    notifyListeners();
  }

//****************************************************************************************************************************
//****************************************************************************************************************************

  Future addCourse({String master_email,String master_name,String price,String details,String course_name}) async {
    var data = {
      "course_name":course_name.toLowerCase(),
      "price":price,
      "details":details,
      "master_email":master_email,
      "master_name":master_name,
    };
//    DocumentReference DR = Firestore.instance.collection("masters").document(email);
    DocumentReference DR = Firestore.instance.collection("masters").document(master_email.toLowerCase()).collection("courses").document(course_name.toLowerCase());
    DR.setData(data);
    globals.mainEmail = master_email ;
    notifyListeners();
  }

//****************************************************************************************************************************

  void createRequestList(email)async {
    print("p");

    List A = await Firestore.instance.collection("learner")
        .getDocuments()
        .then((val) => val.documents);
//    print("A = " + A.length.toString());
//    print("A6 = " + A[6].documentID.toString());
//    print("email = " + email);
    A.retainWhere((s) => s.documentID.toString().toLowerCase().contains(email.toLowerCase()));
//    print("AX = " + A.length.toString());
    Firestore.instance.collection("learner").document(
        A[0].documentID.toString()).collection("requests").snapshots().listen(CovertRequestToList);
    print("q");

  }


  List listA = [];
  List<Request> listB = [];
   void CovertRequestToList(QuerySnapshot snapshot){
    listA = [];
    listB = [];

    var doc = snapshot.documents ;

    if(doc.length>0){
      for(var document in doc){
        listA.add(document);
      }
      print("lsitA length = "+listA.length.toString());

      for(var D in listA){
        listB.add(Request.fromFireStore(D));
      }
//      print("lsitB length = "+listB.length.toString());
//      print("lsitB  = "+listB[0].status.toString());
      notifyListeners();

    }


    notifyListeners();

  }

//****************************************************************************************************************************

  void createMasterRequestList(email)async {
    print("p");

    List A = await Firestore.instance.collection("masters")
        .getDocuments()
        .then((val) => val.documents);
    print("AXb = " + A.length.toString());
//    print("A6 = " + A[6].documentID.toString());
//    print("email = " + email);
    A.retainWhere((s) => s.documentID.toString().toLowerCase().contains(email.toLowerCase()));
    print("AX = " + A.length.toString()+" and ID = "+A[0].documentID.toString());
    Firestore.instance.collection("masters").document(
        A[0].documentID.toString()).collection("requests").snapshots().listen(CovertRequestToListMaster);
    print("q");

  }


  List listA2 = [];
  List<Request> listB2 = [];
  void CovertRequestToListMaster(QuerySnapshot snapshot){
    listA2 = [];
    listB2 = [];

    var doc = snapshot.documents ;
    print("X doc len = "+doc.length.toString());
    if(doc.length>0){
      for(var document in doc){
        listA2.add(document);
      }
      print("lsitA length = "+listA2.length.toString());

      for(var D in listA2){
        listB2.add(Request.fromFireStore(D));
      }
//      print("lsitB length = "+listB.length.toString());
//      print("lsitB  = "+listB[0].status.toString());
      notifyListeners();

    }


    notifyListeners();

  }

//****************************************************************************************************************************
  Future SendRequest({CourseModel data_in,String date,String learner_name,bool status,String learner_email}) async {
    var data = {
      "course_name":data_in.course_name,
      "learner_name":learner_name,
      "master_name":data_in.master_name,
      "master_email":data_in.master_email,
      "price":data_in.price,
      "date":date,
      "status":false,
    };
//    DocumentReference DR = Firestore.instance.collection("masters").document(email);
//    data_in.master_email
    DocumentReference DR = Firestore.instance.collection("masters").document(data_in.master_email.toLowerCase()).collection("requests").document(data_in.course_name.toLowerCase());
    DocumentReference DR2 = Firestore.instance.collection("learner").document(learner_email.toLowerCase()).collection("requests").document(data_in.course_name.toLowerCase());
    DR.setData(data);
    DR2.setData(data);
//    globals.mainEmail = email ;
    notifyListeners();
  }
//****************************************************************************************************************************
//****************************************************************************************************************************


  Future ConfirmRequest({String master_email,String learner_email,String course_name}) async {
    var data = {
//      "course_name":data_in.course_name,
//      "learner_name":learner_name,
//      "master_name":data_in.master_name,
//      "price":data_in.price,
//      "date":date,
      "status":true,
    };
//    DocumentReference DR = Firestore.instance.collection("masters").document(email);
//    data_in.master_email
    DocumentReference DR = Firestore.instance.collection("masters").document(master_email.toLowerCase()).collection("requests").document((course_name+learner_email).toLowerCase());
    DocumentReference DR2 = Firestore.instance.collection("learner").document(learner_email.toLowerCase()).collection("requests").document((course_name+learner_email).toLowerCase());
    DR.setData(data);
    DR2.setData(data);
//    globals.mainEmail = email ;
    notifyListeners();
  }
//****************************************************************************************************************************
//****************************************************************************************************************************

  DeleteCourse(String master_email,String course_name){
    DocumentReference DR = Firestore.instance.collection("masters").document(master_email.toLowerCase()).collection("courses").document(course_name.toLowerCase());
    var x = DR.delete() ;
    print("Deleted");
  }
  //****************************************************************************************************************************
//****************************************************************************************************************************
  UploadImageForCourse(sampleImage)
  async {
    final StorageReference firebaseStorageRef =
    FirebaseStorage.instance.ref().child(sampleImage.toString());
    final StorageUploadTask task =
    firebaseStorageRef.putFile(sampleImage);
    return await (await task.onComplete).ref.getDownloadURL();

  }
  //****************************************************************************************************************************
//****************************************************************************************************************************
  PostReview(String master_email,String course_uid,String user_email,String comment,var rating)async{
    print("request sent to = "+"masters/${master_email.toLowerCase()}/courses/${course_uid}/reviews");
    print("comment = "+comment);
    var data = {
      "comment":comment.toString(),
      "rating":rating
    };
    Firestore.instance.collection("masters").document(master_email.toLowerCase()).collection("courses").document(course_uid).collection("reviews").document(user_email.toLowerCase()).setData(data);
//    print("dr = "+DR.toString());
    //    CollectionReference CR = Firestore.instance.collection("masters").document(master_email.toLowerCase()).collection("courses").document(course_name.replaceAll(" ", "").toLowerCase()).collection("reviews");

//    CR.document(user_email.toString().toLowerCase()).setData(data);

  }


//****************************************************************************************************************************
//****************************************************************************************************************************
  List<Review> ReviewList = [] ;
  int pass3 = 0 ;
  double averageRating = 2.5 ;
  GetReviews(String master_email,String course_uid)async{
//    ReviewList = [] ;
//    print("request asked from = "+"masters/${master_email.toLowerCase()}/courses/${course_uid}/reviews");
    var temp ;
    if ( pass3%1000==0) {
      pass3++ ;
      QuerySnapshot docs = await Firestore.instance.collection("masters")
          .document(master_email.toLowerCase()).collection("courses").document(
          course_uid).collection("reviews")
          .getDocuments();

      for (DocumentSnapshot docin in docs.documents) {
        ReviewList.add(Review.fromFireStore(docin));
      }
//      print("Reviews Length = " + ReviewList.length.toString());
       temp = ReviewList;

       double sum = 0 ;
       for (Review datain in ReviewList){
         sum += datain.rating ;
       }
      averageRating = sum/ReviewList.length ;
       print("AVERAGE = "+averageRating.toString());

    }
    notifyListeners();

    return temp ;
  }

}