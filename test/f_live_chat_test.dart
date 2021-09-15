import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:f_live_chat/f_live_chat.dart';

void main() {
  const MethodChannel channel = MethodChannel('f_live_chat');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FLiveChat.platformVersion, '42');
  });
}
