import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class Notification_screen extends StatefulWidget {
  const Notification_screen({super.key});

  @override
  State<Notification_screen> createState() => _Notification_screenState();
}

class _Notification_screenState extends State<Notification_screen> {
  String notificationMsg="Waiting for notifications";
  @override

  // void initState(){
  //   // implement initState
  //   super.initState();
  //   // Terminated State
  //   FirebaseMessaging.instance.getInitialMessage().then((event) {
  //     if(event!=null){
  //       setState(() {
  //         notificationMsg= "${event!.notification!.title} ${event!.notification!.body} Iam coming from terminated State";
  //       });
  //     }
  //
  //   });
  //   // Foreground State
  //   FirebaseMessaging.onMessage.listen((event) {
  //     setState(() {
  //       notificationMsg= "${event.notification!.title} ${event.notification!.body} Iam coming from forground";
  //     });
  //   });
  //   // Background State
  //   FirebaseMessaging.onMessageOpenedApp.listen((event) {
  //     setState(() {
  //       notificationMsg= "${event.notification!.title} ${event.notification!.body} Iam coming from Background";
  //     });
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
          child: Text(notificationMsg)),
    );
  }
}
