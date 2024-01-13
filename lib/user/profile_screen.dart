import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeupproject/constants/mycolor.dart';
import 'package:makeupproject/provider/loginprovider.dart';
import 'package:makeupproject/provider/provider.dart';
import 'package:makeupproject/user/appointments.dart';
import 'package:makeupproject/user/editprofile_screen.dart';
import 'package:makeupproject/user/login_screen.dart';
import 'package:provider/provider.dart';

import '../constants/callFunctions.dart';
import 'moresettings.dart';

class ProfilePage extends StatelessWidget {
  String userId;
  String name;
  String phone;
  String address;

   ProfilePage({super.key,required this.userId,required this.name,required this.phone,required this.address});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: height * 0.13,
          flexibleSpace: Image(
            image: AssetImage('assets/Ellipse 9.png'),
            fit: BoxFit.fill,
          ),
          backgroundColor: Colors.transparent,
        ),
        extendBody: true,

        body: SingleChildScrollView(

          child: Consumer<MainProvider>(
            builder: (context,value,child) {
              return Column(
                    children: [
                      value.profileFileImage!=null? CircleAvatar(
                        radius: 80,
                        backgroundColor: lightPurple,
                        backgroundImage:
                        FileImage(value.profileFileImage!),
                      ):value.Profileimage!=""? CircleAvatar(
                          radius:100,
                          backgroundImage:NetworkImage(value.Profileimage!,)):
                      CircleAvatar(
                        radius: 80,
                        backgroundColor: lightPurple,
                      ),

                      Container(
                        height: height / 60,
                      ),
                      Consumer<MainProvider>(
                        builder: (context,value,child) {
                          return Text(value.NameController.text.toString(),style: TextStyle(fontSize: 20,color: cl23557),);
                        }
                      ),
                      Consumer<MainProvider>(
                        builder: (context,value,child) {
                          return Text(value.PhoneController.text.toString(),style: TextStyle(fontSize: 20,color: cl23557),);
                        }
                      ),
                      Container(
                        height: height / 60,
                      ),
                      Stack(children: [
                        Image.asset(
                          "assets/Ellipse 9 (1).png",
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: height / 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                leading: Text(
                                  "Address :",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'PoetsenOne',
                                      color: Colors.white),
                                ),
                                title: Consumer<MainProvider>(
                                  builder: (context,value,child) {
                                    return Text(value.addressController.text.toString(),style: TextStyle(fontSize: 22,color: Colors.white),);
                                  }
                                ),


                              ),


                              ListTile(
                                leading: Text(
                                  "Edit Profile",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'PoetsenOne',
                                      color: Colors.white),
                                ),
                                // title: Text(
                                //   "ayisha",
                                //   style: TextStyle(
                                //       fontSize: 22,
                                //       fontFamily: 'PoetsenOne',
                                //       color: Colors.white),
                                // ),
                                trailing: IconButton(
                                    onPressed: () {
                                      callNext(context, EditProfile(userId: userId,name: name,phone: phone,address: address,));
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    )),
                              ),
                              // ListTile(
                              //   leading: Text(
                              //     "Phone:",
                              //     style: TextStyle(
                              //         fontSize: 22,
                              //         fontFamily: 'PoetsenOne',
                              //         color: Colors.white),
                              //   ),
                              //   title: Text(
                              //     "4365485684",
                              //     style: TextStyle(
                              //         fontSize: 22,
                              //         fontFamily: 'PoetsenOne',
                              //         color: Colors.white),
                              //   ),
                              //   trailing: IconButton(
                              //       onPressed: () {},
                              //       icon: Icon(
                              //         Icons.edit,
                              //         color: Colors.white,
                              //       )),
                              // ),
                              // ListTile(
                              //   leading: Text(
                              //     "Address:",
                              //     style: TextStyle(
                              //         fontSize: 22,
                              //         fontFamily: 'PoetsenOne',
                              //         color: Colors.white),
                              //   ),
                              //   title: Text(
                              //     "wjrigr",
                              //     style: TextStyle(
                              //         fontSize: 22,
                              //         fontFamily: 'PoetsenOne',
                              //         color: Colors.white),
                              //   ),
                              //   trailing: IconButton(
                              //       onPressed: () {},
                              //       icon: Icon(
                              //         Icons.edit,
                              //         color: Colors.white,
                              //       )),
                              // ),
                              ListTile(
                                leading: Text(
                                  "Appointments",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'PoetsenOne',
                                      color: Colors.white),
                                ),
                                trailing: Consumer<MainProvider>(
                                  builder: (context,value,child) {
                                    return IconButton(
                                        onPressed: () {
                                          value.getUserAppointments(userId);

                                          callNext(context, Appointments());
                                        },
                                        icon: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.white,
                                        ));
                                  }
                                ),
                              ),
                              ListTile(
                                leading: Text(
                                  "More Settings",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'PoetsenOne',
                                      color: Colors.white),
                                ),
                                trailing: IconButton(
                                    onPressed: () {
                                      callNext(context, Moresettings( userId: userId,));
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white,
                                    )),
                              ),
                              ListTile(
                                leading: Text(
                                  "Logout",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'PoetsenOne',
                                      color: Colors.white),
                                ),
                                trailing: InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                          backgroundColor: Color(0xffD9D9D9),
                                          content: Text(
                                            "Log Out?",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'PoetsenOne',
                                              color: Color(0xff35103B),
                                            ),
                                          ),
                                          actions: <Widget>[
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // height: height/5,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(10),
                                                      color: Colors.black26),
                                                ),
                                                Text(
                                                  "Are you sure want to logout?",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: 'PoetsenOne',
                                                    color: Color(0xff35103B),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Consumer<LoginProvider>(
                                                      builder: (context,value,child) {
                                                        return TextButton(
                                                            onPressed: () {
                                                              value.otpController.clear();

                                                              FirebaseAuth auth = FirebaseAuth.instance;
                                                              auth.signOut();
                                                              callNextReplacement(context, const LoginScreen());
                                                            },
                                                            child: Text(
                                                              "yes",
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                fontFamily: 'PoetsenOne',
                                                                color: Colors.red,
                                                              ),
                                                            ));
                                                      }
                                                    ),
                                                    TextButton(

                                                        onPressed: () {
                                                          back(context);
                                                        },
                                                        child: Text(
                                                          "No",
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontFamily: 'PoetsenOne',
                                                            color: Color(0xff35103B),
                                                          ),
                                                        ))
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white,
                                    )),
                              ),

                            ],
                          ),
                        )
                      ]),
                    ],
                  );
            }
          )


        ),
      ),
    );
  }
}
