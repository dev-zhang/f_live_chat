
import 'dart:async';

import 'package:flutter/services.dart';

class FLiveChat {
  static const MethodChannel _channel =
      const MethodChannel('f_live_chat');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
