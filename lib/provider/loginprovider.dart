import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:makeupproject/Admin/admin_home_screen.dart';
import 'package:makeupproject/constants/mycolor.dart';
import 'package:makeupproject/provider/provider.dart';
import 'package:makeupproject/user/bottomnavigation_screen.dart';
import 'package:provider/provider.dart';

import '../constants/callFunctions.dart';
import '../user/Otp_screen.dart';

class LoginProvider extends ChangeNotifier{

  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;



  String VerificationId='';
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  bool loader = false;

  void sendotp(BuildContext context) async {

    loader= true;
    notifyListeners();
    await auth.verifyPhoneNumber(
      phoneNumber: "+91${phoneController.text}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
               backgroundColor: Colors.white,
          content: Text(
              "Verification Completed",
              style: TextStyle(color: cl23557,fontSize: 20,fontWeight: FontWeight.w800,)),
          duration:
          Duration(milliseconds: 3000),
        ));
        if (kDebugMode) {}
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == "invalid-phone-number") {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(
            content:
            Text("Sorry, Verification Failed"),
            duration: Duration(milliseconds: 3000),
          ));
          if (kDebugMode) {

          }

        }
      },

      codeSent: (String verificationId, int? resendToken) {
        VerificationId = verificationId;
        loader= false;
        notifyListeners();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  OtpScreen(userId: '', name: '', address: '', phone: '', ),
            ));
        ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
             backgroundColor: Colors.white,
             content: Text(
              "OTP sent to phone successfully",style: TextStyle(color: cl23557,fontSize: 18,fontWeight: FontWeight.w600,)),
          duration:
          Duration(milliseconds: 3000),
        ));
        phoneController.clear();
        // print
        log("Verification Id : $verificationId");

      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 60),
    );
  }

  void verify(BuildContext context,String userId ,String name,String phone,String address) async {

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: VerificationId, smsCode: otpController.text);
    print(credential.toString()+"sjjss");
    await auth.signInWithCredential(credential).then((value) {
      final user = value.user;
      if (user != null) {

        userAuthorized(user.phoneNumber, context);

      } else {
        if (kDebugMode) {
        }
      }
    });
  }

  Future<void> userAuthorized(String? phoneNumber, BuildContext context) async {

    String loginUsername='';
    String loginUsertype='';
    String loginUserid='';
    String userId='';
    String loginphno="";
    String loginPhoto="";
    String address="";
    MainProvider mainProvider = Provider.of<MainProvider>(context, listen: false);

    try {
      var phone = phoneNumber!;
      print(phoneNumber.toString()+"duudud");
      db.collection("USER").where("PHONE",isEqualTo:phone).get().then((value) {
        if(value.docs.isNotEmpty){
          print("fiifuif");
          for(var element in value.docs) {
            Map<dynamic, dynamic> map = element.data();
            loginUsername = map['NAME'].toString();
            loginUsertype = map['TYPE'].toString();
            loginphno=map["PHONE"].toString();
            loginUserid = element.id;
            userId = map["USER_ID"].toString();
            notifyListeners();

            String uid = userId;
            print(loginUsertype);
            if (loginUsertype == "ADMIN") {

              print("cb bcb");
              callNextReplacement(context, const AdminHomeScreen());

            }

            else {
              print("mxnxn");

              db.collection("CUSTOMERS").doc(userId).get().then((value) {
                if(value.exists) {
                  address=value.get("ADDRESS").toString();

                  mainProvider.getMakeupList();
                  mainProvider.GetNewWork();
                  mainProvider.GetCustomerfn(userId);

                  callNextReplacement(context,Bottombar(userId: userId,userName: loginUsername,name: loginUsername,phone: loginphno,address: address,),);

                }

                });

                  print("dkdkdd");

            }
          }

        }
        else {
          const snackBar = SnackBar(
              backgroundColor: Colors.white,
              duration: Duration(milliseconds: 3000),
              content: Text("Sorry , You don't have any access",
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ));

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }

      });


    } catch (e) {


      // const snackBar = SnackBar(
      //     backgroundColor: Colors.white,
      //     duration: Duration(milliseconds: 3000),
      //     content: Text("Sorry , Some Error Occurred",
      //       textAlign: TextAlign.center,
      //       softWrap: true,
      //       style: TextStyle(
      //           fontSize: 18,
      //           color: Colors.black,
      //           fontWeight: FontWeight.bold),
      //     ));
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
   }
    }




}