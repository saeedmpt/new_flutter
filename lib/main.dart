import 'package:flutter/material.dart';
import 'package:whatsapp_app/settings_screen.dart';
import 'package:whatsapp_app/splash_screen.dart';
import 'package:whatsapp_app/whatsapp_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'isn',
        primaryColor: Colors.green,
        accentColor: Colors.orange,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        WhatsAppHomeState.routeSetting: (context) => new SettingsScreen()
      },
      home: new Directionality(
          textDirection: TextDirection.rtl, child: new WhatsAppHome()),
    );
  }
}
