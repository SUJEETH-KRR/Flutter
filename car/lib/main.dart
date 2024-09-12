// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'Notify.dart';
// import 'package:firebase_core/firebase_core.dart';
//
// void main() async {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('notify'),
//       ),
//       body: MyApp(),
//     ),
//   ));
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//
//   // @override
//   // void initState() {
//   //   super.initState();
//   //
//   //   var android = AndroidInitializationSettings('mipmap-hdpi/ic_launcher.png');
//   //   var initSettings = InitializationSettings(android: android,);
//   //   // FlutterLocalNotificationsPlugin.initialize(initSettings, onSelectNotification: onSelectNotification);
//   //
//   // }
//
//   //creating local notification object
//   late FlutterLocalNotificationsPlugin localNotifications;
//
//   //initialize the local notification object
//   @override
//
//
//   Future _showNotification() async {
//     var androidDetails = new AndroidNotificationDetails(
//         "channelId",
//         "channelName",
//         channelDescription: "Description",
//         importance: Importance.max,
//         priority: Priority.max,
//     );
//     // var androidDetails = AndroidNotificationDetails(id: 1, channelName:);
//
//     var generalNotificationDetails = new NotificationDetails(android: androidDetails);
//     await localNotifications.show(0, "harikishore", "yash", generalNotificationDetails);
//   } // used to display notifications
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//         onPressed: () {
//           _showNotification();
//         },
//         child: Text("Button"));
//   }
// }
//
//
//
//


import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter alarm clock example'),
        ),
        body: Center(
            child: Column(children: <Widget>[
              Container(
                margin: const EdgeInsets.all(25),
                child: TextButton(
                  child: const Text(
                    'Create alarm at 11:51',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onPressed: () {
                    FlutterAlarmClock.createAlarm(11, 51);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(25),
                child: TextButton(
                  child: const Text(
                    'Show alarms',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onPressed: () {
                    FlutterAlarmClock.showAlarms();
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(25),
                child: TextButton(
                  child: const Text(
                    'Create timer for 42 seconds',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onPressed: () {
                    FlutterAlarmClock.createTimer(42);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(25),
                child: TextButton(
                  child: const Text(
                    'Show Timers',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onPressed: () {
                    FlutterAlarmClock.showTimers();
                  },
                ),
              ),
            ])),
      ),
    );
  }
}