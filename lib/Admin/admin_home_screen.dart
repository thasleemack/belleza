import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeupproject/Admin/readquery.dart';
import 'package:makeupproject/Admin/requests.dart';
import 'package:makeupproject/constants/callFunctions.dart';
import 'package:makeupproject/provider/loginprovider.dart';
import 'package:makeupproject/user/login_screen.dart';
import 'package:provider/provider.dart';
import '../constants/widget.dart';
import '../provider/provider.dart';
import 'makeuptype.dart';
import 'newwork.dart';
class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    MainProvider provider = Provider.of<MainProvider>(context, listen:false);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: height * 0.13,
        flexibleSpace: Image(
          image: AssetImage('assets/Ellipse 9.png'),
          fit: BoxFit.fill,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Consumer<MainProvider>(
            builder: (context,value,child) {
              return InkWell(
                onTap: (){
                  value.getAdminAppointments();
                  callNext(context, Requests());
                },
                  child: Fisrtadmin("Requests", context, ));
            }
          ),
          InkWell(
            onTap: (){
              provider.GetNewWork();


              callNext(context, NewWork());
            },
              child: Fisrtadmin("New Work", context, )),
          InkWell(
            onTap: (){
              provider.getMakeupList();

              callNext(context, Makeuptype());

            },
              child: Fisrtadmin("Makeup type", context, )),
          Consumer<MainProvider>(
            builder: (context,value,child) {
              return InkWell(
                onTap: (){
                  value.getQuery();
                  callNext(context, ReadQry());
                },
                  child: Fisrtadmin("Queries", context, ));
            }
          ),InkWell(
            onTap: (){
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
              child: Fisrtadmin("Log out", context, )),
        ],
      ),
    );
  }
}
