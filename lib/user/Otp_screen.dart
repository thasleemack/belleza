import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:makeupproject/constants/callFunctions.dart';
import 'package:makeupproject/constants/mycolor.dart';
import 'package:makeupproject/provider/provider.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../Admin/admin_home_screen.dart';
import '../constants/widget.dart';
import '../provider/loginprovider.dart';
import 'bottomnavigation_screen.dart';
import 'homepage.dart';
import 'login_screen.dart';

class OtpScreen extends StatelessWidget {
  String userId;
  String name;
  String address;
  String phone;
   OtpScreen({super.key, required this.userId,required this.name,required this.address,required this.phone});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      height: height,
      width: width,
      decoration: bgImg(),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          hdTxt("Enter OTP"),
          SizedBox(height: height/25,),
          Consumer<LoginProvider>(
              builder: (context22,vale,child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child:Pinput(
                    controller:vale.otpController,
                    length: 6,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    defaultPinTheme: PinTheme( decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10)),

                        textStyle:
                        TextStyle(fontWeight: FontWeight.bold),
                        height: 50,
                        width: 50,

                           ),

                    onCompleted: (pin){
                      vale.verify(context,userId,name,phone,address);

                    },
                  ),
                );
              }
          ),



          SizedBox(height: height/10,),
          // Consumer<MainProvider>(
          //   builder: (context,value,child) {
          //     return InkWell(
          //       onTap: (){
          //         callNext(context, AdminHomeScreen());
          //         },
          //         child: Consumer<LoginProvider>(
          //           builder: (context,value,child) {
          //             return button(" Submit",height / 25,width / 3,);
          //           }
          //         ));
          //   }
          // ),
        ],
      ),

        ));
  }
}
