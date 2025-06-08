import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'spo2_record.dart';

class Spo2Provider extends ChangeNotifier {
  int spo2 = 98;
  int heartRate = 72;
  List<Spo2Record> history = [];

  void updateData(int newSpo2, int newHeartRate) {
    spo2 = newSpo2;
    heartRate = newHeartRate;
    notifyListeners();
  }

  void saveRecord() async {
    final box = Hive.box<Spo2Record>('spo2_records');
    final record = Spo2Record(
      spo2: spo2,
      heartRate: heartRate,
      timestamp: DateTime.now(),
    );
    await box.add(record);
    loadHistory();
  }

  void loadHistory() {
    final box = Hive.box<Spo2Record>('spo2_records');
    history = box.values.toList().reversed.toList();
    notifyListeners();
  }
}
