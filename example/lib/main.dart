import 'package:f_live_chat/f_live_chat.dart';
import 'package:flutter/material.dart';

import 'constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SizedBox.expand(
          child: Column(
            children: [
              OutlinedButton(
                onPressed: () async {
                  await FLiveChat.init(
                    licenseId: kLicenseId,
                    groupId: kGroupId,
                    name: kName,
                    email: kEmail,
                  );
                },
                child: Text('init'),
              ),
              OutlinedButton(
                onPressed: () async {
                  await FLiveChat.showChat();
                },
                child: Text('present chat'),
              ),
              OutlinedButton(
                onPressed: () async {
                  await FLiveChat.setVariable({
                    'goods_id': '12345678',
                    'url': 'https://www.baidu.com',
                  });
                },
                child: Text('set variables'),
              ),
              OutlinedButton(
                onPressed: () async {
                  await FLiveChat.clearSession();
                },
                child: Text('clear session'),
              ),
              OutlinedButton(
                onPressed: () async {
                  await FLiveChat.updateConfiguration(
                    email: 'abc@gmail.com',
                    name: 'abc',
                  );
                  print('====update configuration success');
                },
                child: Text('update configuration'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
