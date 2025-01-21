import 'dart:async';
import 'package:earthquake_alarm/HomePage.dart';
import 'package:earthquake_alarm/api/server.dart';
import 'package:earthquake_alarm/global/TextField2.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //
  final String audio = 'alarm.mp3';

  void playAlarm() {
    FlameAudio.bgm.play(audio);
  }

  void stopAlarm() {
    FlameAudio.bgm.stop();
  }

  //
  final String ip = "192.168.223.156:8000";
  final TextField2Elem ipInpt = TextField2Elem(
    key: "addr",
    hint: "Server IP address",
    icn: Icons.wifi,
  );
  //
  bool connected = false;
  bool vibration = false;
  //

  Future<void> startChecker() async {
    Timer.periodic(const Duration(milliseconds: 1000), (Timer _) async {
      try {
        vibration = await getVibration(ipInpt.ctrl.text);
        if (vibration) {
          playAlarm();
          _.cancel();
          setState(() {});
        }
      } catch (e) {
        connected = false;
        setState(() {});
        _.cancel();
      }
    });
  }

  @override
  void initState() {
    FlameAudio.bgm.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (ipInpt.ctrl.text == "") ipInpt.ctrl.text = ip;

    return MaterialApp(
      title: "QuakeGuard",
      debugShowCheckedModeBanner: false,
      home: HomePage(
        vib: vibration,
        ctrl: ipInpt,
        btnText:
            vibration ? "stop the alert" : "connect${connected ? "ed" : ""}",
        btnFunc: () async {
          if (!connected) {
            connected = true;
            setState(() {});
            //
            await startChecker();
          }
          if (connected && vibration) {
            try {
              await stopVibration(ipInpt.ctrl.text);
              stopAlarm();
              //
              vibration = await getVibration(ipInpt.ctrl.text);
              setState(() {});
              //
              await startChecker();
            } catch (e) {
              connected = false;
              setState(() {});
            }
          }
        },
      ),
    );
  }
}
