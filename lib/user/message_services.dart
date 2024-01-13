import 'package:firebase_messaging/firebase_messaging.dart';

class MessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initialize() async {
    await _firebaseMessaging.subscribeToTopic('your_topic_name');

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Received message: $message");
      // Handle the incoming message
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("Message opened: $message");
      // Handle the opened message
    });
  }
}
