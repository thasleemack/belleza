import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _ratingController = TextEditingController();
  late double _rating;
  int _ratingBarMode = 1;
  bool _isRTLMode = false;
  bool _isVertical = false;
  late IconData _selectedIcon;

  @override
  void initState() {
    _ratingController.text = "3.0";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: AppBarTheme(

        ),
      ),
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('GeeksForGeeks'),
            backgroundColor: Colors.green,
          ),
          body: Directionality(
            textDirection: _isRTLMode ? TextDirection.rtl : TextDirection.ltr,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 40.0,
                  ),
                  _heading('Rating Bar'),
                  _ratingBar(_ratingBarMode),
                  SizedBox(
                    height: 20.0,
                  ),
                  _rating != null
                      ? Text(
                    "Rating: $_rating",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                      : Container(),
                  Row(
                    children: [
                      _radio(1),
                      _radio(2),
                      _radio(3),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Switch to Vertical Bar',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Switch(
                        value: _isVertical,
                        onChanged: (value) {
                          setState(() {
                            _isVertical = value;
                          });
                        },
                        activeColor: Colors.amber,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Switch to RTL Mode',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Switch(
                        value: _isRTLMode,
                        onChanged: (value) {
                          setState(() {
                            _isRTLMode = value;
                          });
                        },
                        activeColor: Colors.amber,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _radio(int value) {
    return Expanded(
      child: RadioListTile(
        value: value,
        groupValue: _ratingBarMode,
        dense: true,
        title: Text(
          'Mode $value',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12.0,
          ),
        ),
        onChanged: (value) {
          setState(() {
            _ratingBarMode = value!;
          });
        },
      ),
    );
  }

  Widget _ratingBar(int mode) {
    switch (mode) {
      // case 1:
      //   return RatingBar(
      //     initialRating: 2,
      //     minRating: 1,
      //     direction: _isVertical ? Axis.vertical : Axis.horizontal,
      //     allowHalfRating: true,
      //     unratedColor: Colors.amber.withAlpha(50),
      //     itemCount: 5,
      //     itemSize: 50.0,
      //     itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      //     itemBuilder: (context, _) => Icon(
      //       _selectedIcon ?? Icons.star,
      //       color: Colors.amber,
      //     ),
      //     onRatingUpdate: (rating) {
      //       setState(() {
      //         _rating = rating;
      //       });
      //     },
      //   );
      case 2:
        return RatingBar(
          initialRating: 3,
          direction: _isVertical ? Axis.vertical : Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          ratingWidget: RatingWidget(
            full: _image('assets/heart.png'),
            half: _image('assets/heart_half.png'),
            empty: _image('assets/heart_border.png'),
          ),
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          onRatingUpdate: (rating) {
            setState(() {
              _rating = rating;
            });
          },
        );
      // case 3:
      //   return RatingBar(
      //     initialRating: 3,
      //     direction: _isVertical ? Axis.vertical : Axis.horizontal,
      //     itemCount: 5,
      //     itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      //     itemBuilder: (context, index) {
      //       switch (index) {
      //         case 0:
      //           return Icon(
      //             Icons.sentiment_very_dissatisfied,
      //             color: Colors.red,
      //           );
      //         case 1:
      //           return Icon(
      //             Icons.sentiment_dissatisfied,
      //             color: Colors.redAccent,
      //           );
      //         case 2:
      //           return Icon(
      //             Icons.sentiment_neutral,
      //             color: Colors.amber,
      //           );
      //         case 3:
      //           return Icon(
      //             Icons.sentiment_satisfied,
      //             color: Colors.lightGreen,
      //           );
      //         case 4:
      //           return Icon(
      //             Icons.sentiment_very_satisfied,
      //             color: Colors.green,
      //           );
      //         default:
      //           return Container();
      //       }
      //     },
      //     onRatingUpdate: (rating) {
      //       setState(() {
      //         _rating = rating;
      //       });
      //     },
      //   );
      default:
        return Container();
    }
  }

  Widget _image(String asset) {
    return Image.asset(
      asset,
      height: 30.0,
      width: 30.0,
      color: Colors.amber,
    );
  }

  Widget _heading(String text) => Column(
    children: [
      Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 24.0,
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
    ],
  );
} 