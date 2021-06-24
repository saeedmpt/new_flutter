import 'package:flutter/material.dart';
import 'package:whatsapp_app/models/chat_models.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ChatModels;

    return Center(child: new Text(args.name));
  }
}
