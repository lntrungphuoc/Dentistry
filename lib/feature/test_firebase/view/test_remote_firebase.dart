import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TestRemoteFirebase extends StatefulWidget {
  const TestRemoteFirebase({super.key});

  @override
  State<TestRemoteFirebase> createState() => _TestRemoteFirebaseState();
}

class _TestRemoteFirebaseState extends State<TestRemoteFirebase> {
  final defaultGreetingText = "Hello ae";
  final Map<String, dynamic> _availableGreetingColor = {
    "lightBlue": Colors.lightBlue,
    "red": Colors.red
  };
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;
  final String defaultGreetingColor = "lightBlue";

  Future<void> _initConfig() async {
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: Duration(seconds: 0),
        minimumFetchInterval: Duration(hours: 0)));
    _fetchConfig();
  }

  void _fetchConfig() async {
    await _remoteConfig.fetchAndActivate();
    // var remoteConfigTemplate = await _remoteConfig.getAll();
    // print(remoteConfigTemplate);
  }

  @override
  void initState() {
    _initConfig();
    super.initState();
  }

  String getGreetingColor() {
    return _remoteConfig.getString('background_color').isNotEmpty
        ? _remoteConfig.getString('background_color')
        : defaultGreetingColor;
  }

  String getGreetingText() {
    return _remoteConfig.getString('welcome_message').isNotEmpty
        ? _remoteConfig.getString('welcome_message')
        : defaultGreetingText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: _availableGreetingColor[
      //     _remoteConfig.getString('background_color').isNotEmpty
      //         ? _remoteConfig.getString('background_color')
      //         : defaultGreetingColor],
      body: Center(
        child: Container(
          color: _availableGreetingColor[getGreetingColor()],
          child: Text(getGreetingText()),
        ),
      ),
    );
  }
}
