import 'package:flutter/material.dart';
import 'package:http/http.dart%20';
import 'package:makeupproject/constants/callFunctions.dart';
import 'package:makeupproject/provider/provider.dart';
import 'package:makeupproject/user/profile.dart';
import 'package:provider/provider.dart';

import 'bottomnavigation_screen.dart';
import 'homepage.dart';

class Notifications extends StatefulWidget {

   Notifications({super.key});

  @override

  State<Notifications> createState() => _NotificationsState();

}


class _NotificationsState extends State<Notifications> {
  @override


  void initState(){
    super.initState();



  }
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(bottom: 30, left: 50),
            child: Text(
              'Notifications',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'PoetsenOne',
                color: Colors.white,
              ),
            ),
          ),
          leading: Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: IconButton(
                onPressed: () {
                  finish(context);
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(height / 30),
                height: height / 8,
                width: width,
                decoration: BoxDecoration(
                  color: Color(0xff988A9A),
                  borderRadius: BorderRadius.circular(19),
                  boxShadow: [BoxShadow(blurRadius: 2, offset: Offset(0, 1))],
                ),
                child: Center(
                  child: Text(
                    "Your appointment has been\n requested",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'PoetsenOne',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: height / 30, right: height / 30),
                height: height / 3,
                width: width,
                decoration: BoxDecoration(
                  color: Color(0xff988A9A),
                  borderRadius: BorderRadius.circular(19),
                  boxShadow: [BoxShadow(blurRadius: 2, offset: Offset(0, 1))],
                ),
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: height/55-1),
                      child: Text(
                        "Your appointment on \n20-10-2023 for Shimmer \nmakeup is accepted, You have \nto make payment for this work \nonly after it's completed",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'PoetsenOne',
                          color: Colors.white,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
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
                      child: Container(margin: EdgeInsets.only(left: width/2,),
                        height: height/30,
                        width: width/5,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius:  BorderRadius.circular(10),
                            border:
                            Border.all(color: Colors.white.withOpacity(0))),
                        child: Center(
                            child: Text(
                              "Cancel ",
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.w300),
                            )),
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(height / 30),
                height: height / 8,
                width: width,
                decoration: BoxDecoration(
                  color: Color(0xff988A9A),
                  borderRadius: BorderRadius.circular(19),
                  boxShadow: [BoxShadow(blurRadius: 2, offset: Offset(0, 1))],
                ),
                child: Center(
                  child: Text(
                    "Your appointment has been\n rejected",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'PoetsenOne',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
