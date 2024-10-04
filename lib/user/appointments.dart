import 'package:flutter/material.dart';
import 'package:makeupproject/provider/provider.dart';
import 'package:makeupproject/user/profile_screen.dart';
import 'package:provider/provider.dart';

import '../constants/callFunctions.dart';
import '../constants/mycolor.dart';

class Appointments extends StatelessWidget {
  const Appointments({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar( leading:Padding(
          padding:  const EdgeInsets.only(bottom: 30),
          child: IconButton(
              onPressed: (){
           finish(context);
           },
              icon: const Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
        ),
          title: Padding(
            padding: EdgeInsets.only(bottom: 30, left: 40),
            child: Text(
              ' Appointments',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'PoetsenOne',
                color: Colors.white,
              ),
            ),
          ),


          toolbarHeight: height * 0.13,
          flexibleSpace: Image(
            image: AssetImage('assets/Ellipse 9.png'),
            fit: BoxFit.fill,
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Consumer<MainProvider>(
          builder: (context,value,child) {
            return ListView.builder(itemCount: value.appointmentList.length,
              itemBuilder: (context, index) {
              var item=value.appointmentList[index];
                return Container(height: height/3.9,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,boxShadow: [BoxShadow(offset: Offset(0, 2),blurRadius: 2,color: Colors.grey)]),
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Bride Name : ${item.name}",style: TextStyle(fontFamily: 'PoetsenOne',color: cl23557,),),
                          Text("Appointment date: ${item.appointment_date}",style: TextStyle(fontFamily: 'PoetsenOne',color: cl23557,),),
                          Text("Appointment time: ${item.appointment_time}",style: TextStyle(fontFamily: 'PoetsenOne',color: cl23557,),),
                          Text("Address : ${item.address}",style: TextStyle(fontFamily: 'PoetsenOne',color: cl23557,),),
                          Text("Phone : ${item.phone}",style: TextStyle(fontFamily: 'PoetsenOne',color: cl23557,),),
                          Text("Makeup type : ${item.makeup_type }",style: TextStyle(fontFamily: 'PoetsenOne',color: cl23557,),),
                          SizedBox(height: 5,),
                          Container(
                            height:height/28,
                            width: width,
                            color: Color(0xff988A9A),
                            child: Center(
                                child: Text(item.status,style:
                                TextStyle(fontFamily: 'PoetsenOne',
                                    color: Colors.white),)),
                          )
                        ]
                    ),
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
