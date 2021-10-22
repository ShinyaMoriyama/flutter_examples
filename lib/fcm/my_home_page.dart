import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:dio/dio.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void proccessFirebaseMessaging() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    print('From terminated');
    print(initialMessage?.data);
    // if (initialMessage?.data['type'] == 'chat') {
    // Navigator.pushNamed(context, '/chat',
    //     arguments: ChatArguments(initialMessage));
    // }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    // ********* Run when opening from the backgound *********
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('onMessageOpenedApp');
      print(message.data);
      // if (message.data['type'] == 'chat') {
      // Navigator.pushNamed(context, '/chat',
      //     arguments: ChatArguments(message));
      // }
    });
  }

  @override
  void initState() {
    super.initState();

    // proccessFirebaseMessaging();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: Text('Send Notification'),
                onPressed: _showMaterialDialog,
              ),
              ElevatedButton(
                child: Text('Show Cupertino Dialog'),
                onPressed: _showCupertinoDialog,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text("Material Dialog"),
              content: new Text("Hey! I'm Coflutter!"),
              actions: <Widget>[
                TextButton(
                  child: Text('Close me!'),
                  onPressed: () {
                    sendPush('Notification', 'From the app');
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  Future<void> sendPush(String title, String message) async {
    // For V1:DioError [DioErrorType.response]: Http status error [401]
    // Credencials may be neeeded but default one
    // For Legacy:successfully worked

    const server_key =
        "AAAAfcHX-fc:APA91bHn-VNqEhWezoYhUCxx4dHwVbffRKHqdRTTNXZOY7ABTjTj0igmgjC_CHr_WHRQUK36HJNm4IcX8V9T0gvQFdSWp3BYn020uNcS0erpd5noIRgVRnZn_r2fApRUc470jlMrBOpR";

    final token = await FirebaseMessaging.instance.getToken();
    print(token);
    // For V1
    // final jsonBody = {
    //   "message": {
    //     "token": token,
    //     "notification": {
    //       "body": "This is an FCM notification message!",
    //       "title": "FCM Message"
    //     }
    //   }
    // };

    // For V1
    // final jsonBody = <String, dynamic>{
    //   "message": <String, dynamic>{
    //     "notification": <String, dynamic>{
    //       "title": title,
    //       "body": message,
    //     },
    //     "data": <String, dynamic>{
    //       "click_action": "FLUTTER_NOTIFICATION_CLICK",
    //       "route": "your_route_name_if_needed",
    //     },
    //     "token": token,
    //   }
    // };

    // For Legacy
    final jsonBody = <String, dynamic>{
      "notification": <String, dynamic>{
        "title": title,
        "body": message,
      },
      "data": <String, dynamic>{
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "route": "your_route_name_if_needed",
      },
      "to": token,
    };

    const url_v1 =
        "https://fcm.googleapis.com/v1/projects/flutter-morisin-myapp/messages:send";
    const url_legacy = "https://fcm.googleapis.com/fcm/send";
    const url = url_legacy;

    const authorization_legacy = "key=$server_key";
    const authorization_v1 = "Bearer $server_key";
    const authorization = authorization_legacy;

    try {
      await Dio().post(url,
          data: jsonBody,
          options: Options(headers: {
            "Authorization": authorization,
            "Content-Type": "application/json"
          }));
    } on Exception catch (e) {
      print(e);
    }
  }

  _showCupertinoDialog() {
    showDialog(
        context: context,
        builder: (_) => new CupertinoAlertDialog(
              title: new Text("Cupertino Dialog"),
              content: new Text("Hey! I'm Coflutter!"),
              actions: <Widget>[
                TextButton(
                  child: Text('Close me!'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }
}
