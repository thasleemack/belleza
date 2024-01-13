import 'package:flutter/material.dart';
import 'package:makeupproject/constants/widget.dart';
import 'package:makeupproject/provider/provider.dart';
import 'package:provider/provider.dart';

import '../constants/callFunctions.dart';

class Addmakeup extends StatelessWidget {
  String from;
  String Mkid;
   Addmakeup({super.key,required this.from,required this.Mkid});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(

        appBar:  AppBar(
          title: Padding(
            padding: EdgeInsets.only(bottom: 30, left: 70),
            child: Text(
              ' Add Makeup Type',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'PoetsenOne',
                color: Colors.white,
              ),
            ),
          ),
       automaticallyImplyLeading: false,
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
              SizedBox(height: height/10,),
            Consumer<MainProvider>(
              builder: (context,value,child) {
                return fmfld(height/15, 1, "Makeup type", 16, Color(0xff988A9A),value.nameController);
              }
            ),
              SizedBox(height: height/80,),
              Consumer<MainProvider>(
                builder: (context,value,child) {
                  return fmfld(height/5, 5, "Description", 16, Color(0xff988A9A),value.descriptionController);
                }
              ),
              SizedBox(height: height/80,),
              Consumer<MainProvider>(
                builder: (context,value,child) {
                  return fmfld(height/15, 1, "Price", 16, Color(0xff988A9A),value.priceController);
                }
              ),
              SizedBox(height: height/10,),
              Consumer<MainProvider>(
                builder: (context,value,child) {
                  return InkWell(onTap: (){
                    print("code here");
                    if (from == "NEW") {
                      value.addMakeupType('', 'NEW');
                    } else {
                      value.addMakeupType(Mkid, 'EDIT');
                    }
                    ScaffoldMessenger.of(context ).showSnackBar( SnackBar(
                      content: Text("edit data successfully"),
                      backgroundColor: Color(0xff523557),

                    ));
                    back(context);
                  },
                    child: Container(
                      height: height/20,width: width/4,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                          color: Color(0xff523557)),
                      child: Center(child: txtstyl("save", 15, Colors.white)),
                    ),
                  );
                }
              ),
            ],
          ),
        ),

      ),
    );
  }
}
