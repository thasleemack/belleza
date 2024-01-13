import 'dart:collection';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import 'package:intl/intl.dart';
import 'package:makeupproject/constants/callFunctions.dart';
import '../models/mymodels.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



class MainProvider extends ChangeNotifier {

  final FirebaseFirestore db = FirebaseFirestore.instance;
  final DatabaseReference mRoot = FirebaseDatabase.instance.ref();
  firebase_storage.Reference ref = FirebaseStorage.instance.ref("Images");


  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();




  List<String> Carosuelimg = [
    "assets/bride athulya.png",
    "assets/airbrush makeup 1.png",
    "assets/bride keerthana.png",
  ];
  int indextab = 0;

  int Activeindex = 0;

  void activeIndex(int index) {
    Activeindex = index;
    notifyListeners();
  }


  void tabIndex(int value) {
    indextab = value;
    notifyListeners();
    print(indextab);
  }

  List<MakeupType> makeupTypeList = [];

  void addMakeupType(String Mkid, String from) {
    String id = DateTime.now()
        .millisecondsSinceEpoch
        .toString();
    HashMap<String, Object> map = HashMap();
    map["NAME"] = nameController.text.toString();
    map["DESCRIPTION"] = descriptionController.text.toString();
    map["PRICE"] = priceController.text.toString();
    map["ADDED_BY"] = '';
    map["TIME"] = DateTime.now();

    if (from == "NEW") {
      map["MAKEUPTYPE_ID"] = id;
      db.collection("MAKEUP_TYPE").doc(id).set(map);
    } else {
      db.collection("MAKEUP_TYPE").doc(Mkid).update(map);
    }
    getMakeupList();
    notifyListeners();
  }

  void getMakeupList() {
    db.collection("MAKEUP_TYPE").get().then((value) {
      if (value.docs.isNotEmpty) {
        makeupTypeList.clear();
        for (var value in value.docs) {
          makeupTypeList.add(MakeupType(
            value.id, value.get("NAME"), value.get("DESCRIPTION"),
            value.get('PRICE'),));
          notifyListeners();
          print(makeupTypeList.length.toString() + "xyz");
        }
      }
    });
  }

