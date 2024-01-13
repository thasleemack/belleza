import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeupproject/constants/callFunctions.dart';
import 'package:makeupproject/user/profile.dart';
import 'package:provider/provider.dart';

import '../constants/widget.dart';
import '../provider/provider.dart';
import 'login_screen.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var txt="Hi, my name is Shahna, and I’m a \nMakeup Artist. I’ve been drawing \nfor as long as I can remember, and \nit’s always been my passion. I love \ncreating art that people feel good \nabout owning. I aim to ensure that \nmy work is timeless so you can \npass it down from generation to \ngeneration.";
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/introbgrnd.png"), fit: BoxFit.fill)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Consumer<MainProvider>(builder: (context, valu, child) {
                  return CarouselSlider.builder(
                    itemCount: 3,
                    itemBuilder: (context, index, realIndex) {
                      valu.Carosuelimg[index];
                      return Container(
                        width: width,
                        // height: 120,

                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 8, right: 4, top: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              valu.Carosuelimg[index],
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                        height: 280.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.8,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        pageSnapping: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        autoPlayInterval: const Duration(seconds: 4),
                        onPageChanged: (index, reason) {
                          valu.activeIndex(index);
                          // print("activvgvg"+Activeindex.toString());
                        }),
                  );
                }),
                Consumer<MainProvider>(builder: (context, val, child) {
                  return Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: buildIndiCator(
                        val.Carosuelimg.length, context, val.Activeindex),
                  );
                }),
                Padding(
                  padding: EdgeInsets.only(
                      top: height / 18, right: width / 2, bottom: height / 100),
                  child: Text(
                    "Who am I ?",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),

                Text(
                  txt,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Futura',
                      color: Colors.white),
                ),
                InkWell(
                  onTap: (){
                    callNextReplacement(context, LoginScreen());
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: height / 18, left: width / 2),
                    child: button(
                        " Get Started", height / 25, width / 3, ),
                  ),
                ),
                SizedBox(height: height/20,)
              ],
            ),
          )),
    );
  }
}
