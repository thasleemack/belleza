import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:makeupproject/constants/callFunctions.dart';
import 'package:makeupproject/provider/provider.dart';
import 'package:makeupproject/user/reviews.dart';
import 'package:provider/provider.dart';

import '../constants/widget.dart';

class Addreview extends StatefulWidget {
  String userId;
  String userName;

  Addreview({
    super.key,
    required this.userId,
    required this.userName,
  });

  @override
  State<Addreview> createState() => _AddreviewState();
}

class _AddreviewState extends State<Addreview> {
  double? _ratingValue;
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
              'Add Reviews',
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Reviews(
                                userId: widget.userId,
                                userName: widget.userName,
                              )));
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
              Container(
                height: height,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/Ellipse 9 (1).png"),
                        fit: BoxFit.fill)),
                child: Padding(
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
                          controller: value.reviewController,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w200),
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: "review",
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
                        height: height / 40,
                      ),
                      RatingBar(
                          initialRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          ratingWidget: RatingWidget(
                              full:
                                  const Icon(Icons.star, color: Colors.orange),
                              half: const Icon(
                                Icons.star_half,
                                color: Colors.orange,
                              ),
                              empty: const Icon(
                                Icons.star_outline,
                                color: Colors.orange,
                              )),
                          onRatingUpdate: (value) {
                            setState(() {
                              print("rty" + _ratingValue.toString());
                              _ratingValue = value;
                            });
                          }),
                      Text(
                        _ratingValue != null
                            ? _ratingValue.toString()
                            : 'Rate it!',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 13),
                      ),
                      SizedBox(
                        height: height / 30,
                      ),
                      Consumer<MainProvider>(builder: (context, value, child) {
                        return InkWell(
                            onTap: () {
                              value.addReviews(
                                widget.userId,
                                _ratingValue!,
                                widget.userName,
                              );

                              finish(context);
                              // callNextReplacement(context, Bottombar(userId: userId,));
                            },
                            child: button(
                              " Submit",
                              height / 25,
                              width / 3,
                            ));
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
