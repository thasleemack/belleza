import 'package:flutter/material.dart';
import 'package:makeupproject/constants/widget.dart';
import 'package:makeupproject/provider/provider.dart';
import 'package:provider/provider.dart';

import '../constants/callFunctions.dart';

class ReadQry extends StatelessWidget {
  const ReadQry({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(bottom: 30, left: 80),
            child: Text(
              'Queries',
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
        ) ,
        body: Consumer<MainProvider>(
          builder: (context,value,child) {
            return ListView.builder(itemCount:value.queryList.length,
              itemBuilder: (context, index) {
              var item=value.queryList[index];
              return Container(margin:EdgeInsets.all(10) ,
                  height: height/8,
                  width: width,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color(0xff988A9A)),
                  child: Padding(
                    padding:  EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        txtstyl("Name  : ${item.name}", 15, Colors.white),
                        txtstyl("Query : ${item.query}", 15, Colors.white),
                      ],
                    ),
                  )
              );
            },
            );
          }
        ),

      ),
    );
  }
}
