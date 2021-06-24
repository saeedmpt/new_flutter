import 'package:flutter/material.dart';
import 'package:whatsapp_app/models/chat_models.dart';
import 'package:whatsapp_app/pages/call_screen.dart';
import 'package:whatsapp_app/pages/camera_screen.dart';
import 'package:whatsapp_app/pages/chat_screen.dart';
import 'package:whatsapp_app/pages/status_screen.dart';
import 'package:whatsapp_app/settings_screen.dart';

class WhatsAppHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new WhatsAppHomeState();
}

class WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  static const String routeSetting = '/settings';
  late TabController tabController;
  late SliverAppBar mainAppBar = new SliverAppBar(
    pinned: true,
    floating: true,
    title: new Text("واتساپ"),
    actions: <Widget>[
      new IconButton(
        icon: new Icon(Icons.search),
        onPressed: () {
          setState(() {
            _currentAppbar = 1;
          });
        },
        color: Colors.white,
      ),
      new PopupMenuButton<String>(
        onSelected: (String value) {
          if (value == 'setting') {
            /*Navigator.push(context, new MaterialPageRoute(
                  builder:  (context)=>SettingsScreen()));*/
            Navigator.pushNamed(context, routeSetting,
                arguments: new ChatModels("name", "message", "time", "image"));
          } else {
            print(value);
          }
        },
        itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [new Text("گروه جدید")],
              ),
              value: "newGroup",
            ),
            PopupMenuItem(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [new Text("تنظیمات")],
              ),
              value: "setting",
            )
          ];
        },
      )
    ],
    elevation: 6,
    bottom: new TabBar(
      tabs: [
        new Icon(Icons.camera_alt),
        new Text("چت‌ها"),
        new Text("وضعیت"),
        new Text("تماس‌ها")
      ],
      controller: tabController,
      indicatorColor: Colors.white,
    ),
  );
  late SliverAppBar searchAppBar = new SliverAppBar(
    automaticallyImplyLeading: false,
    // Don't show the leading button
    pinned: true,
    backgroundColor: Colors.white,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              setState(() {
                _currentAppbar = 0;
              });
            },
            color: Colors.black,
          ),
        ),
        new Flexible(
          child: new TextField(
            decoration: InputDecoration(
                hintText: "جستجو ...",
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: Colors.black),
          ),
        )
        // Your widgets here
      ],
    ),
    elevation: 6,
  );
  late List<SliverAppBar> appBarList;

  int _currentAppbar = 0;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 4, vsync: this, initialIndex: 1);
    appBarList = [mainAppBar, searchAppBar];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [appBarList[_currentAppbar]];
          },
          body: _currentAppbar == 0
              ? new TabBarView(children: [
                  new CameraScreen(),
                  new ChatScreen(),
                  new StatusScreen(),
                  new CallScreen()
                ], controller: tabController)
              : Center(child: new Text('search'))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('object');
        },
        child: new Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
    );
  }
}
