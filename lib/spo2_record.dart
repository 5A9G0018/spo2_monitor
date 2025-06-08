import 'package:hive/hive.dart';

part 'spo2_record.g.dart';

@HiveType(typeId: 0)
class Spo2Record extends HiveObject {
  @HiveField(0)
  final int spo2;

  @HiveField(1)
  final int heartRate;

  @HiveField(2)
  final DateTime timestamp;

  Spo2Record({required this.spo2, required this.heartRate, required this.timestamp});
}
