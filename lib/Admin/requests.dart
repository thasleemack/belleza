import 'package:flutter/material.dart';
import 'package:makeupproject/Admin/requestdetials.dart';
import 'package:makeupproject/constants/callFunctions.dart';
import 'package:makeupproject/constants/mycolor.dart';
import 'package:makeupproject/provider/provider.dart';
import 'package:provider/provider.dart';

import '../constants/widget.dart';
import 'admin_home_screen.dart';

class Requests extends StatelessWidget {
   Requests({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(
          title: Padding(
            padding: EdgeInsets.only(bottom: 30, left: 70),
            child: txtstyl( "Requests",20,Colors.white)
          ),
          leading: Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AdminHomeScreen()));
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                )),
          ),
          toolbarHeight: height * 0.13,
          flexibleSpace: Image(
            image: AssetImage('assets/Ellipse 9.png'),
            fit: BoxFit.fill,
          ),
          backgroundColor: Colors.transparent,
        ),
        // extendBodyBehindAppBar: true,
        body: Consumer<MainProvider>(
          builder: (context,value,child) {
            return ListView.builder(itemCount: value.appointmentList.length,
              itemBuilder: (context, index) {
              var item=value.appointmentList[index];
              return  InkWell(
                onTap: (){
                  if(item.status=="Requested"){
                    callNext(context, Rqstdtls(name: item.name,appointment_date: item.appointment_date,appointment_time: item.appointment_time,address: item.address,makeup_type: item.makeup_type,phone: item.phone,id: item.id));


                  }


                },
                child: Container(
                    margin: EdgeInsets.all(5),
                    height: height/6,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      boxShadow: [BoxShadow(blurRadius: 1,offset: Offset(0, 1))],
                      color:Color(0xff988A9A),
                    ),
                    child:  Padding(
                      padding:  EdgeInsets.all(8),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            txtstyl( "Bride Name :"+item.name,18,Colors.white),
                            txtstyl( "Date: "+item.appointment_date,18,Colors.white),
                            // Padding(
                            //   padding:  EdgeInsets.only(left: height/2.5),
                            //   child: IconButton(onPressed: (){
                            //     callNext(context, Rqstdtls(name: item.name,appointment_date: item.appointment_date,appointment_time: item.appointment_time,address: item.address,makeup_type: item.makeup_type,phone: item.phone,id: item.id));
                            //     }, icon: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,)),
                            // ),
                            Container(margin: EdgeInsets.only(left: height/4,top: height/50,),
                              // height: 30,width: 150,
                              child: Center(child: Text(item.status,style: TextStyle(fontFamily: "PoetsenOne",color: cl23557),)),
                              ),

                          ]),
                    )

                ),
              );

            },

            );
          }
        ),
      ),
    );
  }
}
