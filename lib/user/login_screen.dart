import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:makeupproject/constants/callFunctions.dart';
import 'package:makeupproject/constants/mycolor.dart';
import 'package:makeupproject/provider/loginprovider.dart';
import 'package:makeupproject/provider/provider.dart';
import 'package:makeupproject/user/bottomnavigation_screen.dart';
import 'package:provider/provider.dart';

import '../constants/widget.dart';
import 'Otp_screen.dart';
import 'Register.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final FirebaseFirestore db = FirebaseFirestore.instance;
    LoginProvider loginProvider = Provider.of<LoginProvider>(context, listen: false);
    MainProvider mainProvider =
    Provider.of<MainProvider>(context, listen: false);


    return Container(
      height: height,
      width: width,
      decoration: bgImg(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: height / 28,
              width: width,
            ),
            Container(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  hdTxt("LOGIN"),
                  Consumer<LoginProvider>(
                    builder: (context,val,child) {
                      return tF(val.phoneController);
                    }
                  ),
                  Consumer<LoginProvider>(
                    builder: (context,val,child) {
                      return InkWell(
                          onTap: (){
                        if(val.phoneController.text.length==10&&val.phoneController.text!='') {
                          db.collection("USER").where("PHONE",isEqualTo: "+91${val.phoneController.text}").get().then((value) {
                            if(value.docs.isNotEmpty){
                              loginProvider. sendotp(context);


                            }else{
                              ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
                                backgroundColor: Colors.white,
                                content: Text(
                                    "Sorry you don't have access",
                                    style: TextStyle(color: cl23557,fontSize: 15,fontWeight: FontWeight.w800,)),
                              ));

                            }
                          });

                        }else{
                          ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
                            backgroundColor: Colors.white,
                            content: Text(
                                "Enter Valid PhoneNumber",
                                style: TextStyle(color: cl23557,fontSize: 15,fontWeight: FontWeight.w800,)),
                          ));
                        }
                       },
                          child: val.loader?const Center(child: CircularProgressIndicator(color: Colors.white,))
                              :button(" Get OTP",height / 25,width / 3));
                    }
                  ),

                ],
              ),
            ),
            Consumer<MainProvider>(
              builder: (context,value,child) {
                return InkWell(
                  onTap: (){
                    },
                    child: btmTxt("Don't have an account?","REGISTER",context,Register() ));
              }
            ),

          ],
        ),
      ),
    );
  }
}
