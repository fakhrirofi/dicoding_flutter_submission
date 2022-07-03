import 'package:flutter/material.dart';
import 'package:rofi_chat/main_screen.dart';
import 'package:flutter/services.dart';

void main() => runApp(const RofiChat());

class RofiChat extends StatelessWidget {
  const RofiChat({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 22, 22, 22),
          primarySwatch: Colors.green),
      title: "RofiChat",
      home: const MainScreen(),
    );
  }
}
