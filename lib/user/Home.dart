import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeupproject/constants/callFunctions.dart';
import 'package:makeupproject/provider/provider.dart';
import 'package:makeupproject/user/profile.dart';
import 'package:provider/provider.dart';

import 'notifications.dart';

class Home extends StatelessWidget {
  String userId;
  String userName;

   Home({super.key,required this.userId,required this.userName,});


  @override

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 5),
            child: IconButton(onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Notifications()));

            },icon: Icon(Icons.notifications_none)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Consumer<MainProvider>(
          builder: (context,value,child) {
            return GridView.builder(
                itemCount:value.newWorkList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Consumer<MainProvider>(
                    builder: (context,value,child) {
                      var items=value.newWorkList[index];
                      return InkWell(
                        onTap: () {

                          callNext(context,Profile(photo: items.photo,name: items.bride,
                            makeuptype: items.makeuptype,description: items.description,
                            price: items.price,userId: userId,userName: userName,));
                          },
                        child:Card(
                              elevation: 40,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  // boxShadow: [BoxShadow(blurRadius: 3)],
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      opacity: 0.7,
                                      image: NetworkImage(value.newWorkList[index].photo[1]),
                                      fit: BoxFit.cover),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(top: height / 5.5),
                                  child: Container(
                                    // height: height/100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                      color: Colors.black26.withOpacity(0.5),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: height / 60, top: height*0.001),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text("Bride:  "+
                                            value.newWorkList[index].bride,
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontFamily: 'PoetsenOne',
                                                color: Colors.white),
                                          ),
                                          Text("makeuptype:  "+
                                            value.newWorkList[index].makeuptype,
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontFamily: 'PoetsenOne',
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ));
                                              }
                  );
                });
          }
        ),
      ),
    );
  }
}
