import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'spo2_provider.dart';
import 'spo2_record.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(Spo2RecordAdapter());
  await Hive.openBox<Spo2Record>('spo2_records');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Spo2Provider()..loadHistory(),
      child: MaterialApp(
        title: '血氧監測器',
        theme: ThemeData(primarySwatch: Colors.red),
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
