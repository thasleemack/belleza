import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeupproject/constants/callFunctions.dart';
import 'package:makeupproject/provider/provider.dart';
import 'package:makeupproject/user/reviews.dart';
import 'package:provider/provider.dart';

import '../constants/widget.dart';
import 'moresettings.dart';

class Query extends StatelessWidget {
  String userId;

  Query({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(bottom: 30, left: 50),
            child: Text(
              'Send a query',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'PoetsenOne',
                color: Colors.white,
              ),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: IconButton(
                onPressed: () {
                  back(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                )),
          ),
          toolbarHeight: height * 0.13,
          flexibleSpace: const Image(
            image: AssetImage('assets/Ellipse 9.png'),
            fit: BoxFit.fill,
          ),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: height / 4,
              ),
              Stack(children: [
                Image.asset(
                  "assets/Ellipse 9 (1).png",
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: height / 25,
                    right: height / 25,
                    top: height / 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Consumer<MainProvider>(builder: (context, value, child) {
                        return TextFormField(
                          controller: value.queryController,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w200),
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: "write something",
                            hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w200),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        );
                      }),
                      SizedBox(
                        height: height / 10,
                      ),
                      Consumer<MainProvider>(builder: (context, value, child) {
                        return InkWell(
                            onTap: () {
                              value.queryFn(
                                userId,
                              );
                              back(context);
                            },
                            child: button(
                              " Submit",
                              height / 25,
                              width / 3,
                            ));
                      }),
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
