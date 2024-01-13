
import 'package:flutter/material.dart';
import 'package:makeupproject/provider/provider.dart';
import 'package:provider/provider.dart';

import '../constants/callFunctions.dart';
import 'addmakeup.dart';

class Makeuptype extends StatelessWidget {
   Makeuptype({super.key});



  @override
  Widget build(BuildContext context) {
    MainProvider provider = Provider.of<MainProvider>(context, listen:false);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(
                bottom: 30, left: 50),
            child: Text(
              'Makeup Type',
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
                  back(context);
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
        body: Consumer<MainProvider>(
          builder: (context,value,child) {
            return ListView.builder(
              itemCount: value.makeupTypeList.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        backgroundColor: Color(0xffD9D9D9),

                        content:Text("Are you sure want to edit or delete?",
                          style: TextStyle(
                            fontSize: 15,
                            // fontFamily: 'Futura',
                            color:  Color(0xff35103B),
                          ),),
                          actions: [
                            Row(
                              children: [
                                Consumer<MainProvider>(
                                  builder: (context,value,child) {
                                    return TextButton(
                                        onPressed: () {
                                          finish(context);
                                          value.getEditdata(value.makeupTypeList[index].id );
                                          print(value.makeupTypeList[index].id+"kjjjj");
                                          callNext(context, Addmakeup(from: 'EDIT',Mkid:value.makeupTypeList[index].id ,));

                                        },
                                        child: Text("EDIT",
                                          style: TextStyle(fontSize: 15,  fontFamily: 'Futura',color:Color(0xff35103B)
                                          ),));
                                  }
                                ),
                                TextButton(
                                  onPressed: () {
                                    finish(context);
                                    provider.deleteMakeuptype(value.makeupTypeList[index].id, context);
                                    },

                                  child: Text("DELETE",
                                    style: TextStyle(fontSize: 15,  fontFamily: 'Futura',color:Color(0xffFF0000)
                                    ),),
                                ),

                              ],
                            ),
                          ],



                      ),
                    );

                  },
                  child: Container(
                      margin: EdgeInsets.all(10),

                      width: width / 3,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 3,
                                color: Colors.grey,
                                offset: Offset(0, 4))
                          ]),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(value.makeupTypeList[index].name,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff988A9A),
                                      fontFamily: 'PoetsenOne',
                                    )),
                                Text("${value.makeupTypeList[index].price}/-",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff988A9A),
                                      fontFamily: 'PoetsenOne',
                                    )),
                              ],
                            ),
                            SizedBox(height: height/100,),
                            Text(value.makeupTypeList[index].description,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xff988A9A),
                                  fontFamily: 'Futura',
                                )),
                          ],
                        ),
                      )),
                );
              },
            );
          }
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff523557),
          onPressed: () {
            provider.clear();
            callNext(context, Addmakeup(from: 'NEW',Mkid: '',));
          },
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
