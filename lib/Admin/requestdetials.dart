import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeupproject/Admin/requests.dart';
import 'package:makeupproject/constants/callFunctions.dart';
import 'package:makeupproject/provider/provider.dart';
import 'package:makeupproject/user/notifications.dart';
import 'package:provider/provider.dart';
import '../constants/widget.dart';

class Rqstdtls extends StatelessWidget {
  String id;
  String name;
  String appointment_date;
  String appointment_time;
  String address;
  String phone;
  String makeup_type;


   Rqstdtls({super.key,
     required this.id,
     required this.name,
     required this.appointment_date,
     required this.appointment_time,
     required this.address,
     required this.phone,
     required this.makeup_type,

   });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  SafeArea(
      child: Scaffold(
        appBar:AppBar(
          leading: Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Requests()));},
                icon: Icon(Icons.arrow_back_ios_new, color: Colors.white,)),
          ),
          toolbarHeight: height * 0.13,
          flexibleSpace: Image(
            image: AssetImage('assets/Ellipse 9.png'),
            fit: BoxFit.fill,
          ),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                  EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        txtstyl("BRIDE NAME", 16, Color(0xff988A9A)),
                        SizedBox(height: height / 150,),
                        txtfldadmn( height / 15,name,16,Color(0xff35103B),8),
                        SizedBox(height: height / 150,),
                        txtstyl( "SELECTED DATE", 16, Color(0xff988A9A)),
                        SizedBox(height: height / 150,),
                        txtfldadmn(height / 15,appointment_date,16,Color(0xff35103B),8),
                        SizedBox(height: height / 150,),
                        txtstyl("SELECTED TIME", 16, Color(0xff988A9A)),
                        SizedBox(height: height / 150,),
                        txtfldadmn(height/15,appointment_time,16,Color(0xff35103B),8),
                        SizedBox(height: height / 150,),
                        txtstyl( "ADDRESS", 16, Color(0xff988A9A)),
                        SizedBox(height: height / 150,),
                        txtfldadmn(height/10,address,16,Color(0xff35103B),8),
                        SizedBox(height: height / 150,),
                        txtstyl( "PHONE", 16, Color(0xff988A9A)),
                        SizedBox(height: height / 150,),
                        txtfldadmn(height / 15,phone,16,Color(0xff35103B),8),
                        SizedBox(height: height / 150,),
                        txtstyl("MAKEUP TYPE", 16,  Color(0xff988A9A)),
                        SizedBox(height: height / 150,),
                        txtfldadmn(height/15,makeup_type,16,Color(0xff35103B),8),
                        SizedBox(height: height /50,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(width: width/2.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),color: Color(0xff35103B),
                              ),
                              child: Consumer<MainProvider>(
                                builder: (context,value,child) {
                                  return TextButton(onPressed: (){
                                    value.acceptStatusUpdate(id);
                                    value.getAdminAppointments();
                                    value.callOnFcmApiSendPushNotifications(title: 'Hey Adil',body: 'your appointment has been accepted',fcmToken:'  csfZuC29QpOYKetM7H-CVU:APA91bHQb3EDKSd_QlLF6l_3ertKPNYsyT1WY74l08RLyTozNO0JvttkRHuTctOpXwE-vAgeP_8ShW6RKzbyup7W6U_KKZmzLibu1VmJWMdPSkFAtSBp-ez02FY4OtpecX_TfwSLSCEc',);
                                  back(context);


                                  },
                                      child:txtstyl("Accept",15,Colors.white),
                                     );
                                }
                              ),
                            ),
                            Consumer<MainProvider>(
                              builder: (context,value,child) {
                                return Container(width: width/2.5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),color: Color(0xff35103B),
                                  ),
                                  child: TextButton(onPressed: (){


                                    showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        backgroundColor: Color(0xffD9D9D9),

                                        content:  Text("Give a Reason",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'PoetsenOne',
                                            color:  Color(0xff35103B),
                                          ),),
                                        actions: <Widget>[
                                          Column(
                                            children: [
                                              Container(
                                                // height: height/5,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.black26
                                                ),
                                                child: TextFormField(
                                                  style:  TextStyle(
                                                      color: Colors.white, fontWeight: FontWeight.w200),
                                                  maxLines: 5,
                                                  decoration: InputDecoration(
                                                    hintText: "write something",
                                                    hintStyle: TextStyle(
                                                        color: Colors.white, fontWeight: FontWeight.w200),
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.of(ctx).pop();
                                                      },
                                                      child: Text("GO back",
                                                        style: TextStyle(fontSize: 20,  fontFamily: 'PoetsenOne',color:Color(0xffFF0000)
                                                        ),)),
                                                  TextButton(
                                                    onPressed: () {
                                                      value.rejectStatusUpdate(id);
                                                      value.getAdminAppointments();

                                                   back(context);
                                                    },

                                                    child: Text("Submit",
                                                      style: TextStyle(fontSize: 20,  fontFamily: 'PoetsenOne',color:Color(0xff35103B)
                                                      ),),
                                                  ),

                                                ],
                                              ),


                                            ],
                                          ),

                                        ],
                                      ),
                                    );
                                  },
                                      child:txtstyl("Reject",15,Colors.white),
                                     ),
                                );
                              }
                            ),
                          ],
                        )
                      ]),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
