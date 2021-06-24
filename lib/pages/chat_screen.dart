import 'package:flutter/material.dart';
import 'package:whatsapp_app/chat/chat_single_screen.dart';
import 'package:whatsapp_app/models/chat_models.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 6),
      itemCount: dummyChatData.length,
      itemBuilder: (BuildContext context, int index) {
        /*return new Padding(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new Row(children: [
                  new Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.grey,
                      foregroundImage: NetworkImage(dummyChatData[index].image),
                    ),
                  ),
                  Text(
                    dummyChatData[index].name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ]),
                new Text(dummyChatData[index].time),
              ],
            ));*/
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  _navigatorAndAwaitForCallBack(context, dummyChatData[index]);
                },
                child: new ListTile(
                  leading: new Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.grey,
                      foregroundImage: NetworkImage(dummyChatData[index].image),
                    ),
                  ),
                  title: new Text(dummyChatData[index].name),
                  subtitle: new Text(dummyChatData[index].message),
                  trailing: new Text(
                    dummyChatData[index].time,
                    style: TextStyle(color: Colors.grey),
                  ),
                  enableFeedback: true,
                ),
              ),
              index != dummyChatData.length - 1
                  ? new Divider(
                      height: 10,
                    )
                  : new Container()
            ],
          ),
        );
      },
    );
  }

  void _navigatorAndAwaitForCallBack(
      BuildContext context, ChatModels data) async {
    final result = await Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => ChatSingleScreen(data: data)));
    print(result);
    ScaffoldMessenger.of(context)
        .showSnackBar(new SnackBar(content: new Text(result,style: TextStyle(fontFamily: 'isn'),)));
  }
}
