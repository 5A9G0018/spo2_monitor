import 'package:flutter/material.dart';
import 'package:flutter_thingspeak/flutter_thingspeak.dart';

class Spo2Provider extends ChangeNotifier {
  int spo2 = 0;
  int heartRate = 0;
  List feeds = [];

  Future<void> updateData() async {
    final flutterThingSpeak = FlutterThingspeakClient(
      channelID: '2982935',
      readApiKey: '2C349AVSSYJWLKFZ', // 指定 Read API Key
    );
    await flutterThingSpeak.initialize();
    final result = await flutterThingSpeak.getAllData();

    feeds = result['feeds'];

    for (var feed in feeds) {
      spo2 = int.parse(feed['field1']);
      heartRate = int.parse(feed['field2']);
    }

    notifyListeners();
  }
}
