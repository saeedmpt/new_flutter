import 'package:flutter/material.dart';
import 'package:whatsapp_app/models/chat_models.dart';

class ChatSingleScreen extends StatelessWidget {
  final ChatModels data;

  ChatSingleScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: new Scaffold(
        appBar: new AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                new GestureDetector(
                  onTap: () {
                    Navigator.pop(context, "از چت با ${data.name} برگشتی داداچ");
                  },
                  child: new Icon(Icons.arrow_back),
                ),
                new SizedBox(
                  width: 10,
                ),
                new CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey,
                  foregroundImage: NetworkImage(data.image),
                ),
                new SizedBox(
                  width: 10,
                ),
                new Text(
                  data.name,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            )),
        body: new Center(child: new Text(data.message)),
      ),
    );
  }
}
