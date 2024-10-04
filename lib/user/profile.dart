import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:makeupproject/constants/callFunctions.dart';
import 'package:makeupproject/provider/provider.dart';
import 'package:makeupproject/user/reviews.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'bottomnavigation_screen.dart';

class Profile extends StatelessWidget {
  List<String> photo;
  String name;
  String makeuptype;
  String description;
  String price;
  String userId;
  String userName;

  Profile({
    super.key,
    required this.photo,
    required this.name,
    required this.makeuptype,
    required this.description,
    required this.price,
    required this.userId,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: IconButton(
                onPressed: () {
                  finish(context);
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
          child: Column(
            children: [
              Consumer<MainProvider>(builder: (context, value, child) {
                return InkWell(
                  onTap: () {
                    value.getReviews();

                    value.getUserPhoto(userId, userName);
                    callNext(
                        context,
                        Reviews(
                          userId: userId,
                          userName: userName,
                        ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: height / 2.8),
                    height: height / 30,
                    width: width / 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: const Color(0xff523557)),
                        color: Colors.white),
                    child: const Center(
                      child: Text(
                        "Reviews",
                        style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'PoetsenOne',
                            color: Color(0xff988A9A)),
                      ),
                    ),
                  ),
                );
              }),

              Consumer<MainProvider>(builder: (context, valu, child) {
                return Column(
                  children: [
                    CarouselSlider.builder(
                      itemCount: photo.length,
                      itemBuilder: (context, index, realIndex) {
                        return GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (_) => new AlertDialog(
                                      contentPadding: EdgeInsets.zero,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0))),
                                      content: Image.network(photo[index]),
                                    ));
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  photo[index],
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          height: height / 4,
                          viewportFraction: 1 / 2,
                          autoPlay: true,
                          pageSnapping: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          enlargeCenterPage: true,
                          autoPlayInterval: const Duration(seconds: 4),
                          onPageChanged: (index, reason) {
                            valu.activeIndex(index);
                          }),
                    ),
                    buildIndiCator(
                        valu.Carosuelimg.length, context, valu.Activeindex),
                  ],
                );
              }),

              // SizedBox(
              //   height: height/2.5,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: photo.length,
              //     itemBuilder: (context, index) {
              //       return Container(
              //         margin: EdgeInsets.all(10),
              //         width: width / 1.5,
              //         height: height / 4,
              //         decoration: BoxDecoration(
              //             boxShadow: const [
              //               BoxShadow(blurRadius: 1, offset: Offset(0, 2))
              //             ],
              //             borderRadius: BorderRadius.circular(10),
              //             color: Color(0xff988A9A),
              //             image: DecorationImage(image: NetworkImage( photo[index]),fit: BoxFit.fill)
              //         ),
              //       );
              //
              //     },
              //   ),
              // ),
              SizedBox(
                height: height / 100,
              ),
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/Ellipse 9 (1).png"),
                        fit: BoxFit.fill)),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50, left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Bride                     :   ",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'PoetsenOne',
                              color: Colors.white),
                        ),
                        SizedBox(
                            width: width * 0.4,
                            child: Text(
                              name,
                              // value.newWo"rkList[index].bride,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'PoetsenOne',
                                  color: Colors.white),
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Makeup type     :   ",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'PoetsenOne',
                              color: Colors.white),
                        ),
                        SizedBox(
                            width: width * 0.4,
                            child: Text(
                              makeuptype,
                              // value.newWorkList[index].makeuptype,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'PoetsenOne',
                                  color: Colors.white),
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Description       :   ",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'PoetsenOne',
                              color: Colors.white),
                        ),
                        SizedBox(
                            width: width * 0.4,
                            child: Text(
                              description,
                              // value.newWorkList[index].description,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'PoetsenOne',
                                  color: Colors.white),
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Price                     :   ",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'PoetsenOne',
                              color: Colors.white),
                        ),
                        SizedBox(
                            width: width * 0.4,
                            child: Text(
                              "$price/",
                              // "${value.newWorkList[index].price}/",
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'PoetsenOne',
                                  color: Colors.white),
                            ))
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

buildIndiCator(int count, BuildContext context, int activeindex) {
  //    print(activeIndex.toString()+"dpddoopf");

  return Center(
    child: Padding(
      padding: const EdgeInsets.only(top: 6),
      child: AnimatedSmoothIndicator(
        activeIndex: activeindex,
        count: count,
        effect: const ExpandingDotsEffect(
            dotWidth: 7,
            dotHeight: 7,
            strokeWidth: 1,
            paintStyle: PaintingStyle.stroke,
            activeDotColor: Color(0xff35103B),
            dotColor: Color(0xff35103B)),
      ),
    ),
  );
}