  void getEditdata(String mid) {
    db.collection("MAKEUP_TYPE").doc(mid).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic> map = value.data() as Map;
        nameController.text = map["NAME"].toString();
        descriptionController.text = map["DESCRIPTION"].toString();
        priceController.text = map["PRICE"].toString();
        notifyListeners();
      }
    });
  }

  void deleteMakeuptype(Mkid, context) {
    db.collection("MAKEUP_TYPE").doc(Mkid).delete();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      content: Text("Deleted"),
      backgroundColor: Color(0xff523557),));

    getMakeupList();
    notifyListeners();
  }

  void clear() {
    nameController.clear();
    descriptionController.clear();
    priceController.clear();
  }

  TextEditingController BdnameController = TextEditingController();
  TextEditingController TypeController = TextEditingController();
  TextEditingController DescriptonController = TextEditingController();
  TextEditingController PriceController = TextEditingController();
  TextEditingController MakeuptypeController = TextEditingController();
  List<NewworkModel> newWorkList = [];
  String imageUrl = '';
  File? fileImage;
  List<File> fileImageList =[];

  Future<void> addNewWork(BuildContext context, String from, String nId) async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();

    HashMap<String, Object> newmap = HashMap();
    HashMap<String, Object> ImageMap = HashMap();
    newmap["BRIDE"] = BdnameController.text.toString();
    newmap["MAKEUP_TYPE"] = MakeuptypeController.text.toString();
    newmap["DESCRIPTION"] = DescriptonController.text.toString();
    newmap["PRICE"] = PriceController.text.toString();
    newmap["ADDED_BY"] = '';
    newmap["TIME"] = DateTime.now();

    if(fileImageList.isNotEmpty){
      int k=0;
      for(File i in fileImageList){
        k++;
        String imgKey="Image$k";
        String time = DateTime.now().millisecondsSinceEpoch.toString();
        ref = firebase_storage.FirebaseStorage.instance.ref().child(time);
        await ref.putFile(i).whenComplete(() async {
          await ref.getDownloadURL().then((value) async {
            ImageMap[imgKey] = value;
          });
        });
      }
    }else{
      int j=0;
      for(var i in imageList){
        j++;
        String imgKey="Image$j";
        ImageMap[imgKey]=i;

      }
    }
    newmap["PHOTO"]=ImageMap;
    if (from == "NEW") {
      db.collection("NEW_WORK").doc(id).set(newmap);
      GetNewWork();
      // finish(context);
    } else {
      db.collection("NEW_WORK").doc(nId).update(newmap);
    }
    notifyListeners();
  }


  Future getImagegallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      // setImage(File(pickedImage.path));
      cropImage(pickedImage.path);
      // print("hjkl"+pickedImage.path);
    } else {
      print('No image selected.');
    }
  }

  Future getImagecamera() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      // print("dfghjk"+pickedImage.path);
      cropImage(pickedImage.path);
      // setImage(File(pickedImage.path));

    } else {
      print('No image selected.');
    }
  }

  Future<void> cropImage(String path) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      fileImage = File(croppedFile.path);
      fileImageList.add(fileImage!);
      notifyListeners();
    }
  }
  void GetNewWork(){
    db.collection("NEW_WORK").get().then((value1) {
      if (value1.docs.isNotEmpty) {
        newWorkList.clear();
        for (var value in value1.docs) {
          Map<dynamic,dynamic> map = value.data();
  List<String> workImageList =[];

          if(map["PHOTO"]!=null||map["PHOTO"]!='') {
            map["PHOTO"].forEach((key,value){
            workImageList.add(value);
            });
          }else{
            map["PHOTO"]='';
          }
          newWorkList.add(NewworkModel(
              value.id,
              map["BRIDE"].toString(),
              map["DESCRIPTION"].toString(),
              map["MAKEUP_TYPE"].toString(),
              workImageList,
              map["PRICE"].toString(),
              ));
          notifyListeners();
        }
        notifyListeners();
      }
    });
  }

  List<String> imageList=[];

  void editNewwork(String nId) {
    List<dynamic> img=[];
    imageList.clear();
    db.collection("NEW_WORK").doc(nId).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic> map = value.data() as Map;

        BdnameController.text = map["BRIDE"].toString();
        MakeuptypeController.text = map["MAKEUP_TYPE"].toString();
        DescriptonController.text = map["DESCRIPTION"].toString();
        PriceController.text = map["PRICE"].toString();
        // for(var e in map["PHOTO"]){
        //   imageList.add(e.toString());
        //   notifyListeners();
        // }
        map["PHOTO"].forEach((key,value1){
          imageList.add(value1);
          notifyListeners();
        });

        notifyListeners();
      }
    });
  }

  void DeleteWork(nId, context) {
    db.collection("NEW_WORK").doc(nId).delete();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(
      content: Text("Deleted"),
      backgroundColor: Color(0xff523557),
    ));
    GetNewWork();
    notifyListeners();
  }

  void Clearwork() {
    BdnameController.clear();
    MakeuptypeController.clear();
    DescriptonController.clear();
    PriceController.clear();
    fileImage = null;
    imageUrl = '';
    fileImageList.clear();
  }

//   Register
  TextEditingController NameController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

