import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeupproject/constants/callFunctions.dart';
import 'package:makeupproject/user/profile.dart';
import 'package:provider/provider.dart';

import '../constants/widget.dart';
import '../provider/provider.dart';
import 'login_screen.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var txt="Welcome to our bridal makeup booking application, where elegance meets convenience. With a singular focus on making your special day extraordinary, our dedicated artist, [Artist's Name], brings a personalized touch to each bridal experience. Seamlessly navigate through our user-friendly app to explore a range of stunning bridal looks, perfectly tailored to enhance your unique beauty. From consultation to booking, every step is crafted to ensure a stress-free and delightful journey towards your dream wedding look. Trust [Artist's Name] to bring out your radiance and transform your wedding day into a cherished memory. Embrace the magic of bridal beauty with our exclusive makeup booking app!";
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
                // Consumer<MainProvider>(builder: (context, valu, child) {
                //   return CarouselSlider.builder(
                //     itemCount: 3,
                //     itemBuilder: (context, index, realIndex) {
                //       valu.Carosuelimg[index];
                //       return Container(
                //         width: width,
                //         // height: 120,
                //
                //         child: Padding(
                //           padding:
                //           const EdgeInsets.only(left: 8, right: 4, top: 10),
                //           child: ClipRRect(
                //             borderRadius: BorderRadius.circular(10),
                //             child: Image.asset(
                //               valu.Carosuelimg[index],
                //               fit: BoxFit.fill,
                //             ),
                //           ),
                //         ),
                //       );
                //     },
                //     options: CarouselOptions(
                //         height: 280.0,
                //         enlargeCenterPage: true,
                //         autoPlay: true,
                //         aspectRatio: 16 / 9,
                //         autoPlayCurve: Curves.fastOutSlowIn,
                //         enableInfiniteScroll: true,
                //         autoPlayAnimationDuration: Duration(milliseconds: 800),
                //         viewportFraction: 0.8,
                //         clipBehavior: Clip.antiAliasWithSaveLayer,
                //         pageSnapping: true,
                //         enlargeStrategy: CenterPageEnlargeStrategy.height,
                //         autoPlayInterval: const Duration(seconds: 4),
                //         onPageChanged: (index, reason) {
                //           valu.activeIndex(index);
                //           // print("activvgvg"+Activeindex.toString());
                //         }),
                //   );
                // }),
                // Consumer<MainProvider>(builder: (context, val, child) {
                //   return Padding(
                //     padding: EdgeInsets.only(top: 20),
                //     child: buildIndiCator(
                //         val.Carosuelimg.length, context, val.Activeindex),
                //   );
                // }),
               
                SizedBox(width: width/1.01,
                  child: Text(
                    txt,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Futura',
                        color: Colors.white),
                  ),
                ),

                SizedBox(height: height/20,)
              ],
            ),
          )),
    );
  }
}
