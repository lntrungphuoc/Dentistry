import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TestCloudMessaging extends StatefulWidget {
  const TestCloudMessaging({super.key});

  @override
  State<TestCloudMessaging> createState() => _TestCloudMessagingState();
}

class _TestCloudMessagingState extends State<TestCloudMessaging> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  late List<Message> _listMessage;

  _getToken() {
    _firebaseMessaging.getToken().then((deviceToken) {
      print("Device token: $deviceToken");
    });
  }

  _configureFirebaseListeners() {
    // _firebaseMessaging.on
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification!;
      _setMessage(message);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listMessage = <Message>[];
    _getToken();
    _configureFirebaseListeners();
  }

  _setMessage(RemoteMessage message) {
    final notification = message.notification;
    final data = message.data;
    inspect(notification);
    final String? title = notification?.title;
    final String? body = notification?.body;
    final String mess = data['message'];
    setState(() {
      Message m = Message(title, body, mess);
      _listMessage.add(m);
      // inspect(_listMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: _listMessage == null ? 0 : _listMessage.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text(_listMessage[index].message == null
                    ? "bi null"
                    : _listMessage[index].message),
              ),
            );
          }),
    );
  }
}

class Message {
  late String title;
  late String body;
  late String message;
  Message(title, body, message) {
    this.title = title;
    this.body = body;
    this.message = message;
  }
}