// void clrRgFn(){
//   NameController.clear();
//   PhoneController.clear();
//   addressController.clear();
//   notifyListeners();
//
// }
  Future<void> AddCustomers(String from , String userId) async {
    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    HashMap<String, Object> customermap = HashMap();
    customermap["NAME"] = NameController.text.toString();
    customermap["PHONE"] = PhoneController.text.toString();
    customermap["ADDRESS"] = addressController.text.toString();
    customermap["ADDED_TIME"] = DateTime.now();
    customermap["fcmid"] = getToken();
    // customermap["ADDED_BY"] = "";


    HashMap<String, Object> usermap = HashMap();
    usermap["NAME"] = NameController.text.toString();
    usermap["TYPE"] = "USER";
    usermap["PHONE"] = "+91${PhoneController.text}";
    usermap["fcmid"] = getToken();


    if (profileFileImage != null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();

      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(profileFileImage!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          customermap["PHOTO"] = value;
          // categorymap["id photo"] = photoId;
          //  editMap['IMAGE_URL'] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    }
    else {
      customermap['PHOTO'] = Profileimage;
      // editMap['IMAGE_URL'] = imageUrl;
    }

    if(from=="NEW"){
      customermap["USER_ID"] = id;
      usermap["USER_ID"] = id;
    }








    if(from=="NEW"){
      db.collection("CUSTOMERS").doc(id).set(customermap);
      db.collection("USER").doc(id).set(usermap);
    }else{
      db.collection("CUSTOMERS").doc(userId).update(customermap);
      db.collection("USER").doc(userId).update(usermap);

    }
    GetCustomerfn(userId);

  }
  String userid="";
  // String username="";
  // String userphone="";
  // String useraddress="";
  String Profileimage="";


  void GetCustomerfn(String userId){
    print(userId+"fhf");
    db.collection("CUSTOMERS").doc(userId).get().then((value) {

      if(value.exists){

        userid= value.id;
        NameController.text=value.get("NAME").toString();
       addressController.text=value.get("ADDRESS").toString();
       PhoneController.text=value.get("PHONE").toString();
       Profileimage=value.get("PHOTO").toString();
       notifyListeners();
       print(userId+"xxxdxyz");
       // print(username+"huh");
       // print(useraddress+"huh");
       // print(userphone+"huh");
      }
    });
  }


// Date picker

  TimeOfDay _time = TimeOfDay.now();
  DateTime _date = DateTime.now();
  DateTime scheduledTime = DateTime.now();
  DateTime scheduledDate = DateTime.now();
  String scheduledDayNode = "";
  var outputDateFormat = DateFormat('dd/MM/yyyy');
  var outputTimeFormat = DateFormat('hh:mm a');
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();


  // Future<void> selectDateAndTime(BuildContext context) async {
  //
  //   await _selectDate(context);
  //   await _selectTime(context);
  // }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      _date = picked;
      scheduledDate = DateTime(_date.year, _date.month, _date.day);
      dateController.text = outputDateFormat.format(scheduledDate);
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );

    if (picked != null) {
      _time = picked;
      scheduledDayNode =
          _date.year.toString() + '/' + _date.month.toString() + '/' +
              _date.day.toString();
      scheduledTime = DateTime(
          _date.year, _date.month, _date.day, _time.hour, _time.minute);
      timeController.text = outputTimeFormat.format(scheduledTime);
    }
  }

// appointment
  TextEditingController brideNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController AddressController = TextEditingController();


  List<appointmentModel> appointmentList = [];


  void addBookAppointment(String userId,context) {
    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    HashMap<String, Object> appointmentMap = HashMap();
    appointmentMap["NAME"] = brideNameController.text.toString();
    appointmentMap["PHONE"] = phoneController.text.toString();
    appointmentMap["APPOINTMENT_DATE"] = dateController.text;
    appointmentMap["APPOINTMENT_TIME"] = timeController.text;
    appointmentMap["ADDRESS"] = AddressController.text.toString();
    appointmentMap["MAKEUP_TYPE"] = MakeuptypeController.text.toString();
    appointmentMap["ADDED_TIME"] = DateTime.now();
    appointmentMap["USER_ID"] = userId;
    appointmentMap["ADDED_BY"] = "";
    appointmentMap["APPOINTMENT_ID"] = id;
    appointmentMap["STATUS"] = "Requested";
    db.collection("APPOINTMENTS").doc(id).set(appointmentMap);
    getUserAppointments(userId);
    finish(context);
    notifyListeners();

  }

  // for user
  void getUserAppointments(String userId) {
    db.collection("APPOINTMENTS").where("USER_ID", isEqualTo: userId)
        .get()
        .then((value) {
      print("abc");
      if (value.docs.isNotEmpty) {
        appointmentList.clear();
        for (var value in value.docs) {
          print(value.get("MAKEUP_TYPE") + "hfbh");

          appointmentList.add(appointmentModel(
              value.id,
              value.get("NAME").toString(),
              value.get("PHONE").toString(),
              value.get('APPOINTMENT_DATE').toString(),
              value.get("APPOINTMENT_TIME").toString(),
              value.get('ADDRESS').toString(),
              value.get("MAKEUP_TYPE").toString(),
              value.get("STATUS").toString()));
          notifyListeners();

          print(makeupTypeList.length.toString() + "xyz");
          notifyListeners();
        }
      }
    });
  }

  // for admin

  void getAdminAppointments() {
    db.collection("APPOINTMENTS").get().then((value) {
      print("abc");
      if (value.docs.isNotEmpty) {
        appointmentList.clear();
        for (var value in value.docs) {
          print(value.get("MAKEUP_TYPE") + "hfbh");
          appointmentList.add(appointmentModel(
              value.id,
              value.get("NAME"),
              value.get("PHONE"),
              value.get('APPOINTMENT_DATE'),
              value.get("APPOINTMENT_TIME"),
              value.get('ADDRESS'),
              value.get("MAKEUP_TYPE"),
              value.get("STATUS").toString()));
          notifyListeners();

          print(makeupTypeList.length.toString() + "xyz");
          notifyListeners();
        }
      }
    });
  }
  void appointmentClr(){
    brideNameController.clear();
   phoneController.clear();
   dateController.clear();
   timeController.clear();
   AddressController.clear();
   MakeuptypeController.clear();

  }

  void acceptStatusUpdate(String id) {
    HashMap<String, Object> Acceptmap = HashMap();
    Acceptmap["STATUS"] = "Accepted";
    Acceptmap["ACCEPTED_TIME"] = DateTime.now();

    db.collection("APPOINTMENTS").doc(id).update(Acceptmap);
  }

  void rejectStatusUpdate(String id) {
    HashMap<String, Object> RejectMap = HashMap();
    RejectMap["STATUS"] = "Rejected";
    RejectMap["REJECTED_TIME"] = DateTime.now();
    db.collection("APPOINTMENTS").doc(id).update(RejectMap);
  }

