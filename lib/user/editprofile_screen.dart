import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:makeupproject/constants/mycolor.dart';
import 'package:makeupproject/provider/provider.dart';
import 'package:provider/provider.dart';

import '../constants/callFunctions.dart';

class EditProfile extends StatelessWidget {
  String userId;
  String name;
  String phone;
  String address;


   EditProfile({super.key,required this.userId,required this.name,required this.phone,required this.address});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    MainProvider provider = Provider.of<MainProvider>(context,listen: false);

    // provider.NameController.text= name;
    // provider.PhoneController.text= phone;
    // provider.addressController.text= address;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: IconButton(
                onPressed: () {
                  back(context);
                  // callNextReplacement(context, Bottombar(userId: userId,));
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
        extendBodyBehindAppBar: false,
        body: SingleChildScrollView(
          child: Consumer<MainProvider>(
            builder: (context,value,child) {
              return Column(
                children: [
                  InkWell(onTap: () {
                    showBottomSheet(context);
                  },
                    child: Consumer<MainProvider>(
                      builder: (context,value,child) {
                        return value.profileFileImage!=null?
                        CircleAvatar(
                            radius:100,
                            backgroundImage:FileImage(value.profileFileImage!,))
                            :value.Profileimage!=""? CircleAvatar(
                            radius:100,
                            backgroundImage:NetworkImage(value.Profileimage)):Container(height: 200,width: 200,
                          decoration: BoxDecoration(shape:BoxShape.circle,color: lightPurple,

                              boxShadow: [BoxShadow(blurRadius: 3,color: Colors.grey)]),

                        );
                      }
                    ),
                  ),
                  SizedBox(
                    height: height / 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: height / 15,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              offset: Offset(0, 4),
                              color: Colors.grey,
                            )
                          ]),
                      child: TextFormField(
                        controller: value.NameController,
                                            maxLines: 1,
                        cursorColor: Colors.black26,
                        cursorHeight: 20,
                        decoration: InputDecoration(
                          hintText: "name",
                          hintStyle: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'PoetsenOne',
                            color: lightPurple,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.black26,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: height / 15,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              offset: Offset(0, 4),
                              color: Colors.grey,
                            ),
                          ]),
                      child: TextFormField(controller: value.addressController,

                        maxLines: 1,
                        cursorColor: Colors.black26,
                        cursorHeight: 20,
                        decoration: InputDecoration(
                          hintText: "address",
                          hintStyle: TextStyle(
                            fontSize: 20,
                            fontFamily: 'PoetsenOne',
                            color: lightPurple,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.black26,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: height / 15,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              offset: Offset(0, 4),
                              color: Colors.grey,
                            )
                          ]),
                      child: TextFormField(
                        controller: value.PhoneController,


                        enabled: false,
                        maxLines: 1,
                        cursorColor: Colors.black26,
                        cursorHeight: 20,
                        decoration: InputDecoration(

                          hintText: "phone",
                          hintStyle: TextStyle(
                            fontSize: 20,
                            fontFamily: 'PoetsenOne',
                            color: lightPurple,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.black26,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Consumer<MainProvider>(
                    builder: (context,value,child) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: (){
                            value.AddCustomers("EDIT", userId);
                            back(context);

                          },
                          child: Container(
                            height: height / 15,
                            width: width/3,
                            decoration: BoxDecoration(
                                color: cl23557,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    offset: Offset(0, 4),
                                    color: Colors.grey,
                                  )
                                ]),
                            child: Center(child: Text("Save",style: TextStyle(fontSize: 15,fontFamily: 'PoetsenOne',color: Colors.white),)),

                          ),
                        ),
                      );
                    }
                  ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}void showBottomSheet(BuildContext context) {
  MainProvider provider = Provider.of<MainProvider>(context, listen: false);

  showModalBottomSheet(
      elevation: 10,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          )),
      context: context,
      builder: (BuildContext bc) {
        return Wrap(
          children: <Widget>[
            ListTile(
                leading: Icon(
                  Icons.camera_enhance_sharp,
                  color: cl23557,
                ),
                title: const Text(
                  'Camera',
                ),
                onTap: () =>
                {provider.getProfileImageCamera(), Navigator.pop(context)}),
            ListTile(
                leading: Icon(Icons.photo, color: cl23557),
                title: const Text(
                  'Gallery',
                ),
                onTap: () =>
                {provider.getProfileImageGallery(), Navigator.pop(context)}),
          ],
        );
      });
  //ImageSource
}


