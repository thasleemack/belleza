import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:makeupproject/constants/callFunctions.dart';
import 'package:makeupproject/provider/provider.dart';
import 'package:provider/provider.dart';
import '../constants/widget.dart';
import 'add review.dart';

class Reviews extends StatelessWidget {
  String userId;
  String userName;
  Reviews({super.key,required this.userId,required this.userName});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          title: Padding(
            padding:  const EdgeInsets.only(bottom: 30,left: 80),
            child:txtstyl('Reviews', 20, Colors.white)
          ),
          leading: Padding(
            padding:  const EdgeInsets.only(bottom: 30),
            child: IconButton(onPressed: () {
              back(context);
              // callNext(context, Profile(,));},
            },
                icon: const Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
          ),
          toolbarHeight: height * 0.13,

          flexibleSpace: const Image(
            image: AssetImage('assets/Ellipse 9.png'),
            fit: BoxFit.fill,
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Consumer<MainProvider>(
          builder: (context,value,child) {
            return ListView.builder(itemCount: value.reviewList.length,

              itemBuilder: (context, index) {
              var item= value.reviewList[index];
              return Container(
                child: Stack(
                    alignment: Alignment.topCenter,
                    children:[

                      Padding(
                      padding:  EdgeInsets.all(height/50),
                      child: Container(
                        // height: height/2.2,
                        width: width,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                              blurRadius: 1,
                              offset: Offset(0, 1),)]),
                        child: Padding(
                          padding:  EdgeInsets.only(top: height/10,left: width/20,right: width/20),
                          child: Column(
                            children: [
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(userName,
                                    style: const TextStyle(fontSize: 16,  fontFamily: 'PoetsenOne',color:Color(0xff523557)
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      RatingBar(itemSize: 20,
                                          initialRating: double.parse(item.rating) ,
                                          direction: Axis.horizontal,
                                          ignoreGestures: true,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          ratingWidget: RatingWidget(
                                              full: const Icon(Icons.star, color: Colors.orange),
                                              half: const Icon(
                                                Icons.star_half,
                                                color: Colors.orange,
                                              ),
                                              empty: const Icon(
                                                Icons.star_outline,
                                                color: Colors.orange,
                                              )), onRatingUpdate: (double value) {  },
                                          ),
                                      Text(item.rating,style: const TextStyle(fontSize: 10),),
                                    ],
                                  ),

                                ],
                              ),
                              Text("“-------------------------------------------\n ${item.name}",
                                style: const TextStyle(fontFamily: 'Futura',
                                    fontSize: 15, color:Color(0xff988A9A)
                                ),
                              ),
                              SizedBox(height: height/50,),
                            ],
                          ),
                        ),

                      ),
                    ),
                      Positioned(
                        left: 25,
                        child: Container(

                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [BoxShadow(blurRadius: 3, color: Colors.grey,offset: Offset(0, 2) )],
                          ),
                          child: CircleAvatar(
                              radius: 35,
                              backgroundImage:NetworkImage(value.loginphoto,scale: 1.0)
                          ),
                        ),
                      )
                    ]
                ),
              );
            },);
          }
        ),

        floatingActionButton: Consumer<MainProvider>(
          builder: (context,value,child) {
            return FloatingActionButton(backgroundColor: const Color(0xff35103B),
              onPressed: (){
              value.clearReviews();
              callNext(context,  Addreview(userId: userId, userName: userName,)
              );
              },
            child: const Icon(Icons.add,color: Colors.white,),);
          }
        ),
      ),
    );
  }
}
