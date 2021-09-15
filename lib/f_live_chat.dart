import 'dart:async';

import 'package:flutter/services.dart';

class FLiveChat {
  static const MethodChannel _channel = const MethodChannel('f_live_chat');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<void> init({
    required String licenseId,
    String? groupId,
    String? name,
    String? email,
  }) async {
    final params = <String, dynamic>{};
    params['license_id'] = licenseId;
    if (groupId != null) {
      params['group_id'] = groupId;
    }
    if (email != null) {
      params['email'] = email;
    }
    if (name != null) {
      params['name'] = name;
    }
    await _channel.invokeMethod('init', params);
  }

  static Future<void> setVariable(Map<String, dynamic> variables) async {
    await _channel.invokeMethod('setVariable', variables);
  }

  static Future<void> clearSession() async {
    await _channel.invokeMethod('clearSession');
  }

  static Future<void> showChat() async {
    await _channel.invokeMethod('showChat');
  }
}
