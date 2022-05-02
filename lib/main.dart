import 'package:firebase_core/firebase_core.dart';
import 'package:universal_platform/universal_platform.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'myglobals.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui' as ui;
// import 'package:animated_background/animated_background.dart';

void main() async {
  runApp(MaterialApp(home: MyApp()));
  FirebaseMessaging.instance.getToken().then(print);
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

// Future<dynamic> myBackgroundHandler(Map<String, dynamic> message) {
//   print(message['link']);
//   return MyAppState()._showNotification(message);
// }

class MyAppState extends State<MyApp> {
  // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  //     FlutterLocalNotificationsPlugin();

  refresh() {
    // print("looks like it is working");

    setState(() {
      int currTime = timeCondition();
      int currWeek = weekCondition();
      print(currTime);

      if (currWeek == 0 || currTime == 0) {
        linkName = 'chillll';
        link =
            "https://cache.lovethispic.com/uploaded_images/242927-Just-Chill-Out.jpg";
      } else {
        linkName = table[currWeek][currTime];
        link = hashtable[linkName];
      }
    });
  }

  Widget raisedButton() {
    return RaisedButton(
      // onLongPress: () {
      //   setState(() {
      //     linkName = "Worked";
      //   });
      // },
      // padding: EdgeInsets.only(left: 1),
      splashColor: Colors.green,
      onPressed: _launchURL,
      child: Text(linkName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
      // animationDuration:
      //     Duration(milliseconds: 50,
    );
  }

  _launchURL() async {
    // print(link);
    String url = link;
    // print(url);
    // print("yo man inside launch url");
    ;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Stack(fit: StackFit.expand, children: <Widget>[
      new Image.asset(
        'assets/bg.jpg',
        fit: BoxFit.fitHeight,
      ),
      new Scaffold(
        // backgroundColor: Colors.blue,
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.black26.withOpacity(0.5),
          title: Text(
            'Now Never miss class ;-)',
            style: TextStyle(
              fontFamily: "cursive",
              fontSize: 30,
              foreground: Paint()
                // ..style = PaintingStyle.stroke
                // ..strokeWidth = 1
                ..color = Colors.white60,
            ),
          ),
          titleTextStyle: TextStyle(fontFamily: 'Raleway'),
          elevation: 0.0,
        ),
        backgroundColor: Colors.transparent,
        body: Center(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10.5),
                child: new BackdropFilter(
                    filter: new ui.ImageFilter.blur(
                      sigmaX: 7.5,
                      sigmaY: 7.5,
                    ),
                    child: Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width / 2.8,
                        // margin: EdgeInsets.all(150.0),
                        // padding: EdgeInsets.all(200.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFB4C56C).withOpacity(0.02),
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        child: Container(
                            padding: EdgeInsets.all(12),
// padding: EdgeInsets.only.left(12)-->quite helpful

                            // child: Expanded( --->this is really use full for row widget

                            child: Row(children: [
                              Expanded(
                                  flex: 1,
                                  child: Opacity(
                                      opacity: 0.5, child: raisedButton())),
                              FlatButton(
                                  onPressed: refresh,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  // onPressed: refresh,
                                  child: Icon(
                                    Icons.refresh_outlined,
                                    color: Colors.white,
                                  ))
                            ])))))),
        // )
      ),
    ]));
  }

//Leave on background
// ignore: non_constant_identifier_names
  void firebaseOnMessage() {
    FirebaseMessaging.onMessage.listen((message) {
      print(message);
      setState(() {
        link = message.notification.body;
        print("yessss");
      });
    });
  }

  void onFirebaseOpenedApp() {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print("yoo this is on message");
      setState(() {
        link = message.notification.body;
      });
    });
  }

  @override
  void initState() {
    firebaseOnMessage();
    onFirebaseOpenedApp();
    // var initializationSettingsAndroid =
    //     AndroidInitializationSettings('@mipmap/ic_launcher');

    // var initializationSettings =
    //     InitializationSettings(android: initializationSettingsAndroid);
    // flutterLocalNotificationsPlugin.initialize(initializationSettings,
    //     onSelectNotification: selectNotification);
    super.initState();

    // _firebaseMessaging.configure(
    //     onBackgroundMessage: myBackgroundHandler,
    //     onMessage: (Map<String, dynamic> message) async {
    //       print("onMessage: $message");
    //       setState(() {
    //         link = message['notification']['body'];
    //       });
    //       showDialog(
    //           context: context,
    //           builder: (context) {
    //             return AlertDialog(
    //               title: Text('new message arived'),
    //               content: Text(
    //                   'i want ${message['notification']['title']} for ${message['notification']['body']}'),
    //               actions: <Widget>[
    //                 FlatButton(
    //                   child: Text('Ok'),
    //                   onPressed: () {
    //                     Navigator.of(context).pop();
    //                   },
    //                 ),
    //               ],
    //             );
    //           });
    //     },
    //     onResume: (Map<String, dynamic> message) async {
    //       // print("this is resume");
    //       // print(message['data']['link']);
    //       setState(() {
    //         link = message['data']['link'];
    //       });
    //       _launchURL();
    //     },
    //     onLaunch: (Map<String, dynamic> message) async {
    //       // print("this is launch");
    //       // print(message['data']['link']);
    //       setState(() {
    //         link = message['data']['link'];
    //       });
    //       _launchURL();
    //     });

    // getTokenz();
  }
}
