import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeupproject/Admin/addnewwork.dart';
import 'package:makeupproject/Admin/admin_home_screen.dart';
import 'package:provider/provider.dart';

import '../constants/callFunctions.dart';
import '../constants/mycolor.dart';
import '../provider/provider.dart';

class NewWork extends StatelessWidget {
  const NewWork({super.key});

  @override
  Widget build(BuildContext context) {
    MainProvider provider = Provider.of<MainProvider>(context, listen:false);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(bottom: 30, left: 50),
            child: Text(
              'New Work',
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
                  callNext(context, AdminHomeScreen());
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
                itemCount: value.newWorkList.length,
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
                                            value.fileImageList.clear();
                                            value.editNewwork(value.newWorkList[index].id );
                                            callNext(context, AddWork(from: 'EDIT',nId:value.newWorkList[index].id ,));

                                          },
                                          child: Text("EDIT",
                                            style: TextStyle(fontSize: 15,  fontFamily: 'Futura',color:Color(0xff35103B)
                                            ),));
                                    }
                                ),
                                TextButton(
                                  onPressed: () {
                                    finish(context);
                                    provider.DeleteWork(value.newWorkList[index].id,context);

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
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              SizedBox(
                                height: height/2,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: value.newWorkList[index].photo.length,
                                  itemBuilder: (context, index2) {
                                    return Container(
                                      margin: EdgeInsets.only(right: 25),
                                      width: width/1.1,
                                      height: height / 4,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(blurRadius: 1, offset: Offset(0, 2))
                                          ],
                                          borderRadius: BorderRadius.circular(10),
                                          color: Color(0xff988A9A)),
                                      child:Image.network(value.newWorkList[index].photo[index2],fit: BoxFit.fill,),

                                    );
                                  },
                                ),
                              ),
                              Text(value.newWorkList[index].bride,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff988A9A),
                                    fontFamily: 'PoetsenOne',
                                  )),

                              Text(value.newWorkList[index].makeuptype,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff988A9A),
                                    fontFamily: 'PoetsenOne',
                                  )),
                              Text(value.newWorkList[index].description,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff988A9A),
                                    fontFamily: 'Futura',
                                  )),
                              Text("${value.newWorkList[index].price}/-",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff988A9A),
                                    fontFamily: 'PoetsenOne',
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
          backgroundColor: cl23557,
          onPressed: () {


            provider.Clearwork();


             provider.getMakeupList();

            callNext(context, AddWork(from: "NEW",nId: "",));
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
