import 'package:flutter/material.dart';
import 'package:makeupproject/user/about_screen.dart';
import 'package:makeupproject/user/querypage.dart';
import '../constants/callFunctions.dart';

class Moresettings extends StatelessWidget {
  String userId;
   Moresettings({super.key,required this.userId});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

          leading: Padding(
            padding:  EdgeInsets.only(bottom: 30),
            child: IconButton(onPressed: (){
              back(context);
          // callNextReplacement(context, Bottombar(userId: userId,));

              },
                icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
          ),
          toolbarHeight: height * 0.13,

          flexibleSpace: Image(
            image: AssetImage('assets/Ellipse 9.png'),
            fit: BoxFit.fill,
          ),
          backgroundColor: Colors.transparent,
        ),
        body:  SingleChildScrollView(physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(height: height/4,),
              Stack(
                  children: [

                    Image.asset("assets/Ellipse 9 (1).png",),
                    Padding(
                      padding:  EdgeInsets.only(top: height/20),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: Text("About the artist",style: TextStyle(fontSize: 22,  fontFamily: 'PoetsenOne',color:Colors.white
                            ),),
                            trailing: IconButton(onPressed: (){
                              callNext(context, About());
                            }, icon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,)),),
                          ListTile(
                            leading: Text("Send a query",style: TextStyle(fontSize: 22,  fontFamily: 'PoetsenOne',color:Colors.white
                            ),),
                            trailing: IconButton(onPressed: (){
                              callNext(context, Query(userId: userId,));
                            }, icon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,)),),
                          ListTile(
                            leading: Text("Share",style: TextStyle(fontSize: 22,  fontFamily: 'PoetsenOne',color:Colors.white
                            ),),
                            trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,)),),






                        ],
                      ),
                    )

                  ]),
            ],
          ),
        ),

      ),
    );
  }
}
