import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'spo2_provider.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Spo2Provider()..updateData(),
      child: MaterialApp(
        title: '血氧監測器',
        theme: ThemeData(primarySwatch: Colors.red),
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