//   query
  TextEditingController queryController = TextEditingController();
  List<QueryClass> queryList = [];


  void queryFn(String userId,) {
    String name = "";

    db.collection("USER").doc(userId).get().then((value) {
      name = value.get("NAME").toString();
      notifyListeners();

      String id = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();
      HashMap<String, Object> queryMap = HashMap();
      queryMap["USER_NAME"] = name;
      queryMap["QUERY"] = queryController.text.toString();
      queryMap["USER_ID"] = userId;
      queryMap["TIME"] = DateTime.now();
      db.collection("QUERIES").doc(id).set(queryMap);
      getQuery();
      notifyListeners();
    });
  }

  void getQuery() {
    db.collection("QUERIES").get().then((value)  {
      print("abc");
    if(value.docs.isNotEmpty){
        queryList.clear();
    for (var value in value.docs) {
      queryList.add(QueryClass(value.id, value.get("USER_NAME").toString(), value.get("QUERY").toString()));
      notifyListeners();

    }

  }
    notifyListeners();
    });
    notifyListeners();
  }

//   reviews
  TextEditingController reviewController = TextEditingController();
  List<ReviewModel> reviewList = [];

  void clearReviews(){
    reviewController.clear();

  }


void addReviews(String userId,double rating,String userName ){

    String id= DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
  HashMap<String, Object> reviewMap = HashMap();
    reviewMap["REVIEW"] = reviewController.text.toString();
    reviewMap["RATING"] = rating;
    reviewMap["USER_ID"] = userId;
    reviewMap["USER_NAME"] = userName;
    reviewMap["TIME"] = DateTime.now();
    reviewMap["REVIEW_ID"] = id;
    db.collection("REVIEWS").doc(id).set(reviewMap);
    getReviews();
    notifyListeners();

}
void getReviews(){
  db.collection("REVIEWS").get().then((value) {
    if(value.docs.isNotEmpty){
      reviewList.clear();
      for(var value in value.docs){
        reviewList.add(ReviewModel(value.id, value.get("REVIEW").toString(), value.get("RATING").toString(),value.get("USER_NAME")));
        notifyListeners();
      }
      notifyListeners();


    }
    notifyListeners();


  });
}
File? profileFileImage;


  Future getProfileImageGallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropProfileImage(pickedImage.path);
    } else {
      print('No image selected.');
    }
  }

  Future getProfileImageCamera() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      cropProfileImage(pickedImage.path);

    } else {
      print('No image selected.');
    }
  }

  Future<void> cropProfileImage(String path) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      profileFileImage = File(croppedFile.path);
      notifyListeners();
    }
  }
  String loginphoto="";
  String loginname="";

  void getUserPhoto(String userId,String userName) {
    print("dbd");
    db.collection("CUSTOMERS").where("USER_ID",isEqualTo: userId).get().then((value) {
      if(value.docs.isNotEmpty){
        loginphoto=value.docs.last.get("PHOTO").toString();
        loginname=value.docs.last.get("NAME").toString();
        notifyListeners();
        print("dwg"+loginphoto);
      }


    });

  }
