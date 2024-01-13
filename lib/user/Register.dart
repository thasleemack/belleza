import 'package:flutter/material.dart';
import 'package:makeupproject/constants/callFunctions.dart';
import 'package:makeupproject/provider/provider.dart';
import 'package:provider/provider.dart';

import '../constants/widget.dart';
import 'login_screen.dart';

class Register extends StatelessWidget {
  const Register({super.key});


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      decoration: bgImg(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: height / 25,
              width: width,
            ),
            Container(
              child: Consumer<MainProvider>(
                builder: (context,value,child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      hdTxt("Register"),
                      tF1("Username", Icons.person,value.NameController),
                      tF1("Address", Icons.home,value.addressController),
                      phtf(value.PhoneController),
                      // tF(),
                      Consumer<MainProvider>(
                        builder: (context,value,child) {
                          return InkWell(
                              onTap: (){

                                value.AddCustomers("NEW",'');
                                value.getToken();

                            // value.addRegisterFn();
                            callNextReplacement(context, LoginScreen());
                          },
                              child: button("Register ", height / 25, width / 3,));
                        }
                      ),
                    ],
                  );
                }
              ),
            ),
            btmTxt("Already have an account?", "LOGIN",context,LoginScreen()  ),
          ],
        ),
      ),
    );
  }
}
