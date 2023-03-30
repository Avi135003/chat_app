import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/data/app_theme.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

Future<void> backgroundMessageHandeler(RemoteMessage message)async{
  print("Message id ====> ${message.messageId}");
}

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(backgroundMessageHandeler);
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  FirebaseMessaging _messaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
    initMessaging();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppTheme.myTheme,
    );
  }

  void getToken() {
    _messaging.getToken().then((value) {
      String? token = value;
      print("Token====> $token");
    });
  }

  void initMessaging() {
    var androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    // var iosInit = IOSInitializationSettings();
    var initSetting = InitializationSettings(android: androidInit);
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initSetting);
    var androidDetails = AndroidNotificationDetails('1', 'Default',
        channelDescription: "Channel Description",
        importance: Importance.high,
        priority: Priority.high
    );

    var  generalNotificationDetails = NotificationDetails(android: androidDetails);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message!.notification!;
      AndroidNotification androd = message!.notification!.android!;

      if (notification != null && androd != null) {

        flutterLocalNotificationsPlugin.show(notification.hashCode, notification.title, notification.body, generalNotificationDetails);



      }

    });
  }
}