//   Firebase Messaging

  //   fcm Token:
  // cv4cqlDzQv6OCJTGHkXJx9:APA91bHbPQ2-7N2LbCSP82I5mDo6KJVhwLGlIbhU-NefzaYkH7Sy6_05VrcduGLwzhgj8N_iZvF5WqZVPhBh_4Tuv9_4qv19iiiNG5oXbsysYAKhEylaNQLtqamG6hFzEeQh5Aqjz5Vp

   Future<String> getToken() async{
    String fcmid="";
    await FirebaseMessaging.instance.getToken().then((newToken){
      print('FCM Token:');

      fcmid=newToken.toString();
      print(newToken);
      // saveToken(newToken!);

    });
    return fcmid;
}
Future<void> saveToken(String token) async {
  String id = DateTime
      .now()
      .millisecondsSinceEpoch
      .toString();
    await FirebaseFirestore.instance.collection("User Tokens").doc(id).set({
      'token':token,
    });

}

@override
void initState(){
    // super.initSate();
  getToken();
    requestPermission();
    // initInfo();
}
 void requestPermission() async{
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true
    );
    if(settings.authorizationStatus == AuthorizationStatus.authorized){
      print('user granted permission');
    }else if(settings.authorizationStatus == AuthorizationStatus.provisional){
      print('user granted provisional permission');
    }else{
      print('user declined or has not accepted permission');
    }
 }
 // late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
 // initInfo(){
 //    var androidInitialize = const AndroidInitializationSettings("@mipmap/ic_launcher");
 //    var initializationSettings = InitializationSettings(android: androidInitialize);
 //    flutterLocalNotificationsPlugin.initialize(initializationSettings,
 //    //     onSelectNotification:(String? payload) async {
 //    //   try{
 //    //     if(payload!=null && payload.isNotEmpty){
 //    //
 //    //     }else{}
 //    //   }catch(e){
 //    //
 //    //   }return;
 //    // }
 //    );
 //    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
 //      print("______________________Message________________________");
 //      print("onMessage:${message.notification!.title}/${message.notification?.body}}");
 //      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
 //        message.notification!.body.toString(),htmlFormatBigText: true,
 //        contentTitle: message.notification!.title.toString(),htmlFormatContentTitle: true,
 //      );
 //      AndroidNotificationDetails androidPlatformChannelSpecifics= AndroidNotificationDetails(
 //          'channelId', 'channelName',importance: Importance.max,
 //        styleInformation: bigTextStyleInformation,priority: Priority.max,playSound: false,
 //      );
 //      NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
 //      await flutterLocalNotificationsPlugin.show(0, message.notification?.title, message.notification?.body,
 //          platformChannelSpecifics,payload: message.data["title"]);
 //    });
  Future<bool> callOnFcmApiSendPushNotifications(
      {
        required String title,
        required String body,
        required String fcmToken,
        // required String imageLink
      }) async {
    Uri posturlGroup = Uri.parse('https://fcm.googleapis.com/fcm/notification');

    final headersGroup = {
      'content-type': 'application/json',
      'Authorization':
      'key=AAAAAGgcaxE:APA91bEoFL4UA6FTrveZplu_AuGfuqoSAhLr37u-o80tFGndClAtbjaEPLFwKqhfSUA2_IRXbbiY2voM0w4ewc028EnbVHTV1St6LH1dtTsLNViSZpZoFF3aNgNo1K8Uu22DQJrPQIhv',
      // '
      // key=YOUR_SERVER_KEY'
      'project_id': '1746692881'
    };
    final dataGroup = {
      "operation": "create",
      "notification_key_name": DateTime.now().toString(),
      "registration_ids": fcmToken,
    };


    final response1 = await http.post(posturlGroup,
        body: json.encode(dataGroup),
        encoding: Encoding.getByName('utf-8'),
        headers: headersGroup);

    final Map parsed = json.decode(response1.body);
    var notificaitonKey = parsed["notification_key"];

    Uri postUrl = Uri.parse('https://fcm.googleapis.com/fcm/send');
    final data = {
      "to": notificaitonKey,

      "notification": {"title": title, "body": body, },
      "data": {
        "type": '0rder',
        "id": '28',
        "click_action": 'FLUTTER_NOTIFICATION_CLICK',
      }
    };



    final headers = {
      'content-type': 'application/json',
      'Authorization':
      'key=AAAAAGgcaxE:APA91bEoFL4UA6FTrveZplu_AuGfuqoSAhLr37u-o80tFGndClAtbjaEPLFwKqhfSUA2_IRXbbiY2voM0w4ewc028EnbVHTV1St6LH1dtTsLNViSZpZoFF3aNgNo1K8Uu22DQJrPQIhv',
      // 'key=YOUR_SERVER_KEY'
    };


    final response = await http.post(postUrl,
        body: json.encode(data),
        encoding: Encoding.getByName('utf-8'),
        headers: headers);
    print("abc");
    print("${response.body.toString()} (response)");

    if (response.statusCode == 200) {
      // on success do sth
      print('test ok push CFM');
      return true;
    } else {
      print('CFM error');
      // on failure do sth
      return false;
    }
  }
  bool _isNewNotification = false;

  bool get isNewNotification => _isNewNotification;

  void setNewNotification(bool value) {
    _isNewNotification = value;
    notifyListeners();
  }


  Future<bool> callOnFcmApiSendPushNotificationss({
    required String title,
    required String body,
    required String fcmToken,
  }) async {
    final Uri posturlGroup = Uri.parse('https://fcm.googleapis.com/fcm/notification');
    final headersGroup = {
      'content-type': 'application/json',
      'Authorization': 'key=AAAAAGgcaxE:APA91bEoFL4UA6FTrveZplu_AuGfuqoSAhLr37u-o80tFGndClAtbjaEPLFwKqhfSUA2_IRXbbiY2voM0w4ewc028EnbVHTV1St6LH1dtTsLNViSZpZoFF3aNgNo1K8Uu22DQJrPQIhv', // Replace with your server key
      'project_id': '1746692881', // Replace with your project ID
    };

    final dataGroup = {
      "operation": "create",
      "notification_key_name": DateTime.now().toString(),
      "registration_ids": [fcmToken],
    };

    final response1 = await http.post(
      posturlGroup,
      body: json.encode(dataGroup),
      encoding: Encoding.getByName('utf-8'),
      headers: headersGroup,
    );

    final Map parsed = json.decode(response1.body);
    final notificaitonKey = parsed["notification_key"];

    final Uri postUrl = Uri.parse('https://fcm.googleapis.com/fcm/send');
    final data = {
      "to": notificaitonKey,
      "notification": {"title": title, "body": body},
      "data": {
        "type": 'order',
        "id": '28',
        "click_action": 'FLUTTER_NOTIFICATION_CLICK',
      }
    };

    final headers = {
      'content-type': 'application/json',
      'Authorization': 'key=AAAAAGgcaxE:APA91bEoFL4UA6FTrveZplu_AuGfuqoSAhLr37u-o80tFGndClAtbjaEPLFwKqhfSUA2_IRXbbiY2voM0w4ewc028EnbVHTV1St6LH1dtTsLNViSZpZoFF3aNgNo1K8Uu22DQJrPQIhvY', // Replace with your server key
    };

    final response = await http.post(
      postUrl,
      body: json.encode(data),
      encoding: Encoding.getByName('utf-8'),
      headers: headers,
    );

    print("${response.body.toString()} (response)");

    if (response.statusCode == 200) {
      // on success do sth
      print('Test OK: Push FCM');
      return true;
    } else {
      print('FCM Error');
      // on failure do sth
      return false;
    }
  }

  // Future<bool> callOnFcmApiSendPushNotifications({
  //   required String title,
  //   required String body,
  //   required String fcmToken,
  // }) async {
  //   Future<void> sendPushNotification() async {
  //     String title = "Test Notification";
  //     String body = "This is a test notification.";
  //     String fcmToken = "YOUR_TARGET_FCM_TOKEN"; // Replace with the actual FCM token
  //
  //     bool success = await callOnFcmApiSendPushNotifications(
  //       title: title,
  //       body: body,
  //       fcmToken: fcmToken,
  //     );
  //
  //     if (success) {
  //       // Handle success
  //     } else {
  //       // Handle failure
  //     }
  //   }
  //   // The provided function goes here...
  //
  // }
  // Future<void> sendPushNotification() async {
  //   String title = "Test Notification";
  //   String body = "This is a test notification.";
  //   String fcmToken = "YOUR_TARGET_FCM_TOKEN"; // Replace with the actual FCM token
  //
  //   bool success = await callOnFcmApiSendPushNotifications(
  //     title: title,
  //     body: body,
  //     fcmToken: fcmToken,
  //   );
  //
  //   if (success) {
  //     // Handle success
  //   } else {
  //     // Handle failure
  //   }
  // }

// dynamic link

  late String _dynamicLink;

  String get dynamicLink => _dynamicLink;

  void setDynamicLink(String link) {
    _dynamicLink = link;
    notifyListeners();
  }

}
















